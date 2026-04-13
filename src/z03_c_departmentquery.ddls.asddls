@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Mitarbeiter (Projektion) Übung 16'
@Metadata.ignorePropagatedAnnotations: true
//define view entity Z03_C_DEPARTMENTQUERY as select distinct from Z03_C_EmployeeQuery
define view entity Z03_C_DEPARTMENTQUERY
  with parameters
    p_target_curr : /dmo/currency_code,
    @EndUserText: {label: 'Datum der Bewertung'}
    @Environment: {systemField:#USER_DATE }
    p_date        : abap.dats

  as select from     Z03_C_EMPLOYEEQUERYP(
                     p_target_curr: $parameters.p_target_curr,
                            p_date: $parameters.p_date) as e

    right outer join Z03_R_Department                   as d on e.DepartmentId = d.Id

{

  d.Id,
  d.Description,
  e.CurrencyCodeTarget,

  avg( e.CompanyAffiliation as abap.dec( 12, 2 ) ) as AvarageAffiliation,

  @Semantics.amount: {currencyCode: 'CurrencyCodeTarget'}
  sum( e.AnnualSalaryConverted )                   as TotalSalary

}

group by
  d.Id,
  d.Description,
  e.CurrencyCodeTarget
