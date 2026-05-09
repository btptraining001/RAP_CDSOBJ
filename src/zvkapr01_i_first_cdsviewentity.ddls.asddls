@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Entity'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKAPR01_I_FIRST_CDSVIEWENTITY 
    as select from zvkfeb01_dt_so as Header
{
  key soid as Soid,
  buyer as Buyer,
  sales_person as SalesPerson,
  sales_timestamp as SalesTimestamp,
  sales_manager as SalesManager,
  approval_timestamp as ApprovalTimestamp,
  created_by as CreatedBy,
  created_on as CreatedOn,
  changed_by as ChangedBy,
  changed_on as ChangedOn,
  url as Url  
}
