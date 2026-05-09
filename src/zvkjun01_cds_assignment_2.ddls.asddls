@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ASSIGNMENT_2'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_CDS_ASSIGNMENT_2

  as select from    zvkjun01_dt_cust as c
    left outer join zvkjun01_dt_so   as s on s.buyer = c.cust_id
    left outer join zvkjun01_dt_soit as i on i.soid = s.soid
{
  key c.cust_id                                        as customer_id,
      c.name                                           as customer_name,

      /* number of distinct sales orders per customer */
      count( distinct s.soid )                         as total_orders,

      /* total of item amounts (if amount is null in some rows, SUM ignores nulls) */
      cast( ( sum( i.amount ) ) as abap.dec( 14, 2 ) ) as total_item_amount
}
group by
  c.cust_id,
  c.name
