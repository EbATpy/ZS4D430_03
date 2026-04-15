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

/*
    
Legen Sie ein Paket Z430EXAM## an. ## - Gruppennummer

Aufgabe 1
Legen Sie eine transparente Tabelle zexam##_acmat an.

Struktur der Tabelle:

Feld                  Datentyp (Länge)    Bemerkung
CLIENT                CLNT (3)            Mandant
MATID                 CHAR (20)           Materialnummer
FACTORY_WAREHOUSE     CHAR (4)            Werkslager
QUANT_WAREHOUSE       QUAN (10)           Lagerbestand
UNIT_MEAS             MEINS               Maßeinheit

Aufbau des zweistufigen Datenmodells:

Feld                  Datenelemet         Domäne
FELDNAME              ZFELDNAME##         ZDFELDNAME## (bei Bedarf)

Aufgabe 2
Erstellen Sie eine RESTful Applikation mit einer DRAFT Tabelle.

Aufgabe 3
Erfassen Sie folgende Datensätze: (M3 -> Kubikmeter)

MATID    FACTORY_WAREHOUSE    QUANT_WAREHOUSE    UNIT_MEAS

MAT001   1010                 100                M3
MAT002   1010                 200                M3
MAT003   1020                 300                M3
MAT004   1010                 400                M3
MAT005   1030                 500                M3
MAT006   1030                 600                M3
MAT007   1030                 700                M3
MAT008   1040                 700                M3
MAT009   1020                 700                M3
MAT010   1040                 700                M3

Aufgabe 4
Erstellen Sie eine CDS View: z_r_zexam##_acmat mit einer Liste der Lagerbelegung in
Kubikmeter pro Werkslager.
    
    
*/
