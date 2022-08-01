using System;
using System.ComponentModel;
using System.Data;
using System.Runtime.Serialization;

namespace Micromind.Common.Data
{
	[Serializable]
	[DesignerCategory("Code")]
	public class PurchaseClaimData : DataSet
	{
		public const string PURCHASECLAIM_TABLE = "Purchase_Claim";

		public const string SYSDOCID_FIELD = "SysDocID";

		public const string VOUCHERID_FIELD = "VoucherID";

		public const string DIVISIONID_FIELD = "DivisionID";

		public const string COMPANYID_FIELD = "CompanyID";

		public const string SOURCESYSDOCID_FIELD = "SourceSysDocID";

		public const string SOURCEVOUCHERID_FIELD = "SourceVoucherID";

		public const string TRANSACTIONDATE_FIELD = "TransactionDate";

		public const string CLAIMAMOUNT_FIELD = "ClaimAmount";

		public const string CLAIMDETAILS_FIELD = "ClaimDetails";

		public const string CREDITNOTENO_FIELD = "CreditNoteNo";

		public const string CRNOTEAMOUNT_FIELD = "CRNoteAmount";

		public const string CLAIMSTATUS_FIELD = "ClaimStatus";

		public const string ISVOID_FIELD = "IsVoid";

		public const string CURRENCYID_FIELD = "CurrencyID";

		public const string CREATEDBY_FIELD = "CreatedBy";

		public const string DATECREATED_FIELD = "DateCreated";

		public const string UPDATEDBY_FIELD = "UpdatedBy";

		public const string DATEUPDATED_FIELD = "DateUpdated";

		public DataTable PurchaseClaimTable => base.Tables["Purchase_Claim"];

		public PurchaseClaimData()
		{
			BuildDataTables();
		}

		public PurchaseClaimData(SerializationInfo info, StreamingContext context)
			: base(info, context)
		{
		}

		private void BuildDataTables()
		{
			DataTable dataTable = new DataTable("Purchase_Claim");
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
			columns.Add("DivisionID", typeof(string));
			columns.Add("CompanyID", typeof(string));
			columns.Add("SourceSysDocID", typeof(string));
			columns.Add("SourceVoucherID", typeof(string));
			columns.Add("TransactionDate", typeof(DateTime)).DefaultValue = DateTime.Now;
			columns.Add("ClaimAmount", typeof(decimal));
			columns.Add("ClaimDetails", typeof(string));
			columns.Add("CreditNoteNo", typeof(string));
			columns.Add("CRNoteAmount", typeof(string));
			columns.Add("ClaimStatus", typeof(byte));
			columns.Add("IsVoid", typeof(bool));
			columns.Add("CurrencyID", typeof(string));
			base.Tables.Add(dataTable);
		}
	}
}
