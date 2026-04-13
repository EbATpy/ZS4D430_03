CLASS zcl_03_intro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_intro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    "DATA var TYPE string.         "Step 1
    DATA var TYPE /lrn/s4d430_ind . "Step 2


    DATA A123456789A123456789A123456789 TYPE /lrn/s4d430_ind . "Step 2


    FIELD-SYMBOLS <fs_ind> TYPE /lrn/s4d430_ind.
    DATA ls_data TYPE /lrn/s4d430_ind.
    ASSIGN ls_data TO <fs_ind>.
    IF <fs_ind> IS ASSIGNED.
      <fs_ind>-id          = '0000'.
      <fs_ind>-description = 'Test2'.
      INSERT INTO /lrn/s4d430_ind VALUES @<fs_ind>.
    ENDIF.


    select from /lrn/s4d430_ind fields * into table @data(lt_result).
    out->write( lt_result ).


  ENDMETHOD.
ENDCLASS.
