@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZEXAM03_ACMAT'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_EXAM03_ACMAT
  as select from ZEXAM03_ACMAT
{
  key matid as Matid,
  key factory_warehouse as FactoryWarehouse,
  @Semantics.quantity.unitOfMeasure: 'UnitMeas'
  quant_warehouse as QuantWarehouse,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_UnitOfMeasureStdVH', 
    entity.element: 'UnitOfMeasure', 
    useForValidation: true
  } ]
  unit_meas as UnitMeas,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
}
