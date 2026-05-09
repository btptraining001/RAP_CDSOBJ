@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS : Union & Union All'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_I_UNION 
  as select from zvkfeb01_dt_demo
// ============================================================
// VIEW 1 : UNION
// UNION combines rows from two SELECT statements and
// REMOVES duplicate rows from the result.
//
// Scenario:
//   SELECT 1 → ELECTRON category rows (ids 00001, 00002, 00003)
//   SELECT 2 → FOOD category rows    (ids 00004, 00005)
//
// Since the two sets have no overlapping ids, all 5 rows appear.
// To see duplicate removal in action, both SELECTs deliberately
// select the same row (id=00003) by overlapping the WHERE.
// Result: id=00003 appears only ONCE even though both SELECTs
// return it.
// ============================================================



{
  key id,
      category,
      region,
      char_field1  as product,
      dec_field    as amount,
      currency_key
}
 
  where category = 'ELECTRON'
union all
 
  select from zvkfeb01_dt_demo

{
  key id,
      category,
      region,
      char_field1  as product,
      dec_field    as amount,
      currency_key
}
  where category = 'ELECTRON'
     or category = 'FOOD'
// ------------------------------------------------------------
// WHAT TO OBSERVE IN DATA PREVIEW:
// SELECT 1 returns: 00001, 00002, 00003  (ELECTRON rows)
// SELECT 2 returns: 00001, 00002, 00003, 00004, 00005
//                   (ELECTRON + FOOD rows)
// UNION deduplicates → final result: 00001, 00002, 00003, 00004, 00005
// Rows 00001, 00002, 00003 appear only ONCE despite being in both SELECTs.
// ------------------------------------------------------------
 