using System;
using System.ComponentModel;
using System.Data;
using System.Runtime.Serialization;

namespace Micromind.Common.Data
{
	[Serializable]
	[DesignerCategory("Code")]
	public class SalesPOSData : DataSet
	{
		public const string SALESPOS_TABLE = "Sales_POS";

		public const string SALESPOSDETAIL_TABLE = "Sales_POS_Detail";

		public const string SYSDOCID_FIELD = "SysDocID";

		public const string VOUCHERID_FIELD = "VoucherID";

		public const string DIVISIONID_FIELD = "DivisionID";

		public const string COMPANYID_FIELD = "CompanyID";

		public const string CUSTOMERID_FIELD = "CustomerID";

		public const string TRANSACTIONDATE_FIELD = "TransactionDate";

		public const string ROWINDEX_FIELD = "RowIndex";

		public const string SALESPERSONID_FIELD = "SalespersonID";

		public const string REQUIREDDATE_FIELD = "RequiredDate";

		public const string SHIPPINGADDRESSID_FIELD = "ShippingAddressID";

		public const string PAYEETAXGROUPID_FIELD = "PayeeTaxGroupID";

		public const string CUSTOMERADDRESS_FIELD = "CustomerAddress";

		public const string STATUS_FIELD = "Status";

		public const string CURRENCYID_FIELD = "CurrencyID";

		public const string CURRENCYRATE_FIELD = "CurrencyRate";

		public const string TERMID_FIELD = "TermID";

		public const string PRICEINCLUDETAX_FIELD = "PriceIncludeTax";

		public const string SHIPPINGMETHODID_FIELD = "ShippingMethodID";

		public const string REFERENCE_FIELD = "Reference";

		public const string NOTE_FIELD = "Note";

		public const string PONUMBER_FIELD = "PONumber";

		public const string SHIFTID_FIELD = "ShiftID";

		public const string BATCHID_FIELD = "BatchID";

		public const string ISVOID_FIELD = "IsVoid";

		public const string DISCOUNT_FIELD = "Discount";

		public const string DISCOUNTFC_FIELD = "DiscountFC";

		public const string TAXAMOUNT_FIELD = "TaxAmount";

		public const string TAXAMOUNTFC_FIELD = "TaxAmountFC";

		public const string TOTAL_FIELD = "Total";

		public const string TOTALFC_FIELD = "TotalFC";

		public const string ISCASH_FIELD = "IsCash";

		public const string REGISTERID_FIELD = "RegisterID";

		public const string DUEDATE_FIELD = "DueDate";

		public const string SEARCHVALUE_FIELD = "SearchValue";

		public const string CREATEDBY_FIELD = "CreatedBy";

		public const string DATECREATED_FIELD = "DateCreated";

		public const string UPDATEDBY_FIELD = "UpdatedBy";

		public const string DATEUPDATED_FIELD = "DateUpdated";

		public const string PRODUCTID_FIELD = "ProductID";

		public const string QUANTITY_FIELD = "Quantity";

		public const string UNITPRICE_FIELD = "UnitPrice";

		public const string UNITPRICEFC_FIELD = "UnitPriceFC";

		public const string DESCRIPTION_FIELD = "Description";

		public const string UNITID_FIELD = "UnitID";

		public const string TAXGROUPID_FIELD = "TaxGroupID";

		public const string TAXOPTION_FIELD = "TaxOption";

		public const string BARCODE_FIELD = "Barcode";

		public const string UNITQUANTITY_FIELD = "UnitQuantity";

		public const string UNITFACTOR_FIELD = "UnitFactor";

		public const string FACTORTYPE_FIELD = "FactorType";

		public const string SUBUNITPRICE_FIELD = "SubunitPrice";

		public const string LOCATIONID_FIELD = "LocationID";

		public const string QUANTITYSHIPPED_FIELD = "QuantityShipped";

		public const string ORDERVOUCHERID_FIELD = "OrderVoucherID";

		public const string ORDERSYSDOCID_FIELD = "OrderSysDocID";

		public const string DNOTEVOUCHERID_FIELD = "DNoteVoucherID";

		public const string DNOTESYSDOCID_FIELD = "DNoteSysDocID";

		public const string ORDERROWINDEX_FIELD = "OrderRowIndex";

		public const string ISDNROW_FIELD = "IsDNRow";

		public const string ISRECOST_FIELD = "IsRecost";

		public const string ACCOUNTID_FIELD = "AccountID";

		public const string AMOUNT_FIELD = "Amount";

		public const string AMOUNTFC_FIELD = "AmountFC";

		public const string PAYMENTMETHODID_FIELD = "PaymentMethodID";

		public const string PAYMENTMETHODTYPE_FIELD = "PaymentMethodType";

		public const string CHANGE_FIELD = "Change";

		public const string INVOICEPAYMENT_TABLE = "Invoice_Payment";

		public DataTable PaymentTable => base.Tables["Invoice_Payment"];

		public DataTable SalesPOSTable => base.Tables["Sales_POS"];

		public DataTable SalesPOSDetailTable => base.Tables["Sales_POS_Detail"];

		public DataTable TaxDetailsTable => base.Tables["Tax_Detail"];

		public SalesPOSData()
		{
			BuildDataTables();
		}

		public SalesPOSData(SerializationInfo info, StreamingContext context)
			: base(info, context)
		{
		}

		private void BuildDataTables()
		{
			DataTable dataTable = new DataTable("Sales_POS");
			DataColumnCollection columns = dataTable.Columns;
			DataColumn dataColumn = columns.Add("SysDocID", typeof(string));
			DataColumn dataColumn2 = columns.Add("VoucherID", typeof(string));
			dataColumn.AllowDBNull = false;
			dataColumn2.AllowDBNull = false;
			dataTable.PrimaryKey = new DataColumn[2]
			{
				dataColumn,
				dataColumn2
			};
			columns.Add("CompanyID", typeof(string));
			columns.Add("DivisionID", typeof(string));
			columns.Add("CustomerID", typeof(string));
			columns.Add("TransactionDate", typeof(DateTime)).DefaultValue = DateTime.Now;
			columns.Add("DueDate", typeof(DateTime)).DefaultValue = DateTime.Now;
			columns.Add("SalespersonID", typeof(string));
			columns.Add("RequiredDate", typeof(DateTime));
			columns.Add("ShippingAddressID", typeof(string));
			columns.Add("CustomerAddress", typeof(string));
			columns.Add("Status", typeof(byte));
			columns.Add("CurrencyID", typeof(string));
			columns.Add("CurrencyRate", typeof(decimal));
			columns.Add("TermID", typeof(string));
			columns.Add("PriceIncludeTax", typeof(bool));
			columns.Add("ShippingMethodID", typeof(string));
			columns.Add("Reference", typeof(string));
			columns.Add("Note", typeof(string));
			columns.Add("PaymentMethodType", typeof(byte));
			columns.Add("RegisterID", typeof(string));
			columns.Add("SearchValue", typeof(string));
			columns.Add("PONumber", typeof(string));
			columns.Add("ShiftID", typeof(string));
			columns.Add("BatchID", typeof(string));
			columns.Add("PayeeTaxGroupID", typeof(string));
			columns.Add("IsVoid", typeof(bool));
			columns.Add("Discount", typeof(decimal));
			columns.Add("DiscountFC", typeof(decimal));
			columns.Add("TaxOption", typeof(byte));
			columns.Add("TaxAmount", typeof(decimal));
			columns.Add("TaxAmountFC", typeof(decimal));
			columns.Add("Total", typeof(decimal));
			columns.Add("Change", typeof(decimal));
			columns.Add("TotalFC", typeof(decimal));
			columns.Add("IsCash", typeof(bool));
			base.Tables.Add(dataTable);
			dataTable = new DataTable("Sales_POS_Detail");
			columns = dataTable.Columns;
			columns.Add("SysDocID", typeof(string));
			columns.Add("VoucherID", typeof(string));
			columns.Add("ProductID", typeof(string));
			columns.Add("Quantity", typeof(float)).DefaultValue = 0;
			columns.Add("UnitPrice", typeof(decimal)).DefaultValue = 0;
			columns.Add("Amount", typeof(decimal)).DefaultValue = 0;
			columns.Add("AmountFC", typeof(decimal)).DefaultValue = 0;
			columns.Add("UnitPriceFC", typeof(decimal));
			columns.Add("Description", typeof(string));
			columns.Add("UnitID", typeof(string));
			columns.Add("UnitQuantity", typeof(float));
			columns.Add("UnitFactor", typeof(decimal));
			columns.Add("FactorType", typeof(string));
			columns.Add("LocationID", typeof(string));
			columns.Add("SubunitPrice", typeof(decimal));
			columns.Add("Discount", typeof(decimal));
			columns.Add("TaxAmount", typeof(decimal));
			columns.Add("TaxGroupID", typeof(string));
			columns.Add("TaxOption", typeof(byte));
			columns.Add("RowIndex", typeof(short));
			columns.Add("OrderVoucherID", typeof(string));
			columns.Add("OrderSysDocID", typeof(string));
			columns.Add("DNoteVoucherID", typeof(string));
			columns.Add("DNoteSysDocID", typeof(string));
			columns.Add("OrderRowIndex", typeof(int));
			columns.Add("IsDNRow", typeof(bool));
			columns.Add("IsRecost", typeof(bool));
			columns.Add("Barcode", typeof(string));
			base.Tables.Add(dataTable);
			dataTable = new DataTable("Invoice_Payment");
			columns = dataTable.Columns;
			columns.Add("SysDocID", typeof(string));
			columns.Add("VoucherID", typeof(string));
			columns.Add("TransactionDate", typeof(DateTime));
			columns.Add("AccountID", typeof(string));
			columns.Add("RegisterID", typeof(string));
			columns.Add("Amount", typeof(decimal)).DefaultValue = 0;
			columns.Add("PaymentMethodType", typeof(byte));
			columns.Add("PaymentMethodID", typeof(string));
			base.Tables.Add(dataTable);
			Merge(new TaxTransactionData().TaxDetailTable);
		}
	}
}
