CLASS z430finaltask DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z430finaltask IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_customers TYPE TABLE OF z03customers.

    lt_customers = VALUE #(
      ( customerid = 'C00001' first_name = 'Max'        last_name = 'Mustermann' city = 'Berlin'    street = 'Musterstraße 12'  postcode = '10115' ) " zz_email = 'max.mustermann@test.de'    zz_phone = '030-12345678' )
      ( customerid = 'C00002' first_name = 'Anna'       last_name = 'Schmidt'    city = 'München'   street = 'Bahnhofstr. 45'   postcode = '80331' ) "zz_email = 'anna.schmidt@test.de'      zz_phone = '089-98765432' )
      ( customerid = 'C00003' first_name = 'Tom'        last_name = 'Müller'     city = 'Hamburg'   street = 'Elbchaussee 78'   postcode = '22763' ) "zz_email = 'tom.mueller@test.de'       zz_phone = '040-55556666' )
      ( customerid = 'C00004' first_name = 'Lisa'       last_name = 'Berger'      city = 'Köln'      street = 'Domkloster 3'     postcode = '50667' )" zz_email = 'lisa.berger@test.de'      zz_phone = '0221-11223344' )
    ).

    DELETE FROM z03customers.

    INSERT z03customers FROM TABLE @lt_customers.

    DATA lt_orders TYPE TABLE OF z03cust_orders.

    lt_orders = VALUE #(
      ( orderid = 'O10001' customerid = 'C00001' amount = '1250.50' currency = 'EUR' )
      ( orderid = 'O10002' customerid = 'C00001' amount = '89.99'  currency = 'EUR' )
      ( orderid = 'O10003' customerid = 'C00002' amount = '450.00'  currency = 'EUR' )
      ( orderid = 'O10004' customerid = 'C00003' amount = '3200.75' currency = 'EUR' )
      ( orderid = 'O10005' customerid = 'C00002' amount = '175.25'  currency = 'EUR' )
      ( orderid = 'O10006' customerid = 'C00004' amount = '980.00'  currency = 'EUR' )
    ).

    DELETE FROM z03cust_orders.

    INSERT z03cust_orders FROM TABLE @lt_orders.

    out->write( | Einträge in Z##CUST_ORDERS eingefügt.| ).

    SELECT * FROM z03customers INTO TABLE @DATA(lt_result_customers).
    out->write( lt_result_customers ).

  ENDMETHOD.
ENDCLASS.
