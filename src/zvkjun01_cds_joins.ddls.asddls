@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS : Joins'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_CDS_JOINS
  as select from     zvkfeb01_dt_so   as Head
    right outer join zvkfeb01_dt_cust as Cust on Head.buyer = Cust.cust_id
{

  key Cust.cust_id            as CustId,
  key Head.soid               as Soid,
      Cust.name               as Name,
      Cust.company_name       as CompanyName,
      Cust.country            as Country,
      Cust.city               as City,
      Cust.mobile             as Mobile,
      Cust.local_last_changed as LocalLastChanged,
      Cust.last_changed       as LastChanged,
      Cust.local_changed_by   as LocalChangedBy,
      Cust.last_changed_by    as LastChangedBy,
      Head.buyer              as Buyer,
      Head.sales_person       as SalesPerson,
      Head.sales_timestamp    as SalesTimestamp,
      Head.sales_manager      as SalesManager,
      Head.approval_timestamp as ApprovalTimestamp,
      Head.created_by         as CreatedBy,
      Head.created_on         as CreatedOn,
      Head.changed_by         as ChangedBy,
      Head.changed_on         as ChangedOn,
      Head.url                as Url

}
