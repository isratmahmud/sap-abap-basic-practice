CLASS zcl_2323_cls_methods DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_2323_cls_methods IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.
    " first instance
    connection = NEW #( ).

    TRY.
        connection->set_attributes(
        EXPORTING
          i_carrier_id    = 'LH'
          i_connection_id =  '0480'
        ).
      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.
*    connection->carrier_id = 'LH'.
*    connection->connection_id = '0400'.

    APPEND connection TO connections.

    " second instance
    connection = NEW #( ).
    connection->carrier_id = 'AA'.
    connection->connection_id = '0017'.

    APPEND connection TO connections.

    " third instance
    connection = NEW #( ).
    connection->carrier_id = 'SQ'.
    connection->connection_id = '0001'.

    APPEND connection TO connections.

    LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
