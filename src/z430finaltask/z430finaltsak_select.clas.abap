CLASS z430finaltsak_select DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z430finaltsak_select IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT FROM z03cust_order_R( p_customerid = '*' )
        FIELDS  orderid,
                customerid,
                Amount,
                Currency,
                \_Customer-FirstName,
                \_Customer-lastname,
                \_Customer-postcode,
                \_Customer-city
        ORDER BY   customerid
        INTO TABLE @DATA(lt_orders).
    out->write( lt_orders ).

  ENDMETHOD.
ENDCLASS.
