@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS : Association'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVKJUN01_CDS_ASSJOIN 
    as select from zvkfeb01_dt_cust as Cust 
    

    inner join zvkfeb01_dt_so as _Head
        on _Head.buyer = Cust.cust_id
    
        inner join zvkfeb01_dt_so as Item
        on _Head.soid = Item.soid
    

{
    
key Cust.cust_id as CustId,
Cust.name as Name,
Cust.company_name as CompanyName,
Cust.country as Country,
Cust.city as City,
Cust.mobile as Mobile,
Cust.local_last_changed as LocalLastChanged,
Cust.last_changed as LastChanged,
Cust.local_changed_by as LocalChangedBy,
Cust.last_changed_by as LastChangedBy

}
