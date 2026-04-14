@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'C_LIST'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z03CUSTOMERS_C_LIST as select from z03cust_orders
{
    customerid,
    @Semantics.amount.currencyCode: 'currency'
    sum(amount) as total_amount,
    currency
} group by customerid, currency
