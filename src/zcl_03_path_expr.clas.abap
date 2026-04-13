CLASS zcl_03_path_expr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_03_PATH_EXPR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
    FROM Z03_C_EmployeeQuery
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,
           DepartmentDescription,
           AssistantName ,
           \_Department\_Head-LastName as HeadName order by EmployeeId

    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
