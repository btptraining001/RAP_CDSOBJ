@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS : CASE'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_I_CASE

  as select from zvkfeb01_dt_demo

{
  key id,

      //-- Source fields shown for reference
      category,
      region,
      char_field1,
      is_active,
      int4_field,
      dec_field,
      dec_field2,

      //============================================================
      // 1. CASE SIMPLE
      // Compares ONE field against fixed values (equality only).
      // Syntax:
      //   CASE <field>
      //     WHEN <value1> THEN <result1>
      //     WHEN <value2> THEN <result2>
      //     ELSE <default>
      //   END
      // - Evaluates in order, returns first match.
      // - ELSE is optional. Without it, no-match returns initial.
      // - All THEN/ELSE results must be compatible types.
      //============================================================

      //-- 1a. Simple CASE on CHAR(1) field
      //   is_active: 'X'→'Active'  ' '→'Inactive'
      //   Expected: 00041=Active 00042=Inactive 00043=Active
      //             00044=Inactive 00045=Active
      case is_active
        when 'X' then 'Active'
        when ' ' then 'Inactive'
        else          'Unknown'
      end   as status_text,

      //-- 1b. Simple CASE on CHAR(10) field
      //   category: 'ELECTRON'→'Electronics'
      //             'FOOD'    →'Food Items'
      //             'CASE'    →'Case Demo'
      case category
        when 'ELECTRON' then 'Electronics'
        when 'FOOD'     then 'Food Items'
        when 'CASE'     then 'Case Demo'
        else                 'Other'
      end   as category_label,

      //-- 1c. Simple CASE on CHAR(10) returning numeric result
      //   Map region to a numeric discount rate (as DEC)
      //   NORTH→10  SOUTH→8  EAST→5  WEST→12  else→0
      case region
        when 'NORTH' then cast( 10 as abap.dec(4,0) )
        when 'SOUTH' then cast(  8 as abap.dec(4,0) )
        when 'EAST'  then cast(  5 as abap.dec(4,0) )
        when 'WEST'  then cast( 12 as abap.dec(4,0) )
        else               cast(  0 as abap.dec(4,0) )
      end   as discount_pct,

      //-- 1d. Simple CASE without ELSE clause
      //   When no WHEN matches, result is initial value (blank/0).
      //   NORTH→'Northern Zone'  SOUTH→'Southern Zone'
      //   EAST and WEST have no matching WHEN → initial (blank)
      case region
        when 'NORTH' then 'Northern Zone'
        when 'SOUTH' then 'Southern Zone'
      end   as zone_no_else,

      //============================================================
      // 2. CASE SEARCHED (Complex CASE)
      // Evaluates independent boolean conditions in sequence.
      // First condition that is TRUE returns its result.
      // Syntax:
      //   CASE
      //     WHEN <condition1> THEN <result1>
      //     WHEN <condition2> THEN <result2>
      //     ELSE <default>
      //   END
      // - Conditions can use: =, <>, <, >, <=, >=, AND, OR, NOT
      // - BETWEEN is also supported.
      //============================================================

      //-- 2a. Searched CASE on numeric range
      //   dec_field bands:
      //   >=1000→'High'  >=100→'Medium'  >=10→'Low'  else→'Very Low'
      //   00001=1200→'High'  00002=800→'Medium'  00044=0→'Very Low'
      case
        when dec_field >= 1000 then 'High'
        when dec_field >=  100 then 'Medium'
        when dec_field >=   10 then 'Low'
        else                        'Very Low'
      end   as amount_band,

      //-- 2b. Searched CASE with BETWEEN
      //   int4_field classification using ranges
      //   00041=500→'Medium'  00042=5000→'High'
      //   00043=50000→'Very High'  00044=0→'Zero'
      case
        when int4_field >  10000 then 'Very High'
        when int4_field >   1000 then 'High'
        when int4_field between 1 and 1000 then 'Medium'
        when int4_field =  0     then 'Zero'
        else                          'Negative'
      end   as int4_band,

      //-- 2c. Searched CASE with AND condition
      //   Combines two fields in one condition
      //   Active AND High amount → 'Premium'
      //   Active AND Low  amount → 'Standard'
      //   Inactive               → 'Suspended'
      case
        when is_active = 'X' and dec_field >= 100 then 'Premium'
        when is_active = 'X' and dec_field <  100 then 'Standard'
        when is_active = ' '                       then 'Suspended'
        else                                            'Unknown'
      end   as customer_tier,

      //-- 2d. Searched CASE with OR condition
      //   NORTH or SOUTH → 'Vertical'  EAST or WEST → 'Horizontal'
      case
        when region = 'NORTH' or region = 'SOUTH' then 'Vertical'
        when region = 'EAST'  or region = 'WEST'  then 'Horizontal'
        else                                            'Unknown'
      end   as axis_group,

      //-- 2e. Searched CASE with NOT condition
      //   Anything that is NOT active → 'Needs Review'
      case
        when not is_active = 'X' then 'Needs Review'
        else                          'Cleared'
      end   as review_flag,

      //-- 2f. Searched CASE returning numeric for calculation
      //   Assign a numeric weight per region (used below in arithmetic)
      case
        when region = 'NORTH' then cast( 3 as abap.int4 )
        when region = 'SOUTH' then cast( 2 as abap.int4 )
        when region = 'EAST'  then cast( 1 as abap.int4 )
        when region = 'WEST'  then cast( 4 as abap.int4 )
        else                        cast( 0 as abap.int4 )
      end   as region_weight,

      //============================================================
      // 3. CASE NESTED
      // A CASE expression placed inside the THEN or ELSE of
      // another CASE expression.
      // Use when the result depends on a hierarchy of conditions.
      //============================================================

      //-- 3a. Outer on category, inner on is_active
      //   ELECTRON + Active   → 'Tech-Active'
      //   ELECTRON + Inactive → 'Tech-Inactive'
      //   FOOD     + Active   → 'Food-Active'
      //   FOOD     + Inactive → 'Food-Inactive'
      //   CASE     + Active   → 'Demo-Active'
      //   CASE     + Inactive → 'Demo-Inactive'
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
        when 'CASE' then
          case is_active
            when 'X' then 'Demo-Active'
            else          'Demo-Inactive'
          end
        else 'Other'
      end   as nested_label,

      //-- 3b. Outer searched on dec_field, inner on region
      //   High amount in NORTH → 'Top Performer'
      //   High amount elsewhere → 'High'
      //   Low amount in EAST → 'Eastern Low'
      //   Low amount elsewhere → 'Low'
      case
        when dec_field >= 500 then
          case region
            when 'NORTH' then 'Top Performer'
            else              'High'
          end
        when dec_field < 100 then
          case region
            when 'EAST' then 'Eastern Low'
            else             'Low'
          end
        else 'Medium'
      end   as perf_label,

      //============================================================
      // 4. CASE INSIDE ARITHMETIC EXPRESSION
      // CASE can return a numeric value used directly in
      // an arithmetic expression.
      //============================================================

      //-- 4a. CASE discount multiplier applied to dec_field
      //   NORTH: 1200.00 * 0.90 = 1080.00
      //   SOUTH:  500.00 * 0.92 =  460.00
      //   EAST:    45.00 * 0.95 =   42.75
      //   WEST:    20.00 * 0.88 =   17.60
      dec_field *
        case region
          when 'NORTH' then cast( '0.90' as abap.dec(4,2) )
          when 'SOUTH' then cast( '0.92' as abap.dec(4,2) )
          when 'EAST'  then cast( '0.95' as abap.dec(4,2) )
          when 'WEST'  then cast( '0.88' as abap.dec(4,2) )
          else               cast( '1.00' as abap.dec(4,2) )
        end as discounted_value,

      //-- 4b. CASE used to apply a surcharge or deduction
      //   Active records get a 5% bonus added
      //   Inactive records get 10% deducted
      dec_field +
        ( dec_field *
          case is_active
            when 'X' then cast( '0.05' as abap.dec(4,2) )
            else           cast( '-0.10' as abap.dec(4,2) )
          end
        )   as adjusted_value,

      //============================================================
      // 5. CASE INSIDE STRING FUNCTION
      // CASE result passed as argument to a string function.
      //============================================================

      //-- 5a. UPPER applied to the result of CASE
      //   Active → 'ACTIVE'   Inactive → 'INACTIVE'
      upper(
        case is_active
          when 'X' then 'active'
          else          'inactive'
        end
      )     as status_upper,

      //-- 5b. CONCAT using CASE result
      //   Builds a label like 'NORTH - Active'
      concat(
        concat( region, ' - ' ),
        case is_active
          when 'X' then 'Active'
          else          'Inactive'
        end
      )     as region_status,

      //============================================================
      // 6. CASE ELSE NULL
      // Explicitly return NULL from ELSE branch.
      // NULL is different from initial/blank - used in outer joins
      // and COALESCE patterns.
      //============================================================

      //-- 6a. Only NORTH gets a label, all others get NULL
      case region
        when 'NORTH' then 'Headquarters'
        else null
      end   as hq_label,

      //-- 6b. Only zero int4 gets flagged, others get NULL
      case
        when int4_field = 0 then 'Zero Value'
        else null
      end   as zero_flag
}

where
     category = 'CASE'
  or category = 'ELECTRON'
  or category = 'FOOD'
