CLASS lhc_zr_2323flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
        IMPORTING keys FOR Flight~validatePrice,
      validateCurrencyCode FOR VALIDATE ON SAVE
        IMPORTING keys FOR Flight~validateCurrencyCode.
ENDCLASS.

CLASS lhc_zr_2323flight IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD validatePrice.
    DATA failed_record LIKE LINE OF failed-flight.
    DATA reported_record LIKE LINE OF reported-flight.

    READ ENTITIES OF zr_2323flight IN LOCAL MODE
          ENTITY Flight
          FIELDS ( Price ) WITH CORRESPONDING #( keys )
          RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).

      IF flight-price <= 0.

        failed_record-%tky = flight-%tky.
        APPEND failed_record TO failed-flight.

        reported_record-%tky = flight-%tky.

        reported_record-%msg =
        new_message(
        id = '/LRN/S4D400'
        number = '101'
        severity = if_abap_behv_message=>severity-error
        ).
        APPEND reported_record TO reported-flight.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD validateCurrencyCode.

    DATA failed_record LIKE LINE OF failed-flight.
    DATA reported_record LIKE LINE OF reported-flight.
    DATA exists TYPE abap_bool.

    READ ENTITIES OF zr_2323flight IN LOCAL MODE
    ENTITY flight FIELDS ( currencycode )
    WITH CORRESPONDING #( keys )
    RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).

      exists = abap_false.
      SELECT SINGLE FROM i_currency
            FIELDS @abap_true
            WHERE currency = @flight-currencycode
            INTO @exists.
      IF exists = abap_false. " the currency code is not valid

        failed_record-%tky = flight-%tky.
        APPEND failed_record TO failed-flight.
        reported_record-%tky = flight-%tky.

        reported_record-%msg = new_message(
        id = '/LRN/S4D400'
        number = '102'
        severity = if_abap_behv_message=>severity-error
        v1 = flight-currencycode
        ).
        APPEND reported_record TO reported-flight.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
