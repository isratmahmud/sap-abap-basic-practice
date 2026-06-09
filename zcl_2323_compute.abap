CLASS zcl_2323_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_2323_compute IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* declare
    DATA number1 TYPE i.
    DATA number2 TYPE i.
    DATA result TYPE p LENGTH 8 DECIMALS 2.
    DATA op TYPE c LENGTH 1.

* assign
    number1 = 123.
    number2 = 0.
    op = '/'.

    CASE op.
      WHEN '+'.
        result = number1 + number2.
      WHEN '-'.
        result = number1 - number2.
      WHEN '*'.
        result = number1 * number2.
      WHEN '/'.
        result = number1 / number2.
    ENDCASE.

* operation
*    result = number1 / number2.
    DATA(output) = |{ number1 } { op } { number2 } = { result }|.
* display
    out->write( result ).
*    DATA(output) = |{ number1 } / { number2 } = { result }|.
    out->write( output ).
  ENDMETHOD.
ENDCLASS.
