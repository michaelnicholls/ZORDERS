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
  
  
  //    @UI.lineItem: [{ position: 21 }]
      @EndUserText.label: 'Order type'
      _SalesDocumentBasic._SalesDocumentType._Text[1: Language = $session.system_language].SalesDocumentTypeName,
      @UI.lineItem: [{position: 22}]
      _SalesDocumentBasic.CreationDate,
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
      _SalesDocumentBasic.SoldToParty,
      @UI.lineItem: [{ position: 70 }]


      _SalesDocumentBasic._SoldToParty.CustomerName,
      @UI.lineItem: [{ position: 80 }]
      @EndUserText.label: 'Item status'
      _SDProcessStatus._Text[ 1:  Language = $session.system_language].SDProcessStatusDesc,
      @EndUserText.label: 'Order status'
      @UI.lineItem: [{ position: 90 }]
      _SalesDocumentBasic._OverallSDProcessStatus._Text[1: Language = $session.system_language].OverallSDProcessStatusDesc,
       @UI.lineItem: [{ position: 100 }]
       @Semantics.amount.currencyCode: 'TransactionCurrency'
     //   @EndUserText.label: 'Item net value'
      NetAmount,
      @UI.lineItem: [{ position: 110 }]
       @Semantics.amount.currencyCode: 'TransactionCurrency'
        @EndUserText.label: 'Order net value'
      _SalesDocumentBasic.TotalNetAmount,
      TransactionCurrency
}
