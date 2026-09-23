@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sales by preod'
@Metadata.ignorePropagatedAnnotations: false
define root view entity zmn_c_salesbyprod
  as projection on zmn_i_salesbyprod
{
      @UI.selectionField: [{position: 10}]
      @UI.lineItem: [{ position: 10 }]
  key Product,
     // @UI.lineItem: [{ position: 20}]
    @Consumption.semanticObject: 'SalesOrder'
    @UI.lineItem: [{ position: 20, type: #WITH_INTENT_BASED_NAVIGATION,  semanticObjectAction: 'displayFactSheet'}]
    key SalesDocument,
      @UI.lineItem: [{ position: 25 }]
      CreationDate,
      @UI.lineItem: [{position: 15}]
      
      ProductName,
      @UI.lineItem: [{ position: 39 }]
      @EndUserText.label: 'Qty ordered'

      ordered,
      OrderQuantityUnit,
      @UI.lineItem: [{ position: 40 }]
      SoldToParty,
      @UI.lineItem: [{ position: 50 }]

      CustomerName,
      @UI.lineItem: [{ position: 60 }]

      TotalNetAmount,
      TransactionCurrency,
      SalesOrganization,
      DistributionChannel,
      SalesDocumentType,
      OrganizationDivision
      
      }
      
