CLASS zbp_y_exam03_fill DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbp_y_exam03_fill IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_acmat TYPE TABLE OF ZEXAM03_ACMAT.

    lt_acmat = VALUE #(
          ( matid = 'MAT001' factory_warehouse = '1010' quant_warehouse = 100 unit_meas = 'M3' )
          ( matid = 'MAT002' factory_warehouse = '1010' quant_warehouse = 200 unit_meas = 'M3' )
          ( matid = 'MAT003' factory_warehouse = '1020' quant_warehouse = 300 unit_meas = 'M3' )
          ( matid = 'MAT004' factory_warehouse = '1030' quant_warehouse = 400 unit_meas = 'M3' )
          ( matid = 'MAT005' factory_warehouse = '1030' quant_warehouse = 500 unit_meas = 'M3' )
          ( matid = 'MAT006' factory_warehouse = '1030' quant_warehouse = 600 unit_meas = 'M3' )
          ( matid = 'MAT007' factory_warehouse = '1040' quant_warehouse = 700 unit_meas = 'M3' )
          ( matid = 'MAT008' factory_warehouse = '1040' quant_warehouse = 800 unit_meas = 'M3' )
          ( matid = 'MAT009' factory_warehouse = '1020' quant_warehouse = 700 unit_meas = 'M3' )
          ( matid = 'MAT010' factory_warehouse = '1040' quant_warehouse = 700 unit_meas = 'M3' )
        ).
    DELETE FROM ZEXAM03_ACMAT.

    INSERT ZEXAM03_ACMAT FROM TABLE @lt_acmat.

    out->write( lt_acmat ).

  ENDMETHOD.
ENDCLASS.
