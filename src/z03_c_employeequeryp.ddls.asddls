@AbapCatalog.viewEnhancementCategory: [#PROJECTION_LIST]
@AbapCatalog.extensibility.dataSources: [ 'Employee' ]
@AbapCatalog.extensibility.elementSuffix: 'ZEM'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ü5'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity Z03_C_EMPLOYEEQUERYP
  with parameters
    p_target_curr : waers,
    @Environment: {systemField: #SYSTEM_DATE}
    p_date        : abap.dats
  as select from Z03_R_Employee as Employee
{
  key EmployeeId,
      FirstName,
      LastName,
      DepartmentId,
      _Department.Description                                                  as DepartmentDescription,
      concat_with_space( _Department._Assistant.FirstName,
                         _Department._Assistant.LastName, 1)                   as AssistantName,
      case EmployeeId when _Department.DepartmentHead      then 'H'
                      when _Department.DepartmentAssistent then 'A'
                      else                                      ''
      end                                                                      as EmployeeRole,
      @Semantics.amount: {currencyCode: 'CurrencyCode'}
      AnnualSalary,
      CurrencyCode,
      //--------------------------------------------------
      cast ( (cast ( $projection.AnnualSalaryConverted as abap.fltp ) / 12.0 )
            as abap.dec( 10, 2 ) )                                             as MonthlySalary,
      @Semantics.amount: {currencyCode: 'CurrencyCodeTarget'}
      currency_conversion( amount => AnnualSalary,
                  source_currency => CurrencyCode,
                  target_currency => $parameters.p_target_curr,
               exchange_rate_date => $parameters.p_date )                      as AnnualSalaryConverted,
      $parameters.p_target_curr                                                as CurrencyCodeTarget,
      division( dats_days_between( EntryDate , $parameters.p_date ), 365 , 1 ) as CompanyAffiliation,
      /* Associations */
      _Department
}
