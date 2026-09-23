@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sales orders by product'
@Metadata.ignorePropagatedAnnotations: true
define view entity zmn_so_for_mat as select from I_SalesDocumentItem //ZMN_I_SALESDOC
{
    key Product,
    key SalesDocument,
    OrderQuantityUnit,
    @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
    sum( OrderQuantity) as ordered
    
    }  group by Product,SalesDocument,OrderQuantityUnit
