@AbapCatalog: { dataMaintenance: #RESTRICTED,
                viewEnhancementCategory: [ #NONE ]  }
                
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ü9'
@Metadata.ignorePropagatedAnnotations: true

@ObjectModel: {
    usageType: { dataClass: #MASTER,
                 serviceQuality: #D,
                 sizeCategory: #M } }


define view entity Z03_C_EMPLOYEE as select from Z03_R_Employee
{
    key EmployeeId,
    FirstName,
    LastName,
    BirthDate,
    EntryDate,
    DepartmentId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    AnnualSalary,
    @EndUserText.label: 'Currency Key'
    CurrencyCode,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt
}
