@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'sales by product'
@Metadata.ignorePropagatedAnnotations: false
define root view entity zmn_i_salesbyprod as select from zmn_so_for_mat as mat 
join I_SalesDocumentBasic as doc on mat.SalesDocument = doc.SalesDocument
join I_ProductText as text on text.Product = mat.Product
{
    key mat.Product,
    key doc.SalesDocument,
    text.ProductName,
    doc.SoldToParty,
    doc._SoldToParty.CustomerName,
    @Semantics.amount.currencyCode: 'TransactionCurrency'
    doc.TotalNetAmount,
    doc.TransactionCurrency,
    mat.ordered,
    mat.OrderQuantityUnit,
    doc.CreationDate,
    doc.SalesOrganization,
    doc.DistributionChannel,
    doc.OrganizationDivision,
    doc.SalesDocumentType
}
where text.Language = $session.system_language
