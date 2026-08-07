@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'Z2323FLIGHT'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_2323FLIGHT
  provider contract transactional_query
  as projection on ZR_2323FLIGHT
  association [1..1] to ZR_2323FLIGHT as _BaseEntity on  $projection.CarrierID    = _BaseEntity.CarrierID
                                                     and $projection.ConnectionID = _BaseEntity.ConnectionID
                                                     and $projection.FlightDate   = _BaseEntity.FlightDate
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
      @Semantics: {
        amount.currencyCode: 'CurrencyCode'
      }
      Price,
      @Consumption: {
        valueHelpDefinition: [ {
          entity.element: 'Currency',
          entity.name: 'I_CurrencyStdVH',
          useForValidation: true
        } ]
      }
      CurrencyCode,
      PlaneTypeID,
      @Semantics: {
        user.createdBy: true
      }
      LocalCreatedBy,
      @Semantics: {
        systemDateTime.createdAt: true
      }
      LocalCreatedAt,
      @Semantics: {
        user.localInstanceLastChangedBy: true
      }
      LocalLastChangedBy,
      @Semantics: {
        systemDateTime.localInstanceLastChangedAt: true
      }
      LocalLastChangedAt,
      @Semantics: {
        systemDateTime.lastChangedAt: true
      }
      LastChangedAt,
      _BaseEntity
}
