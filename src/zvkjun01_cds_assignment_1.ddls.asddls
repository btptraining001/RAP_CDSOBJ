@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ASSIGNMENT_1'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_CDS_ASSIGNMENT_1 
  as select from zvkjun01_dt_prod
{
  key prod_id                    as product_id,
      descpt                      as product_description,

  /* assume price is numeric; if not, cast to decimal/currency */
  @Semantics.amount.currencyCode: 'currency'
  price,
  currency,

  /* computed field: price + 18% tax */
  cast( price as abap.decfloat16 ) * cast( ( 1.18 ) as abap.decfloat16 )   as price_with_tax
}
