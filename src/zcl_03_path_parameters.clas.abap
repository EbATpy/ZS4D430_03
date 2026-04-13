CLASS zcl_03_path_parameters DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_03_path_parameters IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.


    TRY.
        SELECT
          FROM z03_c_employeequeryp( p_target_curr = 'USD' ,
                                            p_date = @( cl_abap_context_info=>get_system_date( ) ) )
        FIELDS employeeid,
               firstname,
               lastname,
               departmentid,
               departmentdescription,
               assistantname,
               \_department\_head-lastname AS headname,
               MonthlySalary,
               CurrencyCodeTarget,
               CompanyAffiliation
        INTO TABLE @DATA(result).

        IF sy-subrc = 0.
          out->write( result ).
        ELSE.
          out->write( | 'Keine Daten gefunden für die angegebenen Parameter' |  ).
        ENDIF.
      CATCH cx_root INTO DATA(lx_root).
        out->write( lx_root->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
