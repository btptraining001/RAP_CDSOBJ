@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS : Association'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_CDS_ASSOCIATION 
    as select from zvkfeb01_dt_so as Head
    association [1..1] to zvkfeb01_dt_cust as Cust
        on Head.buyer = Cust.cust_id
{
    
    key Head.soid as Soid,
    Head.buyer as Buyer,
    Head.sales_person as SalesPerson,
    Head.sales_timestamp as SalesTimestamp,
    Head.sales_manager as SalesManager,
    Head.approval_timestamp as ApprovalTimestamp,
    Head.created_by as CreatedBy,
    Head.created_on as CreatedOn,
    Head.changed_by as ChangedBy,
    Head.changed_on as ChangedOn,
    Head.url as Url,
    Cust

}
