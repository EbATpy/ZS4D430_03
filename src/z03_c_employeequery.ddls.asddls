@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Ü5'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z03_C_EmployeeQuery
  as select from Z03_R_Employee
{
  key EmployeeId,
      FirstName,
      LastName,
      DepartmentId,
      _Department.Description                                                                          as DepartmentDescription,
      //    _Department._Assistant.LastName           as AssistantLastName,
      concat_with_space( _Department._Assistant.FirstName, _Department._Assistant.LastName, 1)         as AssistantName,
      @EndUserText: {label: 'Emplyee Role'}
      case EmployeeId when _Department.DepartmentHead then 'H'
                      when _Department.DepartmentAssistent then 'A'
                      else '' end                                                                      as EmployeeRole,
      @Semantics.amount: {currencyCode: 'CurrencyCode'}
      AnnualSalary,
      CurrencyCode,
      //--------------------------------------------------
      @EndUserText: {label: 'Monthly Salary USD'}
      cast ( ( cast ( $projection.AnnualSalaryConvertedUSD as abap.fltp ) / 12.0 ) as abap.dec( 10, 2 ) ) as MonthlySalaryUSD,
      @Semantics.amount: {currencyCode: 'CurrencyCodeUSD'}
      @EndUserText: {label: 'CurrencyCodeUSD'}
      currency_conversion( amount => AnnualSalary,
                  source_currency => CurrencyCode,
                  target_currency => $projection.CurrencyCodeUSD,
               exchange_rate_date => $session.system_date )                                            as AnnualSalaryConvertedUSD,
      cast('USD' as /dmo/currency_code)                                                                as CurrencyCodeUSD,
      //--------------------------------------------------
//      @EndUserText: {label: 'Monthly Salary PLN'}
//      cast ( ( cast ( $projection.AnnualSalaryConvertedPLN as abap.fltp ) / 12.0 ) as abap.dec( 10, 2 ) ) as MonthlySalaryPLN,
//      @Semantics.amount: {currencyCode: 'CurrencyCodePLN'}
//      @EndUserText: {label: 'CurrencyCodePLN'}
//      currency_conversion(
//        amount          => AnnualSalary,
//        source_currency => CurrencyCode,
//        target_currency => $projection.CurrencyCodePLN,
//        exchange_rate_date => $session.system_date
//      )                                                                                                as AnnualSalaryConvertedPLN,
//      cast('PLN' as /dmo/currency_code)                                                                as CurrencyCodePLN,
      //--------------------------------------------------

      division( dats_days_between( EntryDate , $session.system_date ), 365 , 1 )                       as CompanyAffiliation,
      /* Associations */
      _Department
}
