//@AbapCatalog. dataMaintenance: #RESTRICTED
//@AbapCatalog.viewEnhancementCategory: [#NONE]

@AbapCatalog: { dataMaintenance: #RESTRICTED,
                viewEnhancementCategory: [ #PROJECTION_LIST ] ,
                extensibility.dataSources: [ 'Employee' ] ,
                extensibility.elementSuffix: 'ZEM' } 

@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Mitarbeiter (Entität)'
@Metadata.ignorePropagatedAnnotations: true


@ObjectModel.usageType: { dataClass: #MASTER,
                          serviceQuality: #D ,
                          sizeCategory: #M }
                          

define view entity Z03_R_Employee 
    as select from z03employ as Employee

association[1..1] to Z03_R_Department as _Department
    on $projection.DepartmentId = _Department.Id

{
    key employee_id as EmployeeId,
    first_name as FirstName,
    last_name as LastName,
    birth_date as BirthDate,
    entry_date as EntryDate,
    department_id as DepartmentId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    annual_salary as AnnualSalary,
    @EndUserText.label: 'Currency Key'
    currency_code as CurrencyCode,
    created_by as CreatedBy,
    created_at as CreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt,
    _Department
}
