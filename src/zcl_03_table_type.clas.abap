CLASS zcl_03_table_type DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

* Task 1: Simple Table Type
**********************************************************************
    TYPES tt_addresses TYPE SORTED TABLE OF /lrn/s_address
                       WITH NON-UNIQUE KEY country city.

* Task 2: Deep Structure
**********************************************************************
    TYPES:
      BEGIN OF st_person_deep,
        first_name TYPE /dmo/first_name,
        last_name  TYPE /dmo/last_name,
        addresses  TYPE tt_addresses,
      END OF st_person_deep.


*Task 3: Nested Table Type
**********************************************************************
    TYPES tt_persons TYPE HASHED TABLE OF st_person_deep
                     WITH UNIQUE KEY last_name first_name.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_03_table_type IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Task 1
**********************************************************************
    DATA addresses TYPE z03t_addresses.

    addresses =
      VALUE #(
              ( street      = 'Dietmar-Hopp-Allee 16'
                postal_code = '69190'
                city        = 'Walldorf'
                country     = 'DE'
              )
              ( street      = '3999 West Chester Pike'
                postal_code = '19073'
                city        = 'Newtown Square, PA'
                country     = 'US'
              )
             ).

    out->write( addresses ).
* Task 2
**********************************************************************
    DATA person TYPE z03s_person_deep.

    person-first_name = 'Dictionary'.
    person-last_name  = 'ABAP'.
    person-addresses  = addresses.

    out->write( person ).

* Task 3
**********************************************************************
    DATA persons TYPE z03t_persons.

    persons =
       VALUE #(
          ( person )
          (
            first_name = 'CDS'
            last_name  = 'ABAP'
            addresses =
              VALUE #(
                      ( street      = 'SAP-Allee 29'
                        postal_code = '68789'
                        city        = 'St.Leon-Rot'
                        country     = 'DE'
                      )
                      ( street      = '35 rue d''Alsace'
                        postal_code = '92300'
                        city        = 'Levallois-Perret'
                        country     = 'FR'
                      )
                      ( street      = 'Bedfont Road'
                        postal_code = 'TW14 8HD'
                        city        = 'Feltham'
                        country     = 'GB'
                      )
                     )
           )
         ).


    DATA(lv_name) = person-last_name.

    DATA(lv_address_count) = lines( person-addresses ).

    IF line_exists( person-addresses[ 1 ] ).
      DATA(ls_first_address) = person-addresses[ 1 ].
    ENDIF.


    TRY.
        DATA(ls_selected_person) = persons[ last_name = 'ABAP' first_name = 'Dictionary' ].
        DATA(ls_adr) = ls_selected_person-addresses[ country = 'DE' ].
        out->write( |Gefundene Strasse: { ls_adr-street }| ).

      CATCH cx_sy_itab_line_not_found.
        out->write( 'Person oder Adresse nicht gefunden.' ).
    ENDTRY.




    LOOP AT persons ASSIGNING FIELD-SYMBOL(<fs_person>).
      out->write( |Verarbeite: { <fs_person>-first_name } { <fs_person>-last_name }| ).
      LOOP AT <fs_person>-addresses ASSIGNING FIELD-SYMBOL(<fs_address>).
        out->write( |  - Stadt: { <fs_address>-city } ({ <fs_address>-country })| ).
      ENDLOOP.
    ENDLOOP.








  ENDMETHOD.
ENDCLASS.







