@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customers'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z03CUSTOMERS_R
  as select from z03customers
{
  key customerid            as Customerid,
      first_name            as FirstName,
      last_name             as LastName,
      city                  as City,
      street                as Street,
      postcode              as Postcode,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt
}
