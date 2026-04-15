@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Liste Lagerbelebung'
@Metadata.ignorePropagatedAnnotations: true
define view entity z_r_zexam03_acmat
  as select from zexam03_acmat
{
  key factory_warehouse as FactoryWarehouse,
      
      @Semantics.quantity.unitOfMeasure: 'UnitOfMeasure'
      sum( quant_warehouse ) as TotalStockCubicMeter,
      
      unit_meas as UnitOfMeasure
      
} where unit_meas = 'M3'
  group by 
    factory_warehouse, 
    unit_meas;
