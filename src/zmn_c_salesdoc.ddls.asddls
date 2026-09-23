@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sales doc'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zmn_c_salesdoc
  as projection on ZMN_I_SALESDOC 
{
      @UI.lineItem: [{ position: 10 }]
      @UI.selectionField: [{position: 10}]
  key SalesDocument,
      @UI.lineItem: [{ position: 20 }]
  key SalesDocumentItem,
  
      _SalesDocument.SalesOffice,
  
      _SalesDocument.SalesDistrict,
  //    @UI.lineItem: [{ position: 21 }]
      @EndUserText.label: 'Order type'
      _SalesDocument._SalesDocumentType._Text[1: Language = $session.system_language].SalesDocumentTypeName,
      @UI.lineItem: [{position: 22}]
      _SalesDocument.CreationDate,
      @UI.lineItem: [{ position: 30 }]
      @UI.selectionField: [{position: 20 }]
      Product,
      @UI.lineItem: [{ position: 40 }]

      _ProductText[ 1:  Language = $session.system_language].ProductName,
      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
      @UI.lineItem: [{ position: 50 }]

      OrderQuantity,
      OrderQuantityUnit,
      @UI.lineItem: [{ position: 60 }]
      @UI.selectionField: [{position: 30}]
      _SalesDocument.SoldToParty,
      @UI.lineItem: [{ position: 70 }]


      _SalesDocument._SoldToParty.CustomerName,
   //   @UI.lineItem: [{ position: 80 }]
      @EndUserText.label: 'Item status'
      _SDProcessStatus._Text[ 1:  Language = $session.system_language].SDProcessStatusDesc,
      @EndUserText.label: 'Order status'
 //     @UI.lineItem: [{ position: 90 }]
      _SalesDocument._OverallSDProcessStatus._Text[1: Language = $session.system_language].OverallSDProcessStatusDesc,
       @UI.lineItem: [{ position: 100 }]
       @Semantics.amount.currencyCode: 'TransactionCurrency'
        @EndUserText.label: 'Item net value'
      NetAmount,
      @UI.lineItem: [{ position: 110 }]
       @Semantics.amount.currencyCode: 'TransactionCurrency'
        @EndUserText.label: 'Order net value'
      _SalesDocument.TotalNetAmount,
      TransactionCurrency
}
