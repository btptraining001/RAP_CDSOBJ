@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ASSIGNMENT_3'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_CDS_ASSIGNMENT_3

  // ============================================================
  // ASSIGNMENT 3 : Product Category Summary Report
  // ============================================================
  //
  // REQUIREMENT:
  // ------------
  // Your manager wants a summary report grouped by Category
  // and Region using the demo table (zvkfeb01_dt_demo).
  // The report should only include ELECTRON and FOOD categories.
  //
  // For each Category + Region group the report must show:
  //
  //  1. category_display  : Category name in UPPERCASE
  //
  //  2. region_display    : Region with LPAD to width 10 using '-'
  //                         e.g. '-----NORTH'
  //
  //  3. product_count     : Total number of products in the group
  //
  //  4. distinct_currency : Count of distinct currency codes
  //                         used in the group
  //
  //  5. total_amount      : SUM of dec_field for the group
  //
  //  6. avg_amount        : AVG of dec_field for the group
  //                         (result is FLTP)
  //
  //  7. min_stock         : MIN of int4_field in the group
  //
  //  8. max_stock         : MAX of int4_field in the group
  //
  //  9. stock_range       : Difference between max and min int4_field
  //                         i.e. max_stock - min_stock
  //
  // 10. amount_band       : Classify total_amount (SUM of dec_field):
  //                           >= 1000 → 'High'
  //                           >=  100 → 'Medium'
  //                           else    → 'Low'
  //
  // 11. region_discount   : Discount % based on region:
  //                           NORTH → 10,  SOUTH → 8
  //                           EAST  →  5,  WEST  → 12
  //                           else  →  0
  //
  // 12. discounted_total  : total_amount minus the discount:
  //                         total_amount - (total_amount *
  //                         region_discount / 100)
  //
  // 13. report_date       : Current system date (session variable)
  //
  // FILTER (HAVING):
  //   Only show groups where product_count >= 1
  //   AND total_amount > 0
  //
  // EXPECTED OUTPUT (from our data):
  //   ELECTRON / NORTH : count=2, total=2000.00, band='High'
  //   ELECTRON / SOUTH : count=1, total=500.00,  band='Medium'
  //   FOOD     / EAST  : count=2, total=75.00,   band='Low'
  //
  // ============================================================


  // ============================================================
  // SOLUTION
  // ============================================================

  as select from zvkfeb01_dt_demo

{
  //-- 1. Category in uppercase using string function UPPER
  upper( category )                     as category_display,

  //-- 2. Region left-padded to width 10 using '-'
  //      LPAD( RTRIM( field ), n, pad )
  lpad( rtrim( region, ' ' ), 10, '-' ) as region_display,

  //-- 3. Total product count in the group
  count( * )                            as product_count,

  //  //-- 4. Distinct currency codes in the group
  //  count( distinct currency_key )             as distinct_currency,

  //-- 5. SUM of dec_field
  sum( dec_field )                      as total_amount,

  //  //-- 6. AVG of dec_field (always returns FLTP)
  //  avg( dec_field )                           as avg_amount,

  //-- 7. MIN of int4_field
  min( int4_field )                     as min_stock,

  //-- 8. MAX of int4_field
  max( int4_field )                     as max_stock,

  //-- 9. Stock range = max - min (arithmetic on aggregates)
  max( int4_field ) - min( int4_field ) as stock_range,

  //-- 10. Classify total_amount using CASE searched
  //       First match wins - checked top to bottom
  case
    when sum( dec_field ) >= 1000 then 'High'
    when sum( dec_field ) >=  100 then 'Medium'
    else                               'Low'
  end                                   as amount_band,

  //-- 11. Region-based discount % via CASE simple
  case region
    when 'NORTH' then cast( 10 as abap.dec(4,0) )
    when 'SOUTH' then cast(  8 as abap.dec(4,0) )
    when 'EAST'  then cast(  5 as abap.dec(4,0) )
    when 'WEST'  then cast( 12 as abap.dec(4,0) )
    else               cast(  0 as abap.dec(4,0) )
  end                                   as region_discount,

  //-- 12. Discounted total
  //       total - (total * discount / 100)
  //       Uses DIVISION() for DEC/DEC division (/ not valid on DEC)
  //       ELECTRON/NORTH: 2000 - (2000*10/100) = 2000 - 200 = 1800
  //       ELECTRON/SOUTH: 500  - (500*8/100)   = 500  - 40  = 460
  //       FOOD/EAST     : 75   - (75*5/100)    = 75   - 3.75= 71.25
  sum( dec_field ) -
    division(
      sum( dec_field ) *
        case region
          when 'NORTH' then cast( 10 as abap.dec(4,0) )
          when 'SOUTH' then cast(  8 as abap.dec(4,0) )
          when 'EAST'  then cast(  5 as abap.dec(4,0) )
          when 'WEST'  then cast( 12 as abap.dec(4,0) )
          else               cast(  0 as abap.dec(4,0) )
        end,
      100,
      2
    )                                   as discounted_total,

  //-- 13. Report generation date from session variable
  $session.system_date                  as report_date,

  //-- GROUP BY: all non-aggregated fields must be listed
  category,
  region
}

where
     category = 'ELECTRON'
  or category = 'FOOD'

group by
  category,
  region

having
      count( * )       >= 1
  and sum( dec_field ) >  0
