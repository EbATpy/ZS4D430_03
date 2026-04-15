@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Endusertext: {
  Label: '###GENERATED Core Data Service Entity'
}
@Objectmodel: {
  Sapobjectnodetype.Name: 'ZEXAM03_ACMAT'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_EXAM03_ACMAT
  provider contract TRANSACTIONAL_QUERY
  as projection on ZR_EXAM03_ACMAT
  association [1..1] to ZR_EXAM03_ACMAT as _BaseEntity on $projection.MATID = _BaseEntity.MATID and $projection.FACTORYWAREHOUSE = _BaseEntity.FACTORYWAREHOUSE
{
  key Matid,
  key FactoryWarehouse,
  @Semantics: {
    Quantity.Unitofmeasure: 'UnitMeas'
  }
  QuantWarehouse,
  @Consumption: {
    Valuehelpdefinition: [ {
      Entity.Element: 'UnitOfMeasure', 
      Entity.Name: 'I_UnitOfMeasureStdVH', 
      Useforvalidation: true
    } ]
  }
  UnitMeas,
  @Semantics: {
    User.Createdby: true
  }
  LocalCreatedBy,
  @Semantics: {
    Systemdatetime.Createdat: true
  }
  LocalCreatedAt,
  @Semantics: {
    User.Localinstancelastchangedby: true
  }
  LocalLastChangedBy,
  @Semantics: {
    Systemdatetime.Localinstancelastchangedat: true
  }
  LocalLastChangedAt,
  @Semantics: {
    Systemdatetime.Lastchangedat: true
  }
  LastChangedAt,
  _BaseEntity
}
