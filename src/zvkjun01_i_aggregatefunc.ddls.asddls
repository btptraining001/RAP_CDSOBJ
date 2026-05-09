@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS : Aggregate Function'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_I_AGGREGATEFUNC
  as select from zvkfeb01_dt_demo

{
  //------------------------------------------------------------
  // GROUP BY fields
  // All non-aggregated fields in SELECT must be in GROUP BY.
  // Our data produces 3 groups after filtering:
  //   ELECTRON / NORTH  : 2 rows (id 00001, 00002)
  //   ELECTRON / SOUTH  : 1 row  (id 00003)
  //   FOOD     / EAST   : 2 rows (id 00004, 00005)
  //------------------------------------------------------------
  category,
  region,
  currency_key,
  unit_key,

  //------------------------------------------------------------
  // 1. COUNT( * )
  //    Counts every row in the group including duplicates.
  //    ELECTRON/NORTH → 2
  //    ELECTRON/SOUTH → 1
  //    FOOD/EAST      → 2
  //------------------------------------------------------------
  count( * )                           as total_records,

  //------------------------------------------------------------
  // 2. COUNT( DISTINCT field )
  //    Counts distinct non-null values of the field per group.
  //    int1_field values per group:
  //    ELECTRON/NORTH : 10, 20   → 2
  //    ELECTRON/SOUTH : 30       → 1
  //    FOOD/EAST      : 40, 50   → 2
  //------------------------------------------------------------
  count( distinct int1_field )         as count_distinct_int1,

  //------------------------------------------------------------
  // 3. SUM( field )
  //    Totals all values of dec_field in the group.
  //    ELECTRON/NORTH : 1200.00 + 800.00 = 2000.00
  //    ELECTRON/SOUTH : 500.00           = 500.00
  //    FOOD/EAST      : 45.00  + 30.00  = 75.00
  //------------------------------------------------------------
  sum( dec_field )                     as sum_dec,

  //------------------------------------------------------------
  // 4. AVG( field )
  //    Calculates the mean value. Result type is always FLTP.
  //    Use only on plain numeric fields - not on curr/quan
  //    because AVG returns FLTP which conflicts with currency
  //    and quantity semantics annotations.
  //    ELECTRON/NORTH : (1200.00 + 800.00) / 2 = 1000.0
  //    ELECTRON/SOUTH : 500.00 / 1              = 500.0
  //    FOOD/EAST      : (45.00 + 30.00)  / 2  = 37.5
  //------------------------------------------------------------
  avg(dec_field  as abap.dec( 20, 2 )) as avg_dec,

  //------------------------------------------------------------
  // 5. MIN( field ) on numeric
  //    Returns the smallest value in the group.
  //    Applied to int4_field:
  //    ELECTRON/NORTH : min(50000, 80000) = 50000
  //    ELECTRON/SOUTH : min(30000)        = 30000
  //    FOOD/EAST      : min(1200, 800)    = 800
  //------------------------------------------------------------
  min( int4_field )                    as min_int4,

  //------------------------------------------------------------
  // 6. MAX( field ) on numeric
  //    Returns the largest value in the group.
  //    Applied to int4_field:
  //    ELECTRON/NORTH : max(50000, 80000) = 80000
  //    ELECTRON/SOUTH : max(30000)        = 30000
  //    FOOD/EAST      : max(1200, 800)    = 1200
  //------------------------------------------------------------
  max( int4_field )                    as max_int4,

  //------------------------------------------------------------
  // 7. MIN( field ) on CHAR
  //    MIN/MAX also work on character fields alphabetically.
  //    ELECTRON/NORTH : min('LAPTOP','PHONE') = 'LAPTOP'
  //    ELECTRON/SOUTH : min('TABLET')         = 'TABLET'
  //    FOOD/EAST      : min('RICE','WHEAT')   = 'RICE'
  //------------------------------------------------------------
  min( char_field1 )                   as min_char,

  //------------------------------------------------------------
  // 8. MAX( field ) on CHAR
  //    ELECTRON/NORTH : max('LAPTOP','PHONE') = 'PHONE'
  //    ELECTRON/SOUTH : max('TABLET')         = 'TABLET'
  //    FOOD/EAST      : max('RICE','WHEAT')   = 'WHEAT'
  //------------------------------------------------------------
  max( char_field1 )                   as max_char,

  //------------------------------------------------------------
  // 9. SUM / MIN / MAX on quantity field
  //    @Semantics.quantity.unitOfMeasure must be declared here
  //    pointing to unit_key in this view's SELECT list.
  //    ELECTRON/NORTH : 10.000 + 20.000 = 30.000
  //    ELECTRON/SOUTH : 5.000           = 5.000
  //    FOOD/EAST      : 25.000 + 10.000 = 35.000
  //------------------------------------------------------------
  @Semantics.quantity.unitOfMeasure: 'unit_key'
  sum( quan_field )                    as sum_quan,

  @Semantics.quantity.unitOfMeasure: 'unit_key'
  min( quan_field )                    as min_quan,

  @Semantics.quantity.unitOfMeasure: 'unit_key'
  max( quan_field )                    as max_quan,

  //------------------------------------------------------------
  // 10. SUM / MIN / MAX on currency amount field
  //     @Semantics.amount.currencyCode must be declared here
  //     pointing to currency_key in this view's SELECT list.
  //     AVG is intentionally excluded here because AVG always
  //     returns FLTP which is incompatible with currency semantics.
  //     ELECTRON/NORTH : 1199.99 + 799.99 = 1999.98
  //     ELECTRON/SOUTH : 499.99           = 499.99
  //     FOOD/EAST      : 44.50  + 29.75  = 74.25
  //------------------------------------------------------------
  @Semantics.amount.currencyCode: 'currency_key'
  sum( curr_field )                    as sum_curr,

  @Semantics.amount.currencyCode: 'currency_key'
  min( curr_field )                    as min_curr,

  @Semantics.amount.currencyCode: 'currency_key'
  max( curr_field )                    as max_curr

}


where
     category = 'ELECTRON'
  or category = 'FOOD'
group by
  category,
  region,
  currency_key,
  unit_key

having
  //------------------------------------------------------------
  // HAVING clause
  //    Filters groups AFTER aggregation - unlike WHERE which
  //    filters rows before aggregation.
  //    Here we keep only groups where total records >= 1
  //    and sum of dec_field > 50.00
  //    This excludes no groups from our data but demonstrates
  //    the syntax clearly.
  //    To see HAVING in action: change to count(*) > 1
  //    which would exclude ELECTRON/SOUTH (only 1 row).
  //------------------------------------------------------------
      count(*)         >= 1
  and sum( dec_field ) >  50.00
