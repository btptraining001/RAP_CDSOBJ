@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS : Build In Function'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_I_BUILDINFUNC
  as select from zvkfeb01_dt_demo

{
  key id,

      //-- Source fields for reference
      category,
      region,
      char_field1,
      is_active,
      int4_field,
      dec_field,
      @Semantics.amount.currencyCode: 'currency_key'
      curr_field,
      currency_key,
      @Semantics.quantity.unitOfMeasure: 'unit_key'
      quan_field,
      unit_key,
      date_field,

      //============================================================
      // A. CASE - Simple
      // Matches a single field against fixed values.
      // Syntax: CASE field WHEN val THEN result ... ELSE ... END
      //============================================================

      //-- A1: Map is_active flag to readable label
      //   'X' → 'Active'   ' ' → 'Inactive'
      case is_active
        when 'X' then 'Active'
        when ' ' then 'Inactive'
        else          'Unknown'
      end                                       as status_label,

      //-- A2: Map category to full description
      case category
        when 'ELECTRON' then 'Electronics'
        when 'FOOD'     then 'Food Items'
        when 'CASE'     then 'Case Demo'
        else                 'Other'
      end                                       as category_desc,

      //-- A3: Map region to discount percentage (as CHAR)
      case region
        when 'NORTH' then '10%'
        when 'SOUTH' then '08%'
        when 'EAST'  then '05%'
        when 'WEST'  then '12%'
        else              '00%'
      end                                       as region_discount,

      //============================================================
      // B. CASE - Searched
      // Evaluates boolean conditions in order, first match wins.
      // Syntax: CASE WHEN condition THEN result ... ELSE ... END
      //============================================================

      //-- B1: Classify dec_field into value bands
      //   id=00001: 1200.00 → 'High'
      //   id=00004:   45.00 → 'Low'
      case
        when dec_field >= 1000 then 'High'
        when dec_field >= 100  then 'Medium'
        when dec_field >= 0    then 'Low'
        else                        'Negative'
      end                                       as value_band,

      //-- B2: Derive priority from is_active + dec_field combined
      //   Active + High value  → 'Critical'
      //   Active + Low value   → 'Normal'
      //   Inactive             → 'On Hold'
      case
        when is_active = 'X' and dec_field >= 500 then 'Critical'
        when is_active = 'X' and dec_field <  500 then 'Normal'
        when is_active = ' '                       then 'On Hold'
        else                                            'Unknown'
      end                                       as priority,

      //-- B3: INT4 range classification
      //   id=00001: 50000 → 'Very High'
      //   id=00004:  1200 → 'Low'
      case
        when int4_field >  10000 then 'Very High'
        when int4_field >   1000 then 'High'
        when int4_field >    100 then 'Medium'
        else                          'Low'
      end                                       as int4_band,

      //============================================================
      // C. CASE - Nested
      // A CASE expression inside another CASE THEN or ELSE clause.
      //============================================================

      //-- C1: Outer CASE on category, inner CASE on is_active
      //   ELECTRON + Active   → 'Tech-Active'
      //   ELECTRON + Inactive → 'Tech-Inactive'
      //   FOOD     + Active   → 'Food-Active'
      //   FOOD     + Inactive → 'Food-Inactive'
      case category
        when 'ELECTRON' then
          case is_active
            when 'X' then 'Tech-Active'
            else          'Tech-Inactive'
          end
        when 'FOOD' then
          case is_active
            when 'X' then 'Food-Active'
            else          'Food-Inactive'
          end
        else 'Other'
      end                                       as nested_case_label,

      //-- C2: CASE result used in arithmetic
      //   Apply discount multiplier based on region using CASE
      //   then multiply with dec_field
      dec_field *
        case region
          when 'NORTH' then cast( '0.90' as abap.dec(4,2) )
          when 'SOUTH' then cast( '0.92' as abap.dec(4,2) )
          when 'EAST'  then cast( '0.95' as abap.dec(4,2) )
          when 'WEST'  then cast( '0.88' as abap.dec(4,2) )
          else               cast( '1.00' as abap.dec(4,2) )
        end                                     as discounted_amount,

      //============================================================
      // D. COALESCE
      // Returns the first non-null argument.
      // In CDS, DB fields that have initial values are not truly NULL
      // unless they come from an outer join. COALESCE is most useful
      // after a LEFT OUTER JOIN where unmatched rows produce NULLs.
      // Here we demonstrate its syntax and logic with NULLIF to
      // artificially create a NULL from a zero value first.
      //
      // NULLIF( arg1, arg2 ) → returns NULL if arg1 = arg2
      //                        else returns arg1
      //============================================================


      //============================================================
      // E. CURRENCY_CONVERSION
      // Converts curr_field from source currency to a target currency.
      // Uses exchange rates from table TCURR (maintained via OB08).
      // error_handling = 'SET_TO_NULL' → returns null if rate missing.
      // Mandatory params: amount, source_currency, target_currency,
      //                   exchange_rate_date
      //============================================================

      //-- E1: Convert to EUR using date_field as exchange rate date
      //   id=00001: 1199.99 USD → EUR (rate from TCURR on 20250101)
      @Semantics.amount.currencyCode: 'currency_key'
      currency_conversion(
        amount             => curr_field,
        source_currency    => currency_key,
        target_currency    => cast( 'EUR' as abap.cuky ),
        exchange_rate_date => date_field,
        error_handling     => 'SET_TO_NULL'
      )                                         as amount_in_eur,

      //-- E2: Convert to USD using system date as exchange rate date
      //   Useful when you always want today's rate
      @Semantics.amount.currencyCode: 'currency_key'
      currency_conversion(
        amount             => curr_field,
        source_currency    => currency_key,
        target_currency    => cast( 'USD' as abap.cuky ),
        exchange_rate_date => $session.system_date,
        error_handling     => 'SET_TO_NULL'
      )                                         as amount_in_usd,

      //============================================================
      // F. UNIT_CONVERSION
      // Converts quan_field from its stored unit to a target unit.
      // Uses conversion rules from T006 (maintained via CUNI).
      // error_handling = 'SET_TO_NULL' → returns null if rule missing.
      // Mandatory params: quantity, source_unit, target_unit
      //
      // Our data has unit_key = 'EA' or 'KG'.
      // EA → KG has no standard conversion → returns NULL (safe).
      // KG → G  has standard conversion → returns actual value.
      //============================================================

      //-- F1: Convert quantity to KG
      //   KG rows: 25.000 KG → 25.000 KG (same unit, no change)
      //   EA rows: 10.000 EA → NULL (no EA→KG rule exists)
      @Semantics.quantity.unitOfMeasure: 'unit_key'
      unit_conversion(
        quantity       => quan_field,
        source_unit    => unit_key,
        target_unit    => abap.unit'KG',
        error_handling => 'SET_TO_NULL'
      )                                         as qty_in_kg,

      //-- F2: Convert quantity to G (grams)
      //   KG rows: 25.000 KG → 25000.000 G
      //   EA rows: NULL (no EA→G rule)
      @Semantics.quantity.unitOfMeasure: 'unit_key'
      unit_conversion(
        quantity       => quan_field,
        source_unit    => unit_key,
        target_unit    => abap.unit'G',
        error_handling => 'SET_TO_NULL'
      )                                         as qty_in_g,

      //============================================================
      // G. SESSION VARIABLES
      // Runtime values injected by the CDS framework.
      // No parameters needed - just reference directly.
      //============================================================


      //-- G2: Current client (equivalent to SY-MANDT)
      $session.client                           as current_client,

      //-- G3: Current system date (equivalent to SY-DATUM)
      $session.system_date                      as today,

      //-- G4: Logon language (equivalent to SY-LANGU)
      $session.system_language                  as logon_language,

      //-- G5: Days between record's date and today
      //   Useful for age calculations
      dats_days_between( date_field,
                         $session.system_date ) as days_since_date
}

where
     category = 'ELECTRON'
  or category = 'FOOD'
  or category = 'CASE'
