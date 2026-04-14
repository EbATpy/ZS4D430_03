@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z03CUST_ORDER_R

  with parameters
    p_customerid : z03_customerid

  as select from z03cust_orders

  association [1..1] to Z03CUSTOMERS_R as _Customer on $projection.Customerid = _Customer.Customerid

{
  key orderid               as Orderid,
      customerid            as Customerid,
      @Semantics.amount.currencyCode: 'currency'
      amount                as Amount,
      currency              as Currency,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,
      _Customer
}

where
  customerid = case
                when $parameters.p_customerid = '*' then
                    customerid
                else
                     $parameters.p_customerid
                end
