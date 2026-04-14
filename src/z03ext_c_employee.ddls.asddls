extend view entity Z03_C_EMPLOYEEQUERYP with 

    association [1..1] to I_Country as _ZZCountryZEM
        on $projection.ZZCountryZEM = _ZZCountryZEM.Country


{
    Employee.ZZCountryZEM as ZZCountryZEM,
    Employee.ZZTitleZEM as ZZTitleZEM,
    concat_with_space( Employee.FirstName, Employee.LastName , 1 ) as ZZFullNameZEM,
    _ZZCountryZEM.IsEuropeanUnionMember as ZZEUBasedZEM
}
