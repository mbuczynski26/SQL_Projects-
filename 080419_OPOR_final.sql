SELECT 
'TransactionID' = OPOR.U_transID
, 'TransactionDate' = OPOR.U_transDate
, 'TransactionFee' = OPOR. U_transFee
, 'Vendor' = OPOR.CardCode
, 'VendorRefNo' = OPOR.NumAtCard
, 'Name' = OPOR.CardName
,'ContactPerson' = OCPR.Name
, 'Status' = OPOR.DocStatus
, 'DocumentNo' = OPOR.DocNum
, 'Segment' = CAST(OPOR.Segment as int)
,'PostingDate' = OPOR.DocDate
, 'DeliveryDate' = OPOR.DocDueDate
, 'DocumentDate' = OPOR.TaxDate
,'DocumentTotal' = OPOR.DocTotal
, 'Buyer' = SalesPerson.lastName+', '+ SalesPerson.firstName
, 'DocumentOwner'= DocOwner.lastName+', '+ DocOwner.firstName
, 'OrderType' = OPOR.U_OrderType
,'OrderTypeDescription' = UFD1.Descr
, OPOR.Comments
FROM OPOR
INNER JOIN OINV on OINV.SlpCode = OPOR.SlpCode
INNER JOIN OHEM SalesPerson on SalesPerson.salesPrson = OPOR.SlpCode 
INNER JOIN OHEM DocOwner on DocOwner.empID = OINV.OwnerCode
INNER JOIN OCPR on OCPR.CntctCode = OPOR.CntctCode
INNER JOIN UFD1 on UFD1.FldValue = OPOR.U_OrderType AND UFD1.FieldID = 26 AND UFD1.TableID = 'OPOR'
