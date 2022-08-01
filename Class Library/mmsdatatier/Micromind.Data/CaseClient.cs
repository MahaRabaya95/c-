using Micromind.Common;
using Micromind.Common.Data;
using Micromind.Common.Libraries;
using Micromind.Data.Libraries;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;

namespace Micromind.Data
{
	public sealed class CaseClient : StoreObject
	{
		private const string CASECLIENTID_PARM = "@CaseClientID";

		private const string NAME_PARM = "@Name";

		private const string FOREIGNNAME_PARM = "@ForeignName";

		private const string COMPANYNAME_PARM = "@CompanyName";

		private const string LEGALNAME_PARM = "@FormalName";

		private const string FIRSTNAME_PARM = "@FirstName";

		private const string LASTNAME_PARM = "@LastName";

		private const string MIDDLENAME_PARM = "@MiddleName";

		private const string NOTE_PARM = "@Note";

		private const string PARENTCASECLIENTID_PARM = "@ParentCaseClientID";

		private const string CUSTOMERGROUPID_PARM = "@CustomerGroupID";

		private const string CUSTOMERCLASSID_PARM = "@CustomerClassID";

		private const string AREAID_PARM = "@AreaID";

		private const string COUNTRYID_PARM = "@CountryID";

		private const string ISHOLD_PARM = "@IsHold";

		private const string DATETIMESTAMP_PARM = "@DateTimeStamp";

		private const string CURRENCYID_PARM = "@CurrencyID";

		private const string POSHIDDEN_PARM = "@POSHidden";

		private const string ALLOWCONSIGNMENT_PARM = "@AllowConsignment";

		private const string CONSIGNCOMPERCENT_PARM = "@ConsignComPercent";

		private const string COLLECTIONUSERID_PARM = "@CollectionUserID";

		private const string LEADSOURCEID_PARM = "@LeadSourceID";

		private const string RATINGDATE_PARM = "@RatingDate";

		private const string RATINGBY_PARM = "@RatingBy";

		private const string SOURCELEADID_PARM = "@SourceLeadID";

		private const string STATEMENTEMAIL_PARM = "@StatementEmail";

		private const string DELIVERYINSTRUCTIONS_PARM = "@DeliveryInstructions";

		private const string ACCOUNTINSTRUCTIONS_PARM = "@AccountInstructions";

		private const string RATINGREMARKS_PARM = "@RatingRemarks";

		private const string INSSTATUS_PARM = "@InsStatus";

		private const string INSAPPLICATIONDATE_PARM = "@InsApplicationDate";

		private const string INSEXPIRYDATE_PARM = "@InsExpiryDate";

		private const string INSREQUESTEDAMOUNT_PARM = "@InsRequestedAmount";

		private const string INSAPPROVEDAMOUNT_PARM = "@InsApprovedAmount";

		private const string INSPOLICYNUMBER_PARM = "@InsPolicyNumber";

		private const string INSREMARKS_PARM = "@InsRemarks";

		private const string INSRATING_PARM = "@InsRating";

		private const string INSPROVIDER_PARM = "@InsProviderID";

		private const string INSURANCEID_PARM = "@InsuranceID";

		private const string INSEFFECTIVEDATE_PARM = "@InsEffectiveDate";

		private const string BILLTOADDRESSID_PARM = "@BillToAddressID";

		private const string SHIPTOADDRESSID_PARM = "@ShipToAddressID";

		private const string STATEMENTADDRESSID_PARM = "@StatementAddressID";

		private const string PAYMENTMETHODID_PARM = "@PaymentMethodID";

		private const string SHIPPINGMETHODID_PARM = "@ShippingMethodID";

		private const string ACCEPTCHECKPAYMENT_PARM = "@AcceptCheckPayment";

		private const string ACCEPTPDC_PARM = "@AcceptPDC";

		private const string CREDITLIMITTYPE_PARM = "@CreditLimitType";

		private const string SHORTNAME_PARM = "@ShortName";

		private const string SUBAREAID_PARM = "@SubAreaID";

		private const string RATING_PARM = "@Rating";

		private const string DATEESTABLISHED_PARM = "@DateEstablished";

		private const string DIVISIONID_PARM = "@DivisionID";

		private const string CREDITREVIEWBY_PARM = "@CreditReviewBy";

		private const string CREDITREVIEWDATE_PARM = "@CreditReviewDate";

		private const string ISCUSTOMERSINCE_PARM = "@IsCustomerSince";

		private const string ISWEIGHTINVOICE_PARM = "@IsWeightInvoice";

		private const string LICENSEEXPDATE_PARM = "@LicenseExpDate";

		private const string CONTRACTEXPDATE_PARM = "@ContractExpDate";

		private const string BANKNAME_PARM = "@BankName";

		private const string BANKBRANCH_PARM = "@BankBranch";

		private const string BANKACCOUNTNUMBER_PARM = "@BankAccountNumber";

		private const string VATREGISTRATIONNUMBER_PARM = "@VATRegistrationNumber";

		private const string ARACCOUNTID_PARM = "@ARAccountID";

		private const string STATEMENTSENDMETHOD_PARM = "@StatementSendingMethod";

		private const string PRIMARYADDRESSID_PARM = "@PrimaryAddressID";

		private const string PROFILEDETAILS_PARM = "@ProfileDetails";

		private const string USERDEFINED1_PARM = "@UserDefined1";

		private const string USERDEFINED2_PARM = "@UserDefined2";

		private const string USERDEFINED3_PARM = "@UserDefined3";

		private const string USERDEFINED4_PARM = "@UserDefined4";

		private const string PRICELEVELID_PARM = "@PriceLevelID";

		private const string SALESPERSONID_PARM = "@SalesPersonID";

		private const string BALANCE_PARM = "@Balance";

		private const string PDCAMOUNT_PARM = "@PDCAmount";

		private const string PARTYTYPE_PARM = "@PartyType";

		private const string PARTYID_PARM = "@PartyID";

		private const string ISDEFENDANT_PARM = "@IsDefendant";

		private const string ISPLANTIFF_PARM = "@IsPlantiff";

		private const string CREATEDBY_PARM = "@CreatedBy";

		private const string DATECREATED_PARM = "@DateCreated";

		private const string UPDATEDBY_PARM = "@UpdatedBy";

		private const string DATEUPDATED_PARM = "@DateUpdated";

		private const string CONTACTNAME_PARM = "@ContactName";

		private const string JOBTITLE_PARM = "@JobTitle";

		private const string CONTACTID_PARM = "@ContactID";

		private const string ROWINDEX_PARM = "@RowIndex";

		private const string CREDITAMOUNT_PARM = "@CreditAmount";

		private const string PAYMENTTERMID_PARM = "@PaymentTermID";

		private const string ISINACTIVE_PARM = "@IsInactive";

		private const string ISPARENTPOSTING_PARM = "@IsParentPosting";

		public CaseClient(Config config)
			: base(config)
		{
		}

		private string GetInsertUpdateText(bool isUpdate)
		{
			SqlBuilder sqlBuilder = new SqlBuilder();
			sqlBuilder.AddInsertUpdateParameters("Case_Client", new FieldValue("CaseClientID", "@CaseClientID", isUpdateConditionField: true), new FieldValue("CaseClientName", "@Name"), new FieldValue("ForeignName", "@ForeignName"), new FieldValue("CompanyName", "@CompanyName"), new FieldValue("LegalName", "@FormalName"), new FieldValue("ParentCaseClientID", "@ParentCaseClientID"), new FieldValue("CustomerGroupID", "@CustomerGroupID"), new FieldValue("CustomerClassID", "@CustomerClassID"), new FieldValue("AreaID", "@AreaID"), new FieldValue("IsHold", "@IsHold"), new FieldValue("CountryID", "@CountryID"), new FieldValue("SourceLeadID", "@SourceLeadID"), new FieldValue("StatementEmail", "@StatementEmail"), new FieldValue("PaymentMethodID", "@PaymentMethodID"), new FieldValue("ShippingMethodID", "@ShippingMethodID"), new FieldValue("AcceptCheckPayment", "@AcceptCheckPayment"), new FieldValue("AcceptPDC", "@AcceptPDC"), new FieldValue("CreditLimitType", "@CreditLimitType"), new FieldValue("POSHidden", "@POSHidden"), new FieldValue("LeadSourceID", "@LeadSourceID"), new FieldValue("RatingBy", "@RatingBy"), new FieldValue("RatingDate", "@RatingDate"), new FieldValue("RatingRemarks", "@RatingRemarks"), new FieldValue("InsApplicationDate", "@InsApplicationDate"), new FieldValue("InsApprovedAmount", "@InsApprovedAmount"), new FieldValue("InsExpiryDate", "@InsExpiryDate"), new FieldValue("InsPolicyNumber", "@InsPolicyNumber"), new FieldValue("InsRemarks", "@InsRemarks"), new FieldValue("InsRequestedAmount", "@InsRequestedAmount"), new FieldValue("InsStatus", "@InsStatus"), new FieldValue("InsRating", "@InsRating"), new FieldValue("InsProviderID", "@InsProviderID"), new FieldValue("InsuranceID", "@InsuranceID"), new FieldValue("InsEffectiveDate", "@InsEffectiveDate"), new FieldValue("BillToAddressID", "@BillToAddressID"), new FieldValue("ShipToAddressID", "@ShipToAddressID"), new FieldValue("StatementAddressID", "@StatementAddressID"), new FieldValue("CurrencyID", "@CurrencyID"), new FieldValue("AllowConsignment", "@AllowConsignment"), new FieldValue("ConsignComPercent", "@ConsignComPercent"), new FieldValue("CollectionUserID", "@CollectionUserID"), new FieldValue("ShortName", "@ShortName"), new FieldValue("SubAreaID", "@SubAreaID"), new FieldValue("Rating", "@Rating"), new FieldValue("DateEstablished", "@DateEstablished"), new FieldValue("DivisionID", "@DivisionID"), new FieldValue("CreditReviewBy", "@CreditReviewBy"), new FieldValue("CreditReviewDate", "@CreditReviewDate"), new FieldValue("IsCustomerSince", "@IsCustomerSince"), new FieldValue("IsWeightInvoice", "@IsWeightInvoice"), new FieldValue("ContractExpDate", "@ContractExpDate"), new FieldValue("LicenseExpDate", "@LicenseExpDate"), new FieldValue("BankName", "@BankName"), new FieldValue("BankBranch", "@BankBranch"), new FieldValue("BankAccountNumber", "@BankAccountNumber"), new FieldValue("VATRegistrationNumber", "@VATRegistrationNumber"), new FieldValue("ARAccountID", "@ARAccountID"), new FieldValue("PrimaryAddressID", "@PrimaryAddressID"), new FieldValue("ProfileDetails", "@ProfileDetails"), new FieldValue("PartyType", "@PartyType"), new FieldValue("PartyID", "@PartyID"), new FieldValue("IsDefendant", "@IsDefendant"), new FieldValue("IsPlantiff", "@IsPlantiff"), new FieldValue("StatementSendingMethod", "@StatementSendingMethod"), new FieldValue("UserDefined1", "@UserDefined1"), new FieldValue("UserDefined2", "@UserDefined2"), new FieldValue("UserDefined3", "@UserDefined3"), new FieldValue("UserDefined4", "@UserDefined4"), new FieldValue("PriceLevelID", "@PriceLevelID"), new FieldValue("SalesPersonID", "@SalesPersonID"), new FieldValue("CreditAmount", "@CreditAmount"), new FieldValue("IsInactive", "@IsInactive"), new FieldValue("PaymentTermID", "@PaymentTermID"), new FieldValue("IsParentPosting", "@IsParentPosting"), new FieldValue("DeliveryInstructions", "@DeliveryInstructions"), new FieldValue("AccountInstructions", "@AccountInstructions"), new FieldValue("Note", "@Note"));
			if (isUpdate)
			{
				sqlBuilder.AddInsertUpdateParameters("Case_Client", new FieldValue("DateUpdated", "@DateUpdated", isUpdateConditionField: true, checkForNullValue: true));
			}
			if (isUpdate)
			{
				return sqlBuilder.GetUpdateExpression();
			}
			return sqlBuilder.GetInsertExpression();
		}

		private SqlCommand GetInsertUpdateCommand(bool isUpdate)
		{
			SqlParameterCollection parameters;
			if (isUpdate)
			{
				if (updateCommand != null)
				{
					return updateCommand;
				}
				updateCommand = new SqlCommand(GetInsertUpdateText(isUpdate: true), base.DBConfig.Connection);
				updateCommand.CommandType = CommandType.Text;
				parameters = updateCommand.Parameters;
			}
			else
			{
				if (insertCommand != null)
				{
					return insertCommand;
				}
				insertCommand = new SqlCommand(GetInsertUpdateText(isUpdate: false), base.DBConfig.Connection);
				insertCommand.CommandType = CommandType.Text;
				parameters = insertCommand.Parameters;
			}
			parameters.Add("@CaseClientID", SqlDbType.NVarChar);
			parameters.Add("@Name", SqlDbType.NVarChar);
			parameters.Add("@ForeignName", SqlDbType.NVarChar);
			parameters.Add("@CompanyName", SqlDbType.NVarChar);
			parameters.Add("@FormalName", SqlDbType.NVarChar);
			parameters.Add("@ParentCaseClientID", SqlDbType.NVarChar);
			parameters.Add("@CustomerGroupID", SqlDbType.NVarChar);
			parameters.Add("@BillToAddressID", SqlDbType.NVarChar);
			parameters.Add("@ShipToAddressID", SqlDbType.NVarChar);
			parameters.Add("@StatementAddressID", SqlDbType.NVarChar);
			parameters.Add("@StatementEmail", SqlDbType.NVarChar);
			parameters.Add("@ShortName", SqlDbType.NVarChar);
			parameters.Add("@SubAreaID", SqlDbType.NVarChar);
			parameters.Add("@Rating", SqlDbType.TinyInt);
			parameters.Add("@DateEstablished", SqlDbType.DateTime);
			parameters.Add("@DivisionID", SqlDbType.NVarChar);
			parameters.Add("@CreditReviewBy", SqlDbType.NVarChar);
			parameters.Add("@CreditReviewDate", SqlDbType.DateTime);
			parameters.Add("@IsCustomerSince", SqlDbType.DateTime);
			parameters.Add("@AllowConsignment", SqlDbType.Bit);
			parameters.Add("@ConsignComPercent", SqlDbType.Decimal);
			parameters.Add("@CollectionUserID", SqlDbType.NVarChar);
			parameters.Add("@LeadSourceID", SqlDbType.NVarChar);
			parameters.Add("@RatingDate", SqlDbType.DateTime);
			parameters.Add("@RatingBy", SqlDbType.NVarChar);
			parameters.Add("@RatingRemarks", SqlDbType.NVarChar);
			parameters.Add("@InsApplicationDate", SqlDbType.DateTime);
			parameters.Add("@InsApprovedAmount", SqlDbType.Money);
			parameters.Add("@InsExpiryDate", SqlDbType.DateTime);
			parameters.Add("@InsPolicyNumber", SqlDbType.NVarChar);
			parameters.Add("@InsRemarks", SqlDbType.NVarChar);
			parameters.Add("@InsRequestedAmount", SqlDbType.Money);
			parameters.Add("@InsStatus", SqlDbType.TinyInt);
			parameters.Add("@InsRating", SqlDbType.TinyInt);
			parameters.Add("@InsProviderID", SqlDbType.NVarChar);
			parameters.Add("@InsuranceID", SqlDbType.NVarChar);
			parameters.Add("@InsEffectiveDate", SqlDbType.DateTime);
			parameters.Add("@CustomerClassID", SqlDbType.NVarChar);
			parameters.Add("@IsHold", SqlDbType.Bit);
			parameters.Add("@IsWeightInvoice", SqlDbType.Bit);
			parameters.Add("@POSHidden", SqlDbType.Bit);
			parameters.Add("@AreaID", SqlDbType.NVarChar);
			parameters.Add("@CountryID", SqlDbType.NVarChar);
			parameters.Add("@PaymentMethodID", SqlDbType.NVarChar);
			parameters.Add("@ShippingMethodID", SqlDbType.NVarChar);
			parameters.Add("@AcceptCheckPayment", SqlDbType.Bit);
			parameters.Add("@AcceptPDC", SqlDbType.Bit);
			parameters.Add("@CreditLimitType", SqlDbType.TinyInt);
			parameters.Add("@BankName", SqlDbType.NVarChar);
			parameters.Add("@BankBranch", SqlDbType.NVarChar);
			parameters.Add("@BankAccountNumber", SqlDbType.NVarChar);
			parameters.Add("@VATRegistrationNumber", SqlDbType.NVarChar);
			parameters.Add("@ARAccountID", SqlDbType.NVarChar);
			parameters.Add("@PrimaryAddressID", SqlDbType.NVarChar);
			parameters.Add("@ProfileDetails", SqlDbType.NVarChar);
			parameters.Add("@StatementSendingMethod", SqlDbType.TinyInt);
			parameters.Add("@UserDefined1", SqlDbType.NVarChar);
			parameters.Add("@UserDefined2", SqlDbType.NVarChar);
			parameters.Add("@UserDefined3", SqlDbType.NVarChar);
			parameters.Add("@UserDefined4", SqlDbType.NVarChar);
			parameters.Add("@PriceLevelID", SqlDbType.NVarChar);
			parameters.Add("@SalesPersonID", SqlDbType.NVarChar);
			parameters.Add("@CreditAmount", SqlDbType.Money);
			parameters.Add("@PaymentTermID", SqlDbType.NVarChar);
			parameters.Add("@IsInactive", SqlDbType.Bit);
			parameters.Add("@IsParentPosting", SqlDbType.Bit);
			parameters.Add("@Note", SqlDbType.NVarChar);
			parameters.Add("@CurrencyID", SqlDbType.NVarChar);
			parameters.Add("@ContractExpDate", SqlDbType.DateTime);
			parameters.Add("@LicenseExpDate", SqlDbType.DateTime);
			parameters.Add("@DeliveryInstructions", SqlDbType.NVarChar);
			parameters.Add("@AccountInstructions", SqlDbType.NVarChar);
			parameters.Add("@SourceLeadID", SqlDbType.NVarChar);
			parameters.Add("@PartyType", SqlDbType.Int);
			parameters.Add("@PartyID", SqlDbType.NVarChar);
			parameters.Add("@IsDefendant", SqlDbType.Bit);
			parameters.Add("@IsPlantiff", SqlDbType.Bit);
			parameters["@CaseClientID"].SourceColumn = "CaseClientID";
			parameters["@Name"].SourceColumn = "CaseClientName";
			parameters["@BillToAddressID"].SourceColumn = "BillToAddressID";
			parameters["@ShipToAddressID"].SourceColumn = "ShipToAddressID";
			parameters["@StatementAddressID"].SourceColumn = "StatementAddressID";
			parameters["@StatementEmail"].SourceColumn = "StatementEmail";
			parameters["@ForeignName"].SourceColumn = "ForeignName";
			parameters["@CompanyName"].SourceColumn = "CompanyName";
			parameters["@FormalName"].SourceColumn = "LegalName";
			parameters["@ParentCaseClientID"].SourceColumn = "ParentCaseClientID";
			parameters["@CustomerGroupID"].SourceColumn = "CustomerGroupID";
			parameters["@CustomerClassID"].SourceColumn = "CustomerClassID";
			parameters["@IsHold"].SourceColumn = "IsHold";
			parameters["@AreaID"].SourceColumn = "AreaID";
			parameters["@CountryID"].SourceColumn = "CountryID";
			parameters["@SourceLeadID"].SourceColumn = "SourceLeadID";
			parameters["@PaymentMethodID"].SourceColumn = "PaymentMethodID";
			parameters["@ShippingMethodID"].SourceColumn = "ShippingMethodID";
			parameters["@AcceptCheckPayment"].SourceColumn = "AcceptCheckPayment";
			parameters["@AcceptPDC"].SourceColumn = "AcceptPDC";
			parameters["@AllowConsignment"].SourceColumn = "AllowConsignment";
			parameters["@ConsignComPercent"].SourceColumn = "ConsignComPercent";
			parameters["@IsWeightInvoice"].SourceColumn = "IsWeightInvoice";
			parameters["@CollectionUserID"].SourceColumn = "CollectionUserID";
			parameters["@LeadSourceID"].SourceColumn = "LeadSourceID";
			parameters["@ContractExpDate"].SourceColumn = "ContractExpDate";
			parameters["@LicenseExpDate"].SourceColumn = "LicenseExpDate";
			parameters["@RatingBy"].SourceColumn = "RatingBy";
			parameters["@RatingDate"].SourceColumn = "RatingDate";
			parameters["@RatingRemarks"].SourceColumn = "RatingRemarks";
			parameters["@InsApplicationDate"].SourceColumn = "InsApplicationDate";
			parameters["@InsApprovedAmount"].SourceColumn = "InsApprovedAmount";
			parameters["@InsExpiryDate"].SourceColumn = "InsExpiryDate";
			parameters["@InsPolicyNumber"].SourceColumn = "InsPolicyNumber";
			parameters["@InsRemarks"].SourceColumn = "InsRemarks";
			parameters["@InsRequestedAmount"].SourceColumn = "InsRequestedAmount";
			parameters["@InsStatus"].SourceColumn = "InsStatus";
			parameters["@InsRating"].SourceColumn = "InsRating";
			parameters["@InsProviderID"].SourceColumn = "InsProviderID";
			parameters["@InsuranceID"].SourceColumn = "InsuranceID";
			parameters["@InsEffectiveDate"].SourceColumn = "InsEffectiveDate";
			parameters["@ShortName"].SourceColumn = "ShortName";
			parameters["@SubAreaID"].SourceColumn = "SubAreaID";
			parameters["@Rating"].SourceColumn = "Rating";
			parameters["@DateEstablished"].SourceColumn = "DateEstablished";
			parameters["@DivisionID"].SourceColumn = "DivisionID";
			parameters["@CreditReviewBy"].SourceColumn = "CreditReviewBy";
			parameters["@CreditReviewDate"].SourceColumn = "CreditReviewDate";
			parameters["@IsCustomerSince"].SourceColumn = "IsCustomerSince";
			parameters["@IsParentPosting"].SourceColumn = "IsParentPosting";
			parameters["@POSHidden"].SourceColumn = "POSHidden";
			parameters["@CreditLimitType"].SourceColumn = "CreditLimitType";
			parameters["@BankName"].SourceColumn = "BankName";
			parameters["@BankBranch"].SourceColumn = "BankBranch";
			parameters["@BankAccountNumber"].SourceColumn = "BankAccountNumber";
			parameters["@VATRegistrationNumber"].SourceColumn = "VATRegistrationNumber";
			parameters["@ARAccountID"].SourceColumn = "ARAccountID";
			parameters["@PrimaryAddressID"].SourceColumn = "PrimaryAddressID";
			parameters["@ProfileDetails"].SourceColumn = "ProfileDetails";
			parameters["@StatementSendingMethod"].SourceColumn = "StatementSendingMethod";
			parameters["@UserDefined1"].SourceColumn = "UserDefined1";
			parameters["@UserDefined2"].SourceColumn = "UserDefined2";
			parameters["@UserDefined3"].SourceColumn = "UserDefined3";
			parameters["@UserDefined4"].SourceColumn = "UserDefined4";
			parameters["@PriceLevelID"].SourceColumn = "PriceLevelID";
			parameters["@SalesPersonID"].SourceColumn = "SalesPersonID";
			parameters["@CreditAmount"].SourceColumn = "CreditAmount";
			parameters["@IsInactive"].SourceColumn = "IsInactive";
			parameters["@PaymentTermID"].SourceColumn = "PaymentTermID";
			parameters["@DeliveryInstructions"].SourceColumn = "DeliveryInstructions";
			parameters["@AccountInstructions"].SourceColumn = "AccountInstructions";
			parameters["@Note"].SourceColumn = "Note";
			parameters["@CurrencyID"].SourceColumn = "CurrencyID";
			parameters["@PartyType"].SourceColumn = "PartyType";
			parameters["@PartyID"].SourceColumn = "PartyID";
			parameters["@IsDefendant"].SourceColumn = "IsDefendant";
			parameters["@IsPlantiff"].SourceColumn = "IsPlantiff";
			if (isUpdate)
			{
				parameters.Add("@DateUpdated", SqlDbType.DateTime);
				parameters["@DateUpdated"].SourceColumn = "DateUpdated";
			}
			if (isUpdate)
			{
				return updateCommand;
			}
			return insertCommand;
		}

		private string GetInsertUpdateCustomerContactText(bool isUpdate)
		{
			SqlBuilder sqlBuilder = new SqlBuilder();
			sqlBuilder.AddInsertUpdateParameters("Case_Client_Contact_Detail", new FieldValue("CaseClientID", "@CaseClientID", isUpdateConditionField: true), new FieldValue("ContactID", "@ContactID", isUpdateConditionField: true), new FieldValue("JobTitle", "@JobTitle"), new FieldValue("RowIndex", "@RowIndex"), new FieldValue("Note", "@Note"));
			if (isUpdate)
			{
				return sqlBuilder.GetUpdateExpression();
			}
			return sqlBuilder.GetInsertExpression();
		}

		private SqlCommand GetInsertUpdateCustomerContactCommand(bool isUpdate)
		{
			SqlCommand sqlCommand = null;
			SqlParameterCollection parameters;
			if (isUpdate)
			{
				sqlCommand = new SqlCommand(GetInsertUpdateCustomerContactText(isUpdate: true), base.DBConfig.Connection);
				sqlCommand.CommandType = CommandType.Text;
				parameters = sqlCommand.Parameters;
			}
			else
			{
				sqlCommand = new SqlCommand(GetInsertUpdateCustomerContactText(isUpdate: false), base.DBConfig.Connection);
				sqlCommand.CommandType = CommandType.Text;
				parameters = sqlCommand.Parameters;
			}
			parameters.Add("@CaseClientID", SqlDbType.NVarChar);
			parameters.Add("@ContactID", SqlDbType.NVarChar);
			parameters.Add("@JobTitle", SqlDbType.NVarChar);
			parameters.Add("@RowIndex", SqlDbType.NVarChar);
			parameters.Add("@Note", SqlDbType.NVarChar);
			parameters["@CaseClientID"].SourceColumn = "CaseClientID";
			parameters["@ContactID"].SourceColumn = "ContactID";
			parameters["@JobTitle"].SourceColumn = "JobTitle";
			parameters["@RowIndex"].SourceColumn = "RowIndex";
			parameters["@Note"].SourceColumn = "Note";
			return sqlCommand;
		}

		public bool InsertUpdateCustomer(CaseClientData accountCaseClientData, bool isUpdate)
		{
			bool flag = true;
			SqlCommand insertUpdateCommand = GetInsertUpdateCommand(isUpdate);
			SqlTransaction sqlTransaction = null;
			try
			{
				sqlTransaction = (insertUpdateCommand.Transaction = base.DBConfig.StartNewTransaction());
				flag = ((!isUpdate) ? Insert(accountCaseClientData, "Case_Client", insertUpdateCommand) : Update(accountCaseClientData, "Case_Client", insertUpdateCommand));
				if (flag)
				{
					insertUpdateCommand = new CaseClientAddresses(base.DBConfig).GetInsertUpdateCommand(isUpdate);
					insertUpdateCommand.Transaction = sqlTransaction;
					if (isUpdate)
					{
						flag &= Update(accountCaseClientData, "Case_Client_Address", insertUpdateCommand);
					}
					else if (accountCaseClientData.CaseClientAddressTable.Rows.Count > 0)
					{
						flag &= Insert(accountCaseClientData, "Case_Client_Address", insertUpdateCommand);
					}
				}
				string text = accountCaseClientData.CaseClientTable.Rows[0]["CaseClientID"].ToString();
				if (flag)
				{
					if (isUpdate)
					{
						DeleteCustomerContacts(sqlTransaction, text.ToString());
					}
					if (accountCaseClientData.CaseClientContactTable.Rows.Count > 0)
					{
						insertUpdateCommand = GetInsertUpdateCustomerContactCommand(isUpdate: false);
						insertUpdateCommand.Transaction = sqlTransaction;
						flag &= Insert(accountCaseClientData, "Case_Client_Contact_Detail", insertUpdateCommand);
					}
				}
				if (isUpdate)
				{
					AddActivityLog("Case Client", text, ActivityTypes.Update, sqlTransaction);
				}
				else
				{
					AddActivityLog("Case Client", text, ActivityTypes.Add, sqlTransaction);
				}
				UpdateTableRowInsertUpdateInfo("Case_Client", "CaseClientID", text, sqlTransaction, !isUpdate);
				flag &= new Approval(base.DBConfig).CreateCardApprovalTasks(DataComboType.CaseClient, text.ToString(), "Case_Client", "CaseClientID", sqlTransaction);
				return flag;
			}
			catch
			{
				flag = false;
				throw;
			}
			finally
			{
				base.DBConfig.EndTransaction(flag);
			}
		}

		private string GetUpdateCustomerParentChildText(bool isUpdate)
		{
			SqlBuilder sqlBuilder = new SqlBuilder();
			sqlBuilder.AddInsertUpdateParameters("Case_Client", new FieldValue("ParentCaseClientID", "@ParentCaseClientID"), new FieldValue("CaseClientID", "@CaseClientID", isUpdateConditionField: true));
			if (isUpdate)
			{
				return sqlBuilder.GetUpdateExpression();
			}
			return sqlBuilder.GetInsertExpression();
		}

		private SqlCommand GetUpdateCustomerParentChildCommand(bool isUpdate)
		{
			SqlCommand sqlCommand = null;
			SqlParameterCollection parameters;
			if (isUpdate)
			{
				sqlCommand = new SqlCommand(GetUpdateCustomerParentChildText(isUpdate: true), base.DBConfig.Connection);
				sqlCommand.CommandType = CommandType.Text;
				parameters = sqlCommand.Parameters;
			}
			else
			{
				sqlCommand = new SqlCommand(GetUpdateCustomerParentChildText(isUpdate: false), base.DBConfig.Connection);
				sqlCommand.CommandType = CommandType.Text;
				parameters = sqlCommand.Parameters;
			}
			parameters.Add("@CaseClientID", SqlDbType.NVarChar);
			parameters.Add("@ParentCaseClientID", SqlDbType.NVarChar);
			parameters["@CaseClientID"].SourceColumn = "CaseClientID";
			parameters["@ParentCaseClientID"].SourceColumn = "ParentCaseClientID";
			return sqlCommand;
		}

		public bool UpdateCustomerParentChildRelation(CaseClientData CaseClientData, bool isUpdate)
		{
			bool flag = true;
			SqlTransaction sqlTransaction = null;
			try
			{
				sqlTransaction = base.DBConfig.StartNewTransaction();
				string text = CaseClientData.CaseClientTable.Rows[0]["ParentCaseClientID"].ToString();
				flag &= DeleteCustomerParentChildRelation(sqlTransaction, text);
				flag &= UpdateCustomerParentChildRelation(sqlTransaction, CaseClientData);
				if (isUpdate)
				{
					AddActivityLog("CaseClient", text, ActivityTypes.Update, sqlTransaction);
				}
				UpdateTableRowInsertUpdateInfo("Case_Client", "CaseClientID", text, sqlTransaction, !isUpdate);
				return flag;
			}
			catch
			{
				flag = false;
				throw;
			}
			finally
			{
				base.DBConfig.EndTransaction(flag);
			}
		}

		private bool UpdateCustomerParentChildRelation(SqlTransaction sqlTransaction, CaseClientData CaseClientData)
		{
			bool flag = true;
			string text = string.Empty;
			string text2 = CaseClientData.CaseClientTable.Rows[0]["ParentCaseClientID"].ToString();
			try
			{
				for (int i = 0; i < CaseClientData.CaseClientTable.Rows.Count; i++)
				{
					text = text + "'" + CaseClientData.CaseClientTable.Rows[i]["CaseClientID"].ToString() + "'";
					text += ((i < CaseClientData.CaseClientTable.Rows.Count - 1) ? "," : string.Empty);
				}
				string commandText = "UPDATE Case_Client SET ParentCaseClientID = '" + text2 + "' WHERE CaseClientID IN(" + text + ")";
				return Update(commandText, sqlTransaction);
			}
			catch
			{
				throw;
			}
		}

		public bool DeleteCustomerParentChildRelation(string parentId)
		{
			bool result = true;
			SqlTransaction sqlTransaction = null;
			try
			{
				sqlTransaction = base.DBConfig.StartNewTransaction();
				result = DeleteCustomerParentChildRelation(sqlTransaction, parentId);
				return result;
			}
			catch
			{
				result = false;
				throw;
			}
			finally
			{
				base.DBConfig.EndTransaction(result);
			}
		}

		private bool DeleteCustomerParentChildRelation(SqlTransaction sqlTransaction, string parentID)
		{
			bool flag = true;
			try
			{
				string commandText = "UPDATE Case_Client SET ParentCaseClientID = NULL WHERE ParentCaseClientID = '" + parentID + "'";
				return Update(commandText, sqlTransaction);
			}
			catch
			{
				throw;
			}
		}

		private bool DeleteCustomerContacts(SqlTransaction sqlTransaction, string customerID)
		{
			bool flag = true;
			try
			{
				string commandText = "DELETE FROM Case_Client_Contact_Detail WHERE CaseClientID = '" + customerID + "'";
				return Delete(commandText, sqlTransaction);
			}
			catch
			{
				throw;
			}
		}

		public CaseClientData GetCustomer()
		{
			SqlBuilder sqlBuilder = new SqlBuilder();
			sqlBuilder.AddTable("Case_Client");
			CaseClientData caseClientData = new CaseClientData();
			sqlBuilder.UseDistinct = false;
			FillDataSet(caseClientData, "Case_Client", sqlBuilder);
			return caseClientData;
		}

		public bool DeleteCustomer(string customerID)
		{
			bool flag = true;
			try
			{
				SqlTransaction trans = base.DBConfig.StartNewTransaction();
				string commandText = "DELETE FROM UDF_Customer  WHERE EntityID = '" + customerID + "'";
				flag = Delete(commandText, trans);
				commandText = "DELETE FROM Case_Client_Address  WHERE CaseClientID = '" + customerID + "'";
				flag &= Delete(commandText, trans);
				commandText = "DELETE FROM Case_Client_Contact_Detail  WHERE CaseClientID = '" + customerID + "'";
				flag &= Delete(commandText, trans);
				commandText = "DELETE FROM Entity_Category_Detail  WHERE EntityID = '" + customerID + "' AND EntityType = " + 29;
				flag &= Delete(commandText, trans);
				commandText = "DELETE FROM Case_Client WHERE CaseClientID = '" + customerID + "'";
				flag &= Delete(commandText, trans);
				if (!flag)
				{
					return flag;
				}
				AddActivityLog("Case Client", customerID, ActivityTypes.Delete, null);
				return flag;
			}
			catch
			{
				flag = false;
				throw;
			}
			finally
			{
				base.DBConfig.EndTransaction(flag);
			}
		}

		public CaseClientData GetCustomerByID(string id)
		{
			new SqlBuilder();
			string textCommand = "SELECT CUS.*  FROM Case_Client CUS WHERE CUS.CaseClientID = '" + id + "'";
			CaseClientData caseClientData = new CaseClientData();
			FillDataSet(caseClientData, "Case_Client", textCommand);
			if (caseClientData == null || caseClientData.Tables.Count == 0 || caseClientData.Tables[0].Rows.Count == 0)
			{
				return caseClientData;
			}
			string a = "";
			if (a == "")
			{
				a = "PRIMARY";
			}
			a = caseClientData.Tables["Case_Client"].Rows[0]["PrimaryAddressID"].ToString();
			textCommand = "SELECT * FROM Case_Client_Address\r\n                            WHERE CaseClientID='" + id + "' AND AddressID='" + a + "'";
			FillDataSet(caseClientData, "Case_Client_Address", textCommand);
			textCommand = "SELECT     CD.CaseClientID, CD.ContactID, CD.JobTitle, C.FirstName,C.LastName,CD.Note,C.Country,C.City,C.Phone1,C.Phone2,C.Email1,C.Email2,Mobile\r\n                        FROM Case_Client_Contact_Detail AS CD INNER JOIN Contact C ON C.ContactID = CD.ContactID \r\n                            WHERE CaseClientID='" + id + "' ORDER BY RowIndex";
			FillDataSet(caseClientData, "Case_Client_Contact_Detail", textCommand);
			textCommand = "SELECT * FROM UDF_Customer WHERE EntityID = '" + id + "'";
			FillDataSet(caseClientData, "UDF", textCommand);
			return caseClientData;
		}

		public DataSet GetCustomerByFields(params string[] columns)
		{
			return GetCustomerByFields(null, isInactive: true, columns);
		}

		public DataSet GetCustomerByFields(string[] customerID, params string[] columns)
		{
			return GetCustomerByFields(customerID, isInactive: true, columns);
		}

		public DataSet GetCustomerByFields(string[] ids, bool isInactive, params string[] columns)
		{
			SqlBuilder sqlBuilder = new SqlBuilder();
			sqlBuilder.AddTable("Case_Client");
			foreach (string text in columns)
			{
				ApplicationAssert.CheckCondition(text.IndexOf(".") >= 0, "A table name with the column name must be specified. eg. table.column.", 0);
				string tableName = text.Substring(0, text.IndexOf("."));
				string columnName = text.Substring(text.IndexOf(".") + 1);
				sqlBuilder.AddColumn(tableName, columnName);
			}
			if (ids != null && ids.Length != 0)
			{
				CommandHelper commandHelper = new CommandHelper();
				commandHelper.FieldName = "CaseClientID";
				commandHelper.FieldValue = ids;
				commandHelper.SqlFieldType = SqlDbType.NVarChar;
				commandHelper.TableName = "Case_Client";
				sqlBuilder.AddCommandHelper(commandHelper);
			}
			if (!isInactive)
			{
				CommandHelper commandHelper2 = new CommandHelper();
				commandHelper2.FieldName = "IsInactive";
				commandHelper2.FieldValue = 0;
				commandHelper2.SqlFieldType = SqlDbType.NVarChar;
				commandHelper2.TableName = "Case_Client";
				sqlBuilder.AddCommandHelper(commandHelper2);
			}
			DataSet dataSet = new DataSet();
			dataSet.EnforceConstraints = false;
			sqlBuilder.UseDistinct = false;
			FillDataSet(dataSet, "Case_Client", sqlBuilder);
			return dataSet;
		}

		public DataSet GetCustomerList(bool showInactive)
		{
			DataSet dataSet = new DataSet();
			string text = "SELECT Customer.IsInactive AS [I],Customer.CustomerID AS [Customer Code],CASE WHEN ShortName = '' THEN  Customer.CustomerName ELSE Customer.CustomerName + ' [' + ShortName + ']' END AS Name, Country.CountryName AS Country,\r\n\t\t\t\t\t            Area.AreaName AS Area, CA.City, CA.Phone1 AS Phone, CA.Mobile, CA.Fax, CA.Email\r\n                                FROM  Customer INNER JOIN\r\n                                Customer_Address AS CA ON Customer.CustomerID = CA.CustomerID AND CA.AddressID = 'PRIMARY' \r\n                                LEFT OUTER JOIN Country ON Country.CountryID = Customer.CountryID\r\n\t\t\t\t\t            LEFT OUTER JOIN Area ON Area.AreaID = Customer.AreaID";
			if (!showInactive)
			{
				text += " WHERE ISNULL(Customer.IsInactive,'False')='False'";
			}
			FillDataSet(dataSet, "Case_Client", text);
			return dataSet;
		}

		public DataSet GetTenantList(bool showInactive)
		{
			DataSet dataSet = new DataSet();
			string text = "SELECT Customer.CustomerID AS [Customer Code],CASE WHEN ShortName = '' THEN  Customer.CustomerName ELSE Customer.CustomerName + ' [' + ShortName + ']' END AS Name, Country.CountryName AS Country,\r\n\t\t\t\t\t            Area.AreaName AS Area, CA.City, CA.Phone1 AS Phone, CA.Mobile, CA.Fax, CA.Email\r\n                                FROM  Customer INNER JOIN\r\n                                Customer_Address AS CA ON Customer.CustomerID = CA.CustomerID AND CA.AddressID = 'PRIMARY' \r\n                                LEFT OUTER JOIN Country ON Country.CountryID = Customer.CountryID\r\n\t\t\t\t\t            LEFT OUTER JOIN Area ON Area.AreaID = Customer.AreaID";
			if (!showInactive)
			{
				text += " WHERE ISNULL(Customer.IsInactive,'False')='False'";
			}
			FillDataSet(dataSet, "Case_Client", text);
			return dataSet;
		}

		public DataSet GetCustomerDocumentAddress(string customerID, string addressField)
		{
			DataSet dataSet = new DataSet();
			string textCommand = "SELECT " + addressField + ",AddressPrintFormat\r\n                           FROM Customer INNER JOIN Customer_Address CA ON Customer.CustomerID=CA.CustomerID AND Customer." + addressField + "=CA.AddressID\r\n                           WHERE CA.CustomerID='" + customerID + "'";
			FillDataSet(dataSet, "Case_Client", textCommand);
			return dataSet;
		}

		public string GetCustomerAddressPrintFormat(string customerID, string addressID)
		{
			new DataSet();
			string exp = "SELECT AddressPrintFormat\r\n                           FROM  Customer_Address CA  \r\n                           WHERE CA.CustomerID='" + customerID + "' AND CA.AddressID = '" + addressID + "'";
			object obj = ExecuteScalar(exp);
			if (obj.IsDBNullOrEmpty())
			{
				return "";
			}
			return obj.ToString();
		}

		public DataSet GetCustomerRelationshipList()
		{
			DataSet dataSet = new DataSet();
			string textCommand = "SELECT P.CustomerID [Parent Customer ID], P.CustomerName [Parent Customer Name], C.CustomerID [Child Customer ID], C.CustomerName [Child Customer Name] \r\n                           FROM Customer C INNER JOIN Customer P ON P.CustomerID = C.ParentCustomerID ";
			FillDataSet(dataSet, "Case_Client", textCommand);
			return dataSet;
		}

		public DataSet GetCaseClientComboList()
		{
			return GetCaseClientComboList("");
		}

		public DataSet GetCaseClientComboList(string id)
		{
			DataSet dataSet = new DataSet();
			string str = "SELECT CaseClientID [Code],CaseClientName  + (CASE WHEN ISNULL(ShortName,'')='' THEN '' ELSE ' [' + ShortName + ']' END) AS Name ,\r\n                            REPLACE(CaseClientID,' ','') + REPLACE(CaseClientName,' ','') +REPLACE(ShortName,' ','')  AS SearchColumn,ISNULL(CurrencyID,(SELECT CurrencyID FROM Currency WHERE IsBase='True')) AS CurrencyID,\r\n                            AllowConsignment, ISNULL(IsHold,'False') AS IsHold,\r\n                            PriceLevelID, Balance, ParentCaseClientID, PaymentTermID , PaymentMethodID, ShippingMethodID,BillToAddressID, ShipToAddressID, SalesPersonID, IsWeightInvoice,CustomerClassID,PartyType,IsDefendant,IsPlantiff,\r\n                            (SELECT COUNT(*) FROM Case_Client C2 WHERE C2.ParentCaseClientID = C.CaseClientID) AS ChildCustomers\r\n                            FROM Case_Client C ";
			str = ((!(id == "")) ? (str + " WHERE CaseClientID = '" + id + "' ") : (str + " WHERE ISNULL(C.ISINACTIVE,0) <>1 "));
			str += " ORDER BY CaseClientID,CaseClientName";
			FillDataSet(dataSet, "Case_Client", str);
			return dataSet;
		}

		public string GetCustomerARAccountID(string sysDocID, string customerID)
		{
			string exp = "  SELECT ISNULL(CUS.ARAccountID,ISNULL(CLS.ARAccountID, LOC.ARAccountID)) AS ARAccountID FROM  Customer CUS \r\n                          LEFT OUTER JOIN Customer_Class CLS ON CUS.CustomerClassID = CLS.ClassID\r\n                          LEFT OUTER JOIN Location LOC ON Loc.LocationID  = (SELECT LocationID FROM System_Document WHERE SysDocID = '" + sysDocID + "')\r\n                          WHERE CUstomerID = '" + customerID + "'";
			object obj = ExecuteScalar(exp);
			if (obj != null && obj != DBNull.Value)
			{
				return obj.ToString();
			}
			return "";
		}

		public DataSet GetCustomerBalanceSummary(string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string fromSalesperson, string toSalesperson, string fromCountry, string toCountry, bool showZeroBalance, bool isFC, string customerIDs)
		{
			DataSet dataSet = new DataSet();
			string text = "";
			if (isFC)
			{
				text = "FC";
			}
			string baseCurrencyID = new Currencies(base.DBConfig).GetBaseCurrencyID();
			baseCurrencyID = ((!isFC) ? ("'" + baseCurrencyID + "' AS CurrencyID,") : " Customer.CurrencyID,");
			string str = "SELECT DISTINCT ARJ.CustomerID [Customer Code] ,CustomerName AS [Customer Name], ISNULL((SELECT FullName from Salesperson WHERE SalespersonID = Customer.SalesPersonID), 'UNKNOWN') AS Salesperson, \r\n\t\t\t\tISNULL((SELECT CountryName from Country WHERE CountryID = Customer.CountryID), 'UNKNOWN') AS Country, ";
			str += baseCurrencyID;
			str = str + " ISNULL((SELECT SUM(ISNULL(Debit" + text + ",0)- ISNULL(Credit" + text + ",0)) ";
			if (!isFC)
			{
				str += " + ISNULL((SELECT SUM(ISNULL(RealizedGainLoss,0)) FROM AR_Payment_Allocation ARP WHERE ARP.CustomerID=ARJ.CustomerID),0) ";
			}
			str += " FROM ARJournal ARJ2 \r\n                             WHERE ARJ.CustomerID=ARJ2.CustomerID AND ISNULL(ISPDCRow,'False') = 'False' \r\n                             AND ISNULL(IsVoid,'False')='False'),0) \r\n                             AS [Net Balance]\r\n                             FROM ARJournal ARJ INNER JOIN Customer ON ARJ.CustomerID=Customer.CustomerID\r\n                              WHERE  ISNULL(IsVoid,'False')='False' AND ISNULL(ISPDCRow,'False') = 'False'  ";
			if (customerIDs != "")
			{
				str = str + " AND ARJ.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				str = str + " AND ARJ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromClass != "")
			{
				str = str + " AND ARJ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
			}
			if (fromGroup != "")
			{
				str = str + " AND ARJ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			if (fromSalesperson != "")
			{
				str = str + " AND Customer.SalesPersonID IN (SELECT SalesPersonID FROM Salesperson WHERE SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "') ";
			}
			if (fromCountry != "")
			{
				str = str + " AND Customer.CountryID IN (SELECT CountryID FROM Country WHERE CountryID BETWEEN '" + fromCountry + "' AND '" + toCountry + "') ";
			}
			if (!showZeroBalance)
			{
				str = str + " AND\r\n                             ISNULL((SELECT SUM(ISNULL(Debit" + text + ",0)- ISNULL(Credit" + text + ",0)) ";
			}
			if (!isFC)
			{
				str += " + ISNULL((SELECT SUM(ISNULL(RealizedGainLoss,0)) FROM AR_Payment_Allocation ARP WHERE ARP.CustomerID=ARJ.CustomerID),0) ";
			}
			str += " FROM ARJournal ARJ2 \r\n                             WHERE ARJ.CustomerID=ARJ2.CustomerID AND ISNULL(ISPDCRow,'False') = 'False' \r\n                             AND ISNULL(IsVoid,'False')='False'),0) <> 0 ";
			str += "ORDER BY ARJ.CustomerID ";
			FillDataSet(dataSet, "Case_Client", str);
			return dataSet;
		}

		public DataSet GetCustomerBalanceAmount(string customerCode)
		{
			DataSet dataSet = new DataSet();
			string textCommand = "SELECT CustomerID [Customer Code],CustomerName [Customer Name],ISNULL(Balance,0) + ISNULL(PDCAmount,0) \r\n                                + ISNULL((SELECT SUM(ISNULL(RealizedGainLoss,0)) FROM AR_Payment_Allocation ARP WHERE ARP.CustomerID=Customer.CustomerID),0)\r\n                                 AS [Balance Due],\r\n                                ISNULL(PDCAmount,0) AS [PDC Amount],ISNULL(Balance,0)+ ISNULL((SELECT SUM(ISNULL(RealizedGainLoss,0)) \r\n                                FROM AR_Payment_Allocation ARP WHERE ARP.CustomerID=Customer.CustomerID),0) AS [Net Balance] FROM Customer \r\n                                WHERE CustomerID='" + customerCode + "'";
			FillDataSet(dataSet, "Case_Client", textCommand);
			return dataSet;
		}

		public DataSet GetCustomerBalanceDetailFCReport(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string fromJob, string toJob, bool showZeroBalance, string currencyID, string customerIDs)
		{
			string text = CommonLib.ToSqlDateTimeString(from);
			string text2 = CommonLib.ToSqlDateTimeString(to);
			string str = "SELECT DISTINCT ARJ.CustomerID [Customer Code] ,CustomerName AS [Customer Name] ,\r\n                        ISNULL((SELECT SUM(ISNULL(DebitFC,0)- ISNULL(CreditFC,0))\r\n                            FROM ARJournal ARJ2 \r\n                         WHERE ARJ.CustomerID=ARJ2.CustomerID AND ARJ2.ARDate<'" + text + "'  AND CurrencyID = '" + currencyID + "' AND ISNULL(ISPDCRow,'False') = 'False'  AND ISNULL(IsVoid,'False')='False'),0)\r\n                        AS [Opening Balance],\r\n                        ISNULL((SELECT SUM(ISNULL(DebitFC,0)- ISNULL(CreditFC,0))\r\n                        FROM ARJournal ARJ2 \r\n                         WHERE ARJ.CustomerID=ARJ2.CustomerID AND ARJ2.ARDate<='" + text2 + "'  AND CurrencyID = '" + currencyID + "' AND ISNULL(ISPDCRow,'False') = 'False'  AND ISNULL(IsVoid,'False')='False'),0)\r\n                        AS [Ending Balance]\r\n                        FROM ARJournal ARJ INNER JOIN Customer ON ARJ.CustomerID=Customer.CustomerID WHERE ";
			str = str + " ARDate < '" + text2 + "' ";
			str += " AND ISNULL(IsVoid,'False')='False' AND ISNULL(ISPDCRow,'False') = 'False' ";
			str = str + " AND ARJ.CurrencyID='" + currencyID + "' ";
			if (customerIDs != "")
			{
				str = str + " AND ARJ.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				str = str + " AND ARJ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromClass != "")
			{
				str = str + " AND CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
			}
			if (fromGroup != "")
			{
				str = str + " AND CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			if (fromJob != "")
			{
				str = str + " AND ARJ.JobID Between '" + fromJob + "' AND '" + toJob + "'";
			}
			str += " ORDER BY ARJ.CustomerID";
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "Case_Client", str);
			DataSet dataSet2 = new DataSet();
			str = "SELECT CustomerID [Customer Code],SysDocType,'' AS [Doc Type], ARJ.SysDocID AS [Doc ID],VoucherID [Doc No],ARDate AS [Date],\r\n                            ChequeNumber AS [Chq#],ChequeDate AS [Chq Date],Description,Reference,CurrencyID,CurrencyRate,DebitFC AS Debit,CreditFC AS Credit\r\n                            FROM ARJournal ARJ LEFT OUTER JOIN System_Document SD ON ARJ.SysDocID=SD.SysDocID WHERE \r\n                            ARDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			str = str + "  AND CurrencyID = '" + currencyID + "' AND ISNULL(ISPDCRow,'False') = 'False'  AND ISNULL(IsVoid,'False')='False' ";
			if (customerIDs != "")
			{
				str = str + " AND CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				str = str + " AND CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromClass != "")
			{
				str = str + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
			}
			if (fromGroup != "")
			{
				str = str + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			if (fromJob != "")
			{
				str = str + " AND ARJ.JobID Between '" + fromJob + "' AND '" + toJob + "'";
			}
			str += " ORDER BY Date";
			FillDataSet(dataSet2, "ARJournal", str);
			dataSet.Merge(dataSet2);
			dataSet.Relations.Add("Balance Detail", dataSet.Tables["Case_Client"].Columns["Customer Code"], dataSet.Tables["ARJournal"].Columns["Customer Code"], createConstraints: false);
			return dataSet;
		}

		public DataSet GetCustomerBalanceDetailReport(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string fromJob, string toJob, bool showZeroBalance, string currencyID, string customerIDs)
		{
			string text = CommonLib.ToSqlDateTimeString(from);
			string text2 = CommonLib.ToSqlDateTimeString(to);
			string text3 = "";
			string text4 = "0";
			string text5 = "0";
			string text6 = "0";
			if (currencyID != "" && currencyID != new Currencies(base.DBConfig).GetBaseCurrencyID())
			{
				text3 = "FC";
				text4 = "ISNULL(ConDebitFC,0)";
				text5 = "ISNULL(ConCreditFC,0)";
				text6 = "ISNULL(ConAmountFC,0)";
			}
			string str = "SELECT DISTINCT Customer.CustomerID [Customer Code] ,CustomerName AS [Customer Name], AllowConsignment,\r\n                        ISNULL((SELECT SUM(ISNULL(Debit" + text3 + ",0) + " + text4 + " - " + text5 + " - ISNULL(Credit" + text3 + ",0))\r\n                         FROM ARJournal ARJ2 \r\n                         WHERE Customer.CustomerID=ARJ2.CustomerID AND ARJ2.ARDate<'" + text + "' AND ISNULL(ISPDCRow,'False') = 'False'  AND ISNULL(IsVoid,'False')='False'),0)\r\n                        AS [Opening Balance],\r\n                        ISNULL((SELECT SUM(ISNULL(Debit" + text3 + ",0) + " + text4 + " - " + text5 + " - ISNULL(Credit" + text3 + ",0))\r\n\r\n                        FROM ARJournal ARJ2 \r\n                         WHERE Customer.CustomerID=ARJ2.CustomerID AND ARJ2.ARDate<='" + text2 + "' AND ISNULL(ISPDCRow,'False') = 'False'  AND ISNULL(IsVoid,'False')='False'),0)\r\n                        AS [Ending Balance],\r\n                        (SELECT ISNULL(SUM(ISNULL(Amount" + text3 + ",0) + " + text6 + "),0) AS PDC FROM Cheque_Received ChqRec WHERE Status IN (1,3,4,8) AND ISNULL(IsVoid,'False')='False'  AND ChqRec.PayeeType = 'C' AND ChqRec.PayeeID = Customer.CustomerID) AS PDC\r\n                        FROM Customer LEFT OUTER JOIN ARJournal ARJ   ON ARJ.CustomerID=Customer.CustomerID WHERE ";
			str += "   ISNULL(IsVoid,'False')='False' ";
			if (customerIDs != "")
			{
				str = str + " AND Customer.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				str = str + " AND Customer.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromClass != "")
			{
				str = str + " AND CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "' ";
			}
			if (fromGroup != "")
			{
				str = str + " AND CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "' ";
			}
			if (fromJob != "")
			{
				str = str + " AND ARJ.JobID Between '" + fromJob + "' AND '" + toJob + "'";
			}
			str += " ORDER BY Customer.CustomerID ";
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "Case_Client", str);
			DataSet dataSet2 = new DataSet();
			str = "SELECT ARJ.CustomerID [Customer Code],SysDocType,'' AS [Doc Type],J.JobID,J.JobName, ARJ.SysDocID AS [Doc ID],ARJ.VoucherID [Doc No],ARDate AS [Date],ARDueDate [Due Date],\r\n                    ChequeNumber AS [Chq#],ChequeDate AS [Chq Date],SI.PONumber,ISNULL(Description,SI.Note)AS Description,ARJ.Reference,ARJ.CurrencyID,ARJ.CurrencyRate,DebitFC,CreditFC,\r\n                   ISNULL(Debit" + text3 + ",0) + " + text4 + " AS Debit, ISNULL(Credit" + text3 + ",0) + " + text5 + " AS Credit\r\n                    FROM ARJournal ARJ LEFT OUTER JOIN System_Document SD ON ARJ.SysDocID=SD.SysDocID \r\n                    LEFT OUTER JOIN Sales_Invoice SI ON SI.SysDocID=ARJ.SysDocID AND SI.VoucherID=ARJ.VoucherID\r\n                    LEFT JOIN Job J ON J.JobID=ARJ.JobID\r\n                    WHERE ARDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			str += " AND ISNULL(ISPDCRow,'False') = 'False' AND ISNULL(ARJ.IsVoid,'False')='False' ";
			if (customerIDs != "")
			{
				str = str + " AND ARJ.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				str = str + " AND  ARJ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromClass != "")
			{
				str = str + " AND  ARJ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
			}
			if (fromGroup != "")
			{
				str = str + " AND  ARJ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			if (fromJob != "")
			{
				str = str + " AND ARJ.JobID Between '" + fromJob + "' AND '" + toJob + "'";
			}
			if (text3 != "")
			{
				str += " AND ARJ.SysDocID <> 'SYS_VAL' ";
			}
			str += " ORDER BY CONVERT(Date, ARDate, 103), ARJ.VoucherID ";
			FillDataSet(dataSet2, "ARJournal", str);
			dataSet.Merge(dataSet2);
			dataSet.Relations.Add("Balance Detail", dataSet.Tables["Case_Client"].Columns["Customer Code"], dataSet.Tables["ARJournal"].Columns["Customer Code"], createConstraints: false);
			str = "SELECT SysDocID,VoucherID,CASE WHEN Status<>8 THEN ChequeNumber ELSE '(R)' + ChequeNumber END AS ChequeNumber,ChqRec.ReceiptDate,\r\n                        ChqRec.BankID,Bank.BankName,PayeeID,ChequeDate,ISNULL(AmountFC,Amount) AS Amount\r\n                        FROM Cheque_Received ChqRec\r\n                        LEFT OUTER JOIN Bank ON Bank.BankID=ChqRec.BankID\r\n                        WHERE Status IN (1,3,4,8) AND ISNULL(IsVoid,'False')='False'\r\n                        AND PayeeType='C' ";
			if (customerIDs != "")
			{
				str = str + " AND PayeeID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				str = str + " AND PayeeID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromClass != "")
			{
				str = str + " AND PayeeID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
			}
			if (fromGroup != "")
			{
				str = str + " AND PayeeID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			FillDataSet(dataSet, "Cheque_Received", str);
			dataSet.Relations.Add("PDCRel", dataSet.Tables["Case_Client"].Columns["Customer Code"], dataSet.Tables["Cheque_Received"].Columns["PayeeID"], createConstraints: false);
			str = "SELECT CON.SysDocID,CON.VoucherID AS Consign#,CON.CustomerID,TransactionDate AS [Consign Date] ,SUM((COD.Quantity  - ISNULL(QuantitySettled,0) - ISNULL(QuantityReturned,0)) * P.AverageCost) AS Value                    \r\n                        FROM Consign_Out Con\r\n                        INNER JOIN Consign_Out_Detail COD ON CON.SysDocID = COD.SysDocID AND CON.VoucherID = COD.VoucherID\r\n\t\t\t\t\t\tINNER JOIN Product P ON P.ProductID = COD.ProductID\r\n\t\t\t\t\t\tWHERE ISNULL(IsClosed,'False') = 'False' AND  ISNULL(IsVoid,'False') = 'False' ";
			if (customerIDs != "")
			{
				str = str + " AND CON.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				str = str + " AND CON.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromClass != "")
			{
				str = str + " AND CON.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
			}
			if (fromGroup != "")
			{
				str = str + " AND CON.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			str += " GROUP BY CON.SysDocID,CON.VoucherID,TransactionDate,CON.CustomerID ";
			FillDataSet(dataSet, "Consignment", str);
			dataSet.Relations.Add("ConsignRel", dataSet.Tables["Case_Client"].Columns["Customer Code"], dataSet.Tables["Consignment"].Columns["CustomerID"], createConstraints: false);
			return dataSet;
		}

		public DataSet GetCustomerOutstandingInvoicesReport(DateTime reportDate, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, bool showZeroBalance, bool isFC, string customerIDs)
		{
			try
			{
				string text = CommonLib.ToSqlDateTimeString(reportDate);
				string str = "\tSELECT DISTINCT ARJ.CustomerID   ,CustomerName   , Customer.CurrencyID, Customer.PaymentTermID,PT.TermName,SP.SalesPersonID,SP.FullName [SalesPerson],\r\n                     \r\n                            ( SELECT SUM(ISNULL(Debit,0)- ISNULL(Credit,0))\r\n\t                            FROM ARJournal ARJ3\r\n                             WHERE ARJ.CustomerID=ARJ3.CustomerID \r\n                             AND ISNULL(ISPDCRow,'False') = 'False'  AND ISNULL(IsVoid,'False')='False'  AND ARDate <= '" + text + "') AS EndingBalance,\r\n\r\n                              SUM(ISNULL(Credit,0)) - (SELECT ISNULL(SUM(ISNULL(Amount,0)),0) FROM Cheque_Received Chq\r\n                            WHERE ARJ.CustomerID  = Chq.PayeeID AND Status = 9)- (SELECT ISNULL(SUM(ISNULL(PaymentAmount,0)),0) FROM AR_Payment_Allocation ARP\r\n                                WHERE ARJ.CustomerID = ARP.CustomerID  AND AllocationDate <= '" + text + "')  AS Unallocated\r\n\r\n                        FROM ARJournal ARJ LEFT OUTER JOIN System_Document SD ON ARJ.SysDocID = SD.SysDocID INNER JOIN Customer ON ARJ.CustomerID=Customer.CustomerID \r\n                        LEFT OUTER JOIN Payment_Term PT ON Customer.PaymentTermID =PT.PaymentTermID \r\n                        LEFT OUTER JOIN Salesperson SP on Customer.SalesPersonID=SP.SalespersonID\r\n                        WHERE ISNULL(SD.SysDocType,1) NOT IN(7,12) AND  ISNULL(IsVoid,'False') = 'False' ";
				str = str + " AND ARDate < '" + text + "' ";
				if (customerIDs != "")
				{
					str = str + " AND ARJ.CustomerID IN(" + customerIDs + ")";
				}
				if (fromCustomer != "")
				{
					str = str + " AND ARJ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
				}
				if (fromClass != "")
				{
					str = str + " AND CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "' ";
				}
				if (fromGroup != "")
				{
					str = str + " AND CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "' ";
				}
				str += " GROUP BY ARJ.CustomerID,CustomerName,Customer.CurrencyID,Customer.PaymentTermID,PT.TermName,SP.SalesPersonID,SP.FullName";
				if (!showZeroBalance)
				{
					str = str + " HAVING ( SELECT SUM(ISNULL(Debit,0)- ISNULL(Credit,0))\r\n\t                            FROM ARJournal ARJ3\r\n                             WHERE ARJ.CustomerID=ARJ3.CustomerID \r\n                             AND ISNULL(IsVoid,'False')='False' AND ISNULL(ISPDCRow,'False') = 'False'  AND ARDate <= '" + text + "') > 0 OR \r\n                                SUM(ISNULL(Credit,0)) - (SELECT ISNULL(SUM(ISNULL(PaymentAmount,0)),0) FROM AR_Payment_Allocation ARP\r\n                                WHERE ARJ.CustomerID = ARP.CustomerID  AND AllocationDate <= '" + text + "' )>0 ";
				}
				str += " ORDER BY ARJ.CustomerID";
				DataSet dataSet = new DataSet();
				FillDataSet(dataSet, "Case_Client", str);
				str = "\tSELECT ARID JournalID,ARJ.SysDocID,VoucherID,CustomerID,Description,ARJ.Reference,ARDate,ISNULL(ISNULL(DebitFC,Debit),0) AS OriginalAmount,\r\n                            (SELECT Top 1 JobName FROM Journal_Details JD LEFT JOIN Job J ON J.JobID=JD.JobID\r\n                            WHERE JD.SysDocID=ARJ.SysDocID AND JD.VoucherID=ARJ.VoucherID AND ISNULL(JD.IsARAP,'False')='True') AS JOB,\r\n                                   ISNULL(ARJ.CurrencyID,(SELECT CurrencyID FROM Currency WHERE IsBase='True')) AS CurrencyID, \r\n                                  ISNULL(ARJ.CurrencyRate,1) AS CurrencyRate,  \r\n                                  ISNULL(ISNULL(ISNULL(DebitFC,Debit),0) -   \r\n                                (SELECT CASE WHEN ARJ.CurrencyID IS NULL  OR ARJ.CurrencyID=(SELECT CurrencyID FROM Currency WHERE IsBase='True') THEN SUM(ISNULL(PaymentAmount,0)+ISNULL(DiscountAmount,0)) ELSE SUM(ISNULL(PaymentAmountFC,0)+ISNULL(DiscountAmountFC,0)) END FROM AR_Payment_Allocation ARP\r\n                                WHERE ARJ.ARID = ARP.ARJournalID  AND AllocationDate <= '" + text + "'),ISNULL(ISNULL(DebitFC,Debit),0))  AS AmountDue,\r\n\t\t\t\t\t\t\t\tDATEDIFF(Day,ISNULL(ARDueDate, ARDate),'" + text + "') AS OverdueDays\r\n                                  FROM ARJournal ARJ     LEFT OUTER JOIN System_Document SD ON SD.SysDocID = ARJ.SysDocID\r\n                                WHERE ISNULL(Debit,0)>0 AND ISNULL(IsVoid,'False')='False'  AND ISNULL(SD.SysDocType,1) <> 12   AND ISNULL(ISPDCRow,'False') = 'False' \r\n                              \r\n                                AND \r\n                                (SELECT CASE WHEN (ARJ.CurrencyID IS NULL OR ARJ.CurrencyID =(SELECT CurrencyID FROM Currency WHERE IsBase='True')) THEN \r\n\t\t\t\t\t\t\t\t\t\tISNULL(SUM(ISNULL(PaymentAmount,0)+ISNULL(DiscountAmount,0)),0) ELSE  \r\n\t\t\t\t\t\t\t\t\t\tISNULL(SUM(ISNULL(PaymentAmountFC,0)+ISNULL(DiscountAmountFC,0)),0) END FROM AR_Payment_Allocation PA\r\n\t                                WHERE ARJ.ARID = PA.ARJournalID  AND AllocationDate <= '" + text + "')<\r\n\t                                CASE WHEN (ARJ.CurrencyID IS NULL OR ARJ.CurrencyID = (SELECT CurrencyID FROM Currency WHERE IsBase='True') )\r\n\t                                THEN ISNULL(ISNULL(Debit,0),0) ELSE ISNULL(ISNULL(DebitFC,0),0) END  ";
				str = str + " AND ARDate < '" + text + "' ";
				if (customerIDs != "")
				{
					str = str + " AND ARJ.CustomerID IN(" + customerIDs + ")";
				}
				if (fromCustomer != "")
				{
					str = str + " AND ARJ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
				}
				if (fromClass != "")
				{
					str = str + " AND ARJ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					str = str + " AND ARJ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				str += " ORDER BY  ARDate ";
				FillDataSet(dataSet, "Invoices", str);
				dataSet.Relations.Add("OutstandingInvoices", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["Invoices"].Columns["CustomerID"], createConstraints: false);
				return dataSet;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetCustomerOutstandingInvoicesList(string fromCustomer, bool showZeroBalance, bool isFC)
		{
			try
			{
				DataSet dataSet = new DataSet();
				string str = "\tSELECT DISTINCT ARJ.CustomerID   ,CustomerName   , Customer.CurrencyID, Customer.PaymentTermID,PT.TermName,\r\n                     \r\n                            ( SELECT SUM(ISNULL(Debit,0)- ISNULL(Credit,0))\r\n\t                            FROM ARJournal ARJ3\r\n                             WHERE ARJ.CustomerID=ARJ3.CustomerID \r\n                             AND ISNULL(ISPDCRow,'False') = 'False'  AND ISNULL(IsVoid,'False')='False'  AND ARDate <= GetDate()) AS EndingBalance,\r\n\r\n                              SUM(ISNULL(Credit,0)) - (SELECT ISNULL(SUM(ISNULL(Amount,0)),0) FROM Cheque_Received Chq\r\n                            WHERE ARJ.CustomerID  = Chq.PayeeID AND Status = 9)- (SELECT ISNULL(SUM(ISNULL(PaymentAmount,0)),0) FROM AR_Payment_Allocation ARP\r\n                                WHERE ARJ.CustomerID = ARP.CustomerID  AND AllocationDate <= Getdate())  AS Unallocated\r\n\r\n                        FROM ARJournal ARJ LEFT OUTER JOIN System_Document SD ON ARJ.SysDocID = SD.SysDocID INNER JOIN Customer ON ARJ.CustomerID=Customer.CustomerID \r\n                        LEFT OUTER JOIN Payment_Term PT ON Customer.PaymentTermID =PT.PaymentTermID \r\n                        WHERE ISNULL(SD.SysDocType,1) NOT IN(7,12) AND  ISNULL(IsVoid,'False') = 'False' AND ARJ.CustomerID = '" + fromCustomer + "' ";
				str += " GROUP BY ARJ.CustomerID,CustomerName,Customer.CurrencyID,Customer.PaymentTermID,PT.TermName";
				if (!showZeroBalance)
				{
					str += " HAVING ( SELECT SUM(ISNULL(Debit,0)- ISNULL(Credit,0))\r\n\t                            FROM ARJournal ARJ3\r\n                             WHERE ARJ.CustomerID=ARJ3.CustomerID \r\n                             AND ISNULL(IsVoid,'False')='False' AND ISNULL(ISPDCRow,'False') = 'False'  AND ARDate <= GetDate()) > 0 OR \r\n                                SUM(ISNULL(Credit,0)) - (SELECT ISNULL(SUM(ISNULL(PaymentAmount,0)),0) FROM AR_Payment_Allocation ARP\r\n                                WHERE ARJ.CustomerID = ARP.CustomerID  AND AllocationDate <= GetDate() )>0 ";
				}
				str += " ORDER BY ARJ.CustomerID";
				str = "SELECT ARID JournalID,ARJ.SysDocID,VoucherID,CustomerID,Description,ARJ.Reference,ARDate,ARDueDate as [Due Date],ISNULL(ISNULL(DebitFC, Debit), 0) AS OriginalAmount,\r\n\r\n                          (SELECT Top 1 JobName FROM Journal_Details JD LEFT JOIN Job J ON J.JobID = JD.JobID\r\n\r\n                          WHERE JD.SysDocID = ARJ.SysDocID AND JD.VoucherID = ARJ.VoucherID AND ISNULL(JD.IsARAP, 'False') = 'True') AS JOB,\r\n                                        ISNULL(ARJ.CurrencyID, (SELECT CurrencyID FROM Currency WHERE IsBase = 'True')) AS CurrencyID,\r\n                                          ISNULL(ARJ.CurrencyRate, 1) AS CurrencyRate,\r\n                                           ISNULL(ISNULL(ISNULL(DebitFC, Debit), 0) -\r\n                                         (SELECT CASE WHEN ARJ.CurrencyID IS NULL  OR ARJ.CurrencyID = (SELECT CurrencyID FROM Currency WHERE IsBase = 'True') THEN SUM(ISNULL(PaymentAmount, 0) + ISNULL(DiscountAmount, 0)) ELSE SUM(ISNULL(PaymentAmountFC, 0) + ISNULL(DiscountAmountFC, 0)) END FROM AR_Payment_Allocation ARP\r\n             \r\n                                             WHERE ARJ.ARID = ARP.ARJournalID  AND AllocationDate <= GetDate()),ISNULL(ISNULL(DebitFC, Debit), 0))  AS AmountDue,\r\n                                               DATEDIFF(Day, ISNULL(ARDueDate, ARDate), GetDate()) AS OverdueDays\r\n                                  FROM ARJournal ARJ LEFT OUTER JOIN System_Document SD ON SD.SysDocID = ARJ.SysDocID\r\n                                WHERE ISNULL(Debit,0)> 0 AND ISNULL(IsVoid,'False')= 'False'  AND ISNULL(SD.SysDocType, 1) <> 12   AND ISNULL(ISPDCRow,'False') = 'False'\r\n\r\n\r\n                                AND\r\n                                (SELECT CASE WHEN(ARJ.CurrencyID IS NULL OR ARJ.CurrencyID = (SELECT CurrencyID FROM Currency WHERE IsBase = 'True')) THEN\r\n\r\n                                        ISNULL(SUM(ISNULL(PaymentAmount, 0) + ISNULL(DiscountAmount, 0)), 0) ELSE\r\n\r\n                                        ISNULL(SUM(ISNULL(PaymentAmountFC, 0) + ISNULL(DiscountAmountFC, 0)), 0) END FROM AR_Payment_Allocation PA\r\n\r\n                                    WHERE ARJ.ARID = PA.ARJournalID  AND AllocationDate <= GetDate())<\r\n                                    CASE WHEN(ARJ.CurrencyID IS NULL OR ARJ.CurrencyID = (SELECT CurrencyID FROM Currency WHERE IsBase = 'True') )\r\n\t                                THEN ISNULL(ISNULL(Debit, 0), 0) ELSE ISNULL(ISNULL(DebitFC, 0), 0) END AND ARDate < GetDate()  AND ARJ.CustomerID = '" + fromCustomer + "' ORDER BY  ARDate";
				FillDataSet(dataSet, "OutStandingInvoice", str);
				return dataSet;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetSalesByCustomerDetailReport(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string customerIDs)
		{
			string text = CommonLib.ToSqlDateTimeString(from);
			string text2 = CommonLib.ToSqlDateTimeString(to);
			string text3 = "SELECT DISTINCT Ax_Sale.CustomerID,Cus.CustomerName FROM Axo_Sales_Detail Ax_Sale\r\n                                INNER JOIN Customer CUS ON Cus.CustomerID = Ax_Sale.CustomerID ";
			text3 = text3 + " WHERE Date BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (customerIDs != "")
			{
				text3 = text3 + " AND Ax_Sale.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND Ax_Sale.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromClass != "")
			{
				text3 = text3 + " AND Ax_Sale.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
			}
			if (fromGroup != "")
			{
				text3 = text3 + " AND Ax_Sale.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			text3 += " GROUP BY Ax_Sale.CustomerID,Cus.CustomerName ORDER BY CustomerID";
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "Case_Client", text3);
			DataSet dataSet2 = new DataSet();
			text3 = "SELECT Type,SD.DocName,Ax_Sale.Date AS TransactionDate,Ax_Sale.CustomerID,Cus.CustomerName,Ax_Sale.[Doc ID],Ax_Sale.[Doc Number] AS VoucherID,Ax_Sale.CurrencyID,Ax_Sale.CurrencyRate,SUM(Amount) AS Total,SUM(AmountFC) AS TotalFC,SUM(COGS) AS COGS, SUM(Profit) AS Profit,\r\n                                ROUND(CASE WHEN SUM(Amount)<> 0 THEN SUM(Profit)/SUM(Amount) ELSE 0 END * 100,2) AS Margin FROM Axo_Sales_Detail Ax_Sale\r\n                                INNER JOIN Customer CUS ON Cus.CustomerID = Ax_Sale.CustomerID INNER JOIN System_Document SD ON SD.SysDocID=Ax_Sale.[Doc ID]";
			text3 = text3 + " WHERE Date BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (customerIDs != "")
			{
				text3 = text3 + " AND Ax_Sale.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND Ax_Sale.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromClass != "")
			{
				text3 = text3 + " AND Ax_Sale.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
			}
			if (fromGroup != "")
			{
				text3 = text3 + " AND Ax_Sale.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			text3 += " GROUP BY Type,SD.DocName,Ax_Sale.Date,Ax_Sale.CustomerID,Cus.CustomerName,Ax_Sale.[Doc ID],Ax_Sale.[Doc Number],Ax_Sale.CurrencyID,Ax_Sale.CurrencyRate ORDER BY CustomerID";
			FillDataSet(dataSet2, "Sales", text3);
			dataSet.Merge(dataSet2);
			dataSet.Relations.Add("Sales Detail", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["Sales"].Columns["CustomerID"], createConstraints: false);
			return dataSet;
		}

		public DataSet GetSalesByCustomerSummaryReport(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string customerIDs)
		{
			try
			{
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				DataSet dataSet = new DataSet();
				string text3 = "SELECT Ax_Sale.CustomerID,Cus.CustomerName,SUM(Amount) AS SalesAmount,SUM(COGS) AS COGS, SUM(Profit) AS Profit, ROUND(CASE WHEN SUM(Amount)<> 0 THEN SUM(Profit)/SUM(Amount) ELSE 0 END * 100,2) AS Margin FROM Axo_Sales_Detail Ax_Sale\r\n                                INNER JOIN Customer CUS ON Cus.CustomerID = Ax_Sale.CustomerID\r\n                                \r\n\r\n                                 WHERE [Date] BETWEEN '" + text + "' AND '" + text2 + "' ";
				if (customerIDs != "")
				{
					text3 = text3 + " AND Ax_Sale.CustomerID IN(" + customerIDs + ")";
				}
				if (fromCustomer != "")
				{
					text3 = text3 + " AND Ax_Sale.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
				}
				if (fromClass != "")
				{
					text3 = text3 + " AND Ax_Sale.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					text3 = text3 + " AND Ax_Sale.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				text3 += "    GROUP BY Ax_Sale.CustomerID,Cus.CustomerName";
				FillDataSet(dataSet, "Sales", text3);
				dataSet.Tables[0].PrimaryKey = new DataColumn[1]
				{
					dataSet.Tables[0].Columns["CustomerID"]
				};
				return dataSet;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetSalesEnquiryDetailReport(DateTime fromDate, DateTime toDate, string fromItem, string toItem, string fromItemClass, string toItemClass, string fromItemCategory, string toItemCategory, string fromCustomer, string toCustomer, string fromCustomerClass, string toCustomerClass, string fromCustomerGroup, string toCustomerGroup, string fromSalesperson, string toSalesperson, string fromLocation, string toLocation, string customerIDs)
		{
			string text = CommonLib.ToSqlDateTimeString(fromDate);
			string text2 = CommonLib.ToSqlDateTimeString(toDate);
			string text3 = "SELECT DISTINCT SE.CustomerID,Cus.CustomerName FROM Sales_Enquiry SE\r\n                                INNER JOIN Customer CUS ON Cus.CustomerID = SE.CustomerID ";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (customerIDs != "")
			{
				text3 = text3 + " AND SE.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND SE.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND SE.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND SE.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			text3 += " GROUP BY SE.CustomerID,Cus.CustomerName ORDER BY CustomerID";
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "Case_Client", text3);
			DataSet dataSet2 = new DataSet();
			text3 = "Select SED.ProductID,\r\n\t\t\t\t\t\tTransactionDate,SED.VoucherID,SE.CustomerID + '-' + CustomerName AS 'Customer',SE.CustomerID,SED.Description,\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\tSED.Quantity,UnitPrice, (SED.Quantity * UnitPrice) AS Amount\r\n\r\n                        FROM Sales_Enquiry_Detail SED INNER JOIN Sales_Enquiry SE ON\r\n\r\n                        SED.SysDocID = SE.SysDocID AND SED.VoucherID = SE.VoucherID\r\n\r\n                        INNER JOIN Product PR ON SED.ProductID = PR.ProductID INNER JOIN\r\n\r\n                        Customer ON Customer.CustomerID = SE.CustomerID";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (fromItem != "")
			{
				text3 = text3 + " AND SED.ProductID BETWEEN '" + fromItem + "' AND '" + toItem + "' ";
			}
			if (fromItemClass != "")
			{
				text3 = text3 + " AND SED.ProductID IN (SELECT ProductID FROM Product WHERE ClassID BETWEEN '" + fromItemClass + "' AND '" + toItemClass + "') ";
			}
			if (fromItemCategory != "")
			{
				text3 = text3 + " AND SED.ProductID IN (SELECT ProductID FROM Product WHERE CategoryID BETWEEN '" + fromItemCategory + "' AND '" + toItemCategory + "') ";
			}
			if (customerIDs != "")
			{
				text3 = text3 + " AND SE.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND SE.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND SE.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND SE.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			if (fromSalesperson != "")
			{
				text3 = text3 + " AND SE.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
			}
			if (fromLocation != "")
			{
				text3 = text3 + " AND SED.LocationID BETWEEN '" + fromLocation + "' AND '" + toLocation + "' ";
			}
			text3 += " GROUP BY SE.TransactionDate,SE.CustomerID,Customer.CustomerName,SED.ProductID,TransactionDate,SED.VoucherID,SED.Quantity,UnitPrice, SED.Description ORDER BY SE.CustomerID";
			FillDataSet(dataSet2, "SalesEnquiry", text3);
			dataSet.Merge(dataSet2);
			dataSet.Relations.Add("SalesEnquiryREL", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["SalesEnquiry"].Columns["CustomerID"], createConstraints: false);
			return dataSet;
		}

		public DataSet GetSalesEnquirySummaryReport(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string fromSalesperson, string toSalesperson, string customerIDs)
		{
			try
			{
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				DataSet dataSet = new DataSet();
				string text3 = "SELECT SE.CustomerID,Cus.CustomerName,SE.*, JobName, TermName FROM Sales_Enquiry SE\r\n                                INNER JOIN Customer CUS \r\n\t\t\t\t\t\t\t\tON Cus.CustomerID = SE.CustomerID\r\n\t\t\t\t\t\t\t\tLEFT JOIN Job J ON SE.JobID=J.JobID\r\n\t\t\t\t\t\t\t\tLEFT JOIN Payment_Term PT On SE.TermID=PT.PaymentTermID\r\n                                 WHERE [TransactionDate] BETWEEN '" + text + "' AND '" + text2 + "' ";
				if (customerIDs != "")
				{
					text3 = text3 + " AND SE.CustomerID IN(" + customerIDs + ")";
				}
				if (fromCustomer != "")
				{
					text3 = text3 + " AND SE.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
				}
				if (fromClass != "")
				{
					text3 = text3 + " AND SE.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					text3 = text3 + " AND SE.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				if (fromSalesperson != "")
				{
					text3 = text3 + " AND SE.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
				}
				text3 += "  GROUP BY SE.CustomerID,Cus.CustomerName, SE.SysDocID, SE.VoucherID, SE.TransactionDate, SE.IsExport, SE.DueDate, SE.SalesFlow, SE.SalespersonID, SE.RequiredDate, SE. ShippingAddressID, SE.ShippingMethodID, SE.BillingAddressID, SE.CustomerAddress, SE.ShipToAddress, SE.Status, SE.CurrencyID, SE.TermID, SE.JobID, SE.CostCategoryID, SE.IsVoid, SE.Reference, SE.Discount, SE.TaxAmount, SE.Total, SE.PONumber, SE.Note, SE.ApprovalStatus, Se.VerificationStatus, SE.DateCreated, SE.DateUpdated, SE. CreatedBy, SE.UpdatedBy,JobName, TermName";
				FillDataSet(dataSet, "SalesEnquiry", text3);
				dataSet.Tables[0].PrimaryKey = new DataColumn[1]
				{
					dataSet.Tables[0].Columns["CustomerID"]
				};
				return dataSet;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetSalesQuoteDetailReport(DateTime fromDate, DateTime toDate, string fromItem, string toItem, string fromItemClass, string toItemClass, string fromItemCategory, string toItemCategory, string fromCustomer, string toCustomer, string fromCustomerClass, string toCustomerClass, string fromCustomerGroup, string toCustomerGroup, string fromSalesperson, string toSalesperson, string fromLocation, string toLocation, string customerIDs)
		{
			string text = CommonLib.ToSqlDateTimeString(fromDate);
			string text2 = CommonLib.ToSqlDateTimeString(toDate);
			string text3 = "SELECT DISTINCT SQ.CustomerID,Cus.CustomerName FROM Sales_Quote SQ\r\n                                INNER JOIN Customer CUS ON Cus.CustomerID = SQ.CustomerID \r\n\t\t\t\t\t\t\t\t";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (customerIDs != "")
			{
				text3 = text3 + " AND SQ.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND SQ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND SQ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND SQ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			text3 += " GROUP BY SQ.CustomerID,Cus.CustomerName ORDER BY CustomerID";
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "Case_Client", text3);
			DataSet dataSet2 = new DataSet();
			text3 = "Select SQD.ProductID,\r\n\t\t\t\t\t\tTransactionDate,SQD.VoucherID,SQ.CustomerID + '-' + CustomerName AS 'Customer',SQ.CustomerID,SQD.Description,SQ.CostCategoryID, SQ.CurrencyID, SQ.Discount, SQ.JobID, SQ.Note, SQ.PONumber, JobName,\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\tSQD.Quantity,UnitPrice, (SQD.Quantity * UnitPrice) AS Amount\r\n\r\n                        FROM Sales_Quote_Detail SQD INNER JOIN Sales_Quote SQ ON\r\n\r\n                        SQD.SysDocID = SQ.SysDocID AND SQD.VoucherID = SQ.VoucherID\r\n                        LEFT JOIN Job J On SQ.JobID=J.JobID\r\n\r\n                        INNER JOIN Product PR ON SQD.ProductID = PR.ProductID INNER JOIN\r\n\r\n                        Customer ON Customer.CustomerID = SQ.CustomerID";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (fromItem != "")
			{
				text3 = text3 + " AND SQD.ProductID BETWEEN '" + fromItem + "' AND '" + toItem + "' ";
			}
			if (fromItemClass != "")
			{
				text3 = text3 + " AND SQD.ProductID IN (SELECT ProductID FROM Product WHERE ClassID BETWEEN '" + fromItemClass + "' AND '" + toItemClass + "') ";
			}
			if (fromItemCategory != "")
			{
				text3 = text3 + " AND SQD.ProductID IN (SELECT ProductID FROM Product WHERE CategoryID BETWEEN '" + fromItemCategory + "' AND '" + toItemCategory + "') ";
			}
			if (customerIDs != "")
			{
				text3 = text3 + " AND SQ.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND SQ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND SQ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND SQ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			if (fromSalesperson != "")
			{
				text3 = text3 + " AND SQ.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
			}
			if (fromLocation != "")
			{
				text3 = text3 + " AND SQD.LocationID BETWEEN '" + fromLocation + "' AND '" + toLocation + "' ";
			}
			text3 += " GROUP BY SQ.TransactionDate,SQ.CustomerID,Customer.CustomerName,SQD.ProductID,TransactionDate,SQD.VoucherID,SQD.Quantity,UnitPrice, SQD.Description,SQ.CostCategoryID, SQ.CurrencyID, SQ.Discount, SQ.JobID, SQ.Note, SQ.PONumber, JobName ORDER BY SQ.CustomerID";
			FillDataSet(dataSet2, "SalesQuote", text3);
			dataSet.Merge(dataSet2);
			dataSet.Relations.Add("SalesQuoteREL", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["SalesQuote"].Columns["CustomerID"], createConstraints: false);
			return dataSet;
		}

		public DataSet GetSalesQuoteSummaryReport(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string fromSalesperson, string toSalesperson, string customerIDs)
		{
			try
			{
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				DataSet dataSet = new DataSet();
				string text3 = "SELECT SQ.CustomerID,Cus.CustomerName,SQ.*, JobName, TermName FROM Sales_Quote SQ\r\n                                INNER JOIN Customer CUS \r\n\t\t\t\t\t\t\t\tON Cus.CustomerID = SQ.CustomerID\r\n\t\t\t\t\t\t\t\tLEFT JOIN Job J ON SQ.JobID=J.JobID\r\n\t\t\t\t\t\t\t\tLEFT JOIN Payment_Term PT On SQ.TermID=PT.PaymentTermID\r\n                                 WHERE [TransactionDate] BETWEEN '" + text + "' AND '" + text2 + "' ";
				if (customerIDs != "")
				{
					text3 = text3 + " AND SQ.CustomerID IN(" + customerIDs + ")";
				}
				if (fromCustomer != "")
				{
					text3 = text3 + " AND SQ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
				}
				if (fromClass != "")
				{
					text3 = text3 + " AND SQ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					text3 = text3 + " AND SQ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				text3 += "Group By SQ.CustomerID,Cus.CustomerName, SQ.SysDocID, SQ.VoucherID, SQ.TransactionDate,SQ.SalesFlow, SQ.SalespersonID, SQ.RequiredDate, SQ.ShippingAddressID, SQ.ShippingMethodID,SQ.BillingAddressID, SQ.CustomerAddress, SQ.ShipToAddress, SQ.Status, SQ.CurrencyID, SQ.TermID, SQ.JobID, SQ.CostCategoryID, SQ.IsVoid, SQ.Reference, SQ.Discount,SQ.TaxAmount, SQ.Total, SQ.PONumber, SQ.Note, SQ.ApprovalStatus,SQ.EntityType,SQ.ExpiryDate,SQ.CurrencyID,SQ.LastRevisedDate,SQ.DateCreated, SQ.DateUpdated, SQ.CreatedBy, SQ.UpdatedBy,JobName, TermName";
				if (fromSalesperson != "")
				{
					text3 = text3 + " AND SQ.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
				}
				FillDataSet(dataSet, "SalesQuote", text3);
				return dataSet;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetSalesOrderDetailReport(DateTime fromDate, DateTime toDate, string fromItem, string toItem, string fromItemClass, string toItemClass, string fromItemCategory, string toItemCategory, string fromCustomer, string toCustomer, string fromCustomerClass, string toCustomerClass, string fromCustomerGroup, string toCustomerGroup, string fromSalesperson, string toSalesperson, string fromLocation, string toLocation, bool isExport, string customerIDs)
		{
			string text = CommonLib.ToSqlDateTimeString(fromDate);
			string text2 = CommonLib.ToSqlDateTimeString(toDate);
			string text3 = "SELECT DISTINCT SO.CustomerID,Cus.CustomerName FROM Sales_Order SO\r\n                                INNER JOIN Customer CUS ON Cus.CustomerID = SO.CustomerID \r\n\t\t\t\t\t\t\t\t";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (customerIDs != "")
			{
				text3 = text3 + " AND SO.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND SO.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND SO.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND SO.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "Case_Client", text3);
			DataSet dataSet2 = new DataSet();
			text3 = "Select SOD.ProductID,\r\n\t\t\t\t\t\tTransactionDate,SOD.VoucherID,SO.CustomerID + '-' + CustomerName AS 'Customer',SO.CustomerID,SOD.Description,SO.CostCategoryID, SO.CurrencyID, SO.Discount, SO.JobID, SO.Note, SO.PONumber, JobName,\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\tSOD.Quantity,UnitPrice, (SOD.Quantity * UnitPrice) AS Amount\r\n\r\n                        FROM Sales_Order_Detail SOD INNER JOIN Sales_Order SO ON\r\n\r\n                        SOD.SysDocID = SO.SysDocID AND SOD.VoucherID = SO.VoucherID\r\n\r\n                        LEFT JOIN Job J On SO.JobID=J.JobID\r\n\r\n                        INNER JOIN Product PR ON SOD.ProductID = PR.ProductID INNER JOIN\r\n\r\n                        Customer ON Customer.CustomerID = SO.CustomerID";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (fromItem != "")
			{
				text3 = text3 + " AND SOD.ProductID BETWEEN '" + fromItem + "' AND '" + toItem + "' ";
			}
			if (fromItemClass != "")
			{
				text3 = text3 + " AND SOD.ProductID IN (SELECT ProductID FROM Product WHERE ClassID BETWEEN '" + fromItemClass + "' AND '" + toItemClass + "') ";
			}
			if (fromItemCategory != "")
			{
				text3 = text3 + " AND SOD.ProductID IN (SELECT ProductID FROM Product WHERE CategoryID BETWEEN '" + fromItemCategory + "' AND '" + toItemCategory + "') ";
			}
			if (customerIDs != "")
			{
				text3 = text3 + " AND SO.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND SO.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND SO.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND SO.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			if (fromSalesperson != "")
			{
				text3 = text3 + " AND SO.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
			}
			if (fromLocation != "")
			{
				text3 = text3 + " AND SOD.LocationID BETWEEN '" + fromLocation + "' AND '" + toLocation + "' ";
			}
			text3 = text3 + " AND ISNULL(IsExport,'False')= '" + isExport.ToString() + "' ";
			text3 += " GROUP BY SO.TransactionDate,SO.CustomerID,Customer.CustomerName,SOD.ProductID,TransactionDate,SOD.VoucherID,SOD.Quantity,UnitPrice, SOD.Description,SO.CostCategoryID, SO.CurrencyID, SO.Discount, SO.JobID, SO.Note, SO.PONumber, JobName ORDER BY SO.CustomerID";
			FillDataSet(dataSet2, "SalesOrder", text3);
			dataSet.Merge(dataSet2);
			dataSet.Relations.Add("SalesOrderREL", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["SalesOrder"].Columns["CustomerID"], createConstraints: false);
			return dataSet;
		}

		public DataSet GetSalesOrderSummaryReport(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string fromSalesperson, string toSalesperson, bool isExport, string customerIDs)
		{
			try
			{
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				DataSet dataSet = new DataSet();
				string text3 = "SELECT SO.CustomerID,Cus.CustomerName,SO.*, JobName, TermName FROM Sales_Order SO\r\n                                INNER JOIN Customer CUS \r\n\t\t\t\t\t\t\t\tON Cus.CustomerID = SO.CustomerID\r\n\t\t\t\t\t\t\t\tLEFT JOIN Job J ON SO.JobID=J.JobID\r\n\t\t\t\t\t\t\t\tLEFT JOIN Payment_Term PT On SO.TermID=PT.PaymentTermID\r\n                                 WHERE [TransactionDate] BETWEEN '" + text + "' AND '" + text2 + "' ";
				if (customerIDs != "")
				{
					text3 = text3 + " AND SO.CustomerID IN(" + customerIDs + ")";
				}
				if (fromCustomer != "")
				{
					text3 = text3 + " AND SO.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
				}
				if (fromClass != "")
				{
					text3 = text3 + " AND SO.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					text3 = text3 + " AND SO.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				if (fromSalesperson != "")
				{
					text3 = text3 + " AND SO.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
				}
				text3 = text3 + " AND ISNULL(IsExport,'False')= '" + isExport.ToString() + "' ";
				text3 += "Group By SO.CustomerID,Cus.CustomerName, SO.SysDocID, SO.VoucherID, SO.TransactionDate,SO.SalesFlow, SO.SalespersonID, SO.RequiredDate, SO.ShippingAddressID, SO.ShippingMethodID,SO.BillingAddressID, SO.CustomerAddress, SO.ShipToAddress, SO.Status, SO.CurrencyID, SO.TermID, SO.JobID, SO.CostCategoryID, SO.IsVoid, SO.Reference, SO.Discount,SO.TaxAmount, SO.Total, SO.PONumber, SO.Note, SO.ApprovalStatus,SO.CurrencyID,SO.DateCreated,SO.IsExport,So.DueDate,SO.SourceDocType,SO.VerificationStatus, SO.DateUpdated, SO.CreatedBy, SO.UpdatedBy,JobName, TermName";
				FillDataSet(dataSet, "SalesOrder", text3);
				return dataSet;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetProformaInvoiceDetailReport(DateTime fromDate, DateTime toDate, string fromItem, string toItem, string fromItemClass, string toItemClass, string fromItemCategory, string toItemCategory, string fromCustomer, string toCustomer, string fromCustomerClass, string toCustomerClass, string fromCustomerGroup, string toCustomerGroup, string fromSalesperson, string toSalesperson, string fromLocation, string toLocation)
		{
			string text = CommonLib.ToSqlDateTimeString(fromDate);
			string text2 = CommonLib.ToSqlDateTimeString(toDate);
			string text3 = "SELECT DISTINCT PI.CustomerID,Cus.CustomerName FROM SalesProforma_Invoice PI\r\n                                INNER JOIN Customer CUS ON Cus.CustomerID = PI.CustomerID \r\n\t\t\t\t\t\t\t\t";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (fromCustomer != "")
			{
				text3 = text3 + " AND PI.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND PI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND PI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			text3 += " GROUP BY PI.CustomerID,Cus.CustomerName ORDER BY CustomerID";
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "Case_Client", text3);
			DataSet dataSet2 = new DataSet();
			text3 = "Select PID.ProductID,\r\n\t\t\t\t\t\tTransactionDate,PID.VoucherID,PI.CustomerID + '-' + CustomerName AS 'Customer',PI.CustomerID,PID.Description,PI.CostCategoryID, PI.CurrencyID, PI.Discount, PI.JobID, PI.Note, PI.PONumber, JobName,\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\tPID.Quantity,UnitPrice, (PID.Quantity * UnitPrice) AS Amount\r\n\r\n                        FROM SalesProforma_Invoice_Detail PID INNER JOIN SalesProforma_Invoice PI ON\r\n\r\n                        PID.SysDocID = PI.SysDocID AND PID.VoucherID = PI.VoucherID\r\n                        LEFT JOIN Job J On PI.JobID=J.JobID\r\n\r\n                        INNER JOIN Product PR ON PID.ProductID = PR.ProductID INNER JOIN\r\n\r\n                        Customer ON Customer.CustomerID = PI.CustomerID";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (fromItem != "")
			{
				text3 = text3 + " AND PID.ProductID BETWEEN '" + fromItem + "' AND '" + toItem + "' ";
			}
			if (fromItemClass != "")
			{
				text3 = text3 + " AND PID.ProductID IN (SELECT ProductID FROM Product WHERE ClassID BETWEEN '" + fromItemClass + "' AND '" + toItemClass + "') ";
			}
			if (fromItemCategory != "")
			{
				text3 = text3 + " AND PID.ProductID IN (SELECT ProductID FROM Product WHERE CategoryID BETWEEN '" + fromItemCategory + "' AND '" + toItemCategory + "') ";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND PI.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND PI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND PI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			if (fromSalesperson != "")
			{
				text3 = text3 + " AND PI.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
			}
			if (fromLocation != "")
			{
				text3 = text3 + " AND PID.LocationID BETWEEN '" + fromLocation + "' AND '" + toLocation + "' ";
			}
			text3 += " GROUP BY PI.TransactionDate,PI.CustomerID,Customer.CustomerName,PID.ProductID,TransactionDate,PID.VoucherID,PID.Quantity,UnitPrice, PID.Description,PI.CostCategoryID, PI.CurrencyID, PI.Discount, PI.JobID, PI.Note, PI.PONumber, JobName ORDER BY PI.CustomerID";
			FillDataSet(dataSet2, "SalesProformaInvoice", text3);
			dataSet.Merge(dataSet2);
			dataSet.Relations.Add("SalesProformaREL", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["SalesProformaInvoice"].Columns["CustomerID"], createConstraints: false);
			return dataSet;
		}

		public DataSet GetProformaInvoiceSummaryReport(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string fromSalesperson, string toSalesperson)
		{
			try
			{
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				DataSet dataSet = new DataSet();
				string text3 = "SELECT PI.CustomerID,Cus.CustomerName,PI.*, JobName, TermName FROM SalesProforma_Invoice PI\r\n                                INNER JOIN Customer CUS \r\n\t\t\t\t\t\t\t\tON Cus.CustomerID = PI.CustomerID\r\n\t\t\t\t\t\t\t\tLEFT JOIN Job J ON PI.JobID=J.JobID\r\n\t\t\t\t\t\t\t\tLEFT JOIN Payment_Term PT On PI.TermID=PT.PaymentTermID\r\n                                 WHERE [TransactionDate] BETWEEN '" + text + "' AND '" + text2 + "' ";
				if (fromCustomer != "")
				{
					text3 = text3 + " AND PI.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
				}
				if (fromClass != "")
				{
					text3 = text3 + " AND PI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					text3 = text3 + " AND PI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				text3 += "Group By PI.CustomerID,Cus.CustomerName, PI.SysDocID, PI.VoucherID, PI.TransactionDate,PI.SalesFlow, PI.SalespersonID, PI.RequiredDate, PI.ShippingAddressID, PI.ShippingMethodID,PI.BillingAddressID, PI.CustomerAddress, PI.ShipToAddress, PI.Status, PI.CurrencyID, PI.TermID, PI.JobID, PI.CostCategoryID, PI.IsVoid, PI.Reference, PI.Discount,PI.TaxAmount, PI.Total, PI.PONumber, PI.Note, PI.ApprovalStatus,PI.CurrencyID,PI.DateCreated,PI.DateUpdated, PI.CreatedBy, PI.UpdatedBy,JobName, TermName, PI.IsExport, PI.DueDate, PI.VerificationStatus";
				if (fromSalesperson != "")
				{
					text3 = text3 + " AND PI.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
				}
				FillDataSet(dataSet, "ProformaInvoice", text3);
				return dataSet;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetDeliveryNoteDetailReport(DateTime fromDate, DateTime toDate, string fromItem, string toItem, string fromItemClass, string toItemClass, string fromItemCategory, string toItemCategory, string fromCustomer, string toCustomer, string fromCustomerClass, string toCustomerClass, string fromCustomerGroup, string toCustomerGroup, string fromSalesperson, string toSalesperson, string fromLocation, string toLocation)
		{
			string text = CommonLib.ToSqlDateTimeString(fromDate);
			string text2 = CommonLib.ToSqlDateTimeString(toDate);
			string text3 = "SELECT DISTINCT DN.CustomerID,Cus.CustomerName FROM Delivery_Note DN\r\n                                INNER JOIN Customer CUS ON Cus.CustomerID = DN.CustomerID \r\n\t\t\t\t\t\t\t\t";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (fromCustomer != "")
			{
				text3 = text3 + " AND DN.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND DN.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND DN.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			text3 += " GROUP BY DN.CustomerID,Cus.CustomerName ORDER BY CustomerID";
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "Case_Client", text3);
			DataSet dataSet2 = new DataSet();
			text3 = "Select DND.ProductID,\r\n\t\t\t\t\t\tTransactionDate,DND.VoucherID,DN.CustomerID + '-' + CustomerName AS 'Customer',DN.CustomerID,DND.Description,DN.CostCategoryID, DN.CurrencyID, DN.Discount, DN.JobID, DN.Note, DN.PONumber, JobName,\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\tDND.Quantity,UnitPrice, (DND.Quantity * UnitPrice) AS Amount\r\n\r\n                        FROM Delivery_Note_Detail DND INNER JOIN Delivery_Note DN ON\r\n\r\n                        DND.SysDocID = DN.SysDocID AND DND.VoucherID = DN.VoucherID\r\n                        LEFT JOIN Job J On DN.JobID=J.JobID\r\n\r\n                        INNER JOIN Product PR ON DND.ProductID = PR.ProductID INNER JOIN\r\n\r\n                        Customer ON Customer.CustomerID = DN.CustomerID";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (fromItem != "")
			{
				text3 = text3 + " AND DND.ProductID BETWEEN '" + fromItem + "' AND '" + toItem + "' ";
			}
			if (fromItemClass != "")
			{
				text3 = text3 + " AND DND.ProductID IN (SELECT ProductID FROM Product WHERE ClassID BETWEEN '" + fromItemClass + "' AND '" + toItemClass + "') ";
			}
			if (fromItemCategory != "")
			{
				text3 = text3 + " AND DND.ProductID IN (SELECT ProductID FROM Product WHERE CategoryID BETWEEN '" + fromItemCategory + "' AND '" + toItemCategory + "') ";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND DN.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND DN.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND DN.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			if (fromSalesperson != "")
			{
				text3 = text3 + " AND DN.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
			}
			if (fromLocation != "")
			{
				text3 = text3 + " AND DND.LocationID BETWEEN '" + fromLocation + "' AND '" + toLocation + "' ";
			}
			text3 += " GROUP BY DN.TransactionDate,DN.CustomerID,Customer.CustomerName,DND.ProductID,TransactionDate,DND.VoucherID,DND.Quantity,UnitPrice, DND.Description,DN.CostCategoryID, DN.CurrencyID, DN.Discount, DN.JobID, DN.Note, DN.PONumber, JobName ORDER BY DN.CustomerID";
			FillDataSet(dataSet2, "DeliveryNoteDetail", text3);
			dataSet.Merge(dataSet2);
			dataSet.Relations.Add("DeliveryNoteREL", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["DeliveryNoteDetail"].Columns["CustomerID"], createConstraints: false);
			return dataSet;
		}

		public DataSet GetDeliveryNoteSummaryReport(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string fromSalesperson, string toSalesperson)
		{
			try
			{
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				DataSet dataSet = new DataSet();
				string text3 = "SELECT DN.CustomerID,Cus.CustomerName,DN.*, JobName, TermName, DriverName, VehicleName FROM Delivery_Note DN \r\n                                INNER JOIN Customer CUS \r\n\t\t\t\t\t\t\t\tON Cus.CustomerID = DN.CustomerID\r\n\t\t\t\t\t\t\t\tLEFT JOIN Job J ON DN.JobID=J.JobID\r\n\t\t\t\t\t\t\t\tLEFT JOIN Payment_Term PT On DN.TermID=PT.PaymentTermID\r\n\t\t\t\t\t\t\t\tLEFT JOIN Driver D ON DN.DriverID=D.DriverID\r\n\t\t\t\t\t\t\t\tLEFT JOIN Vehicle V ON DN.VehicleID=V.VehicleID\r\n                                 WHERE [TransactionDate] BETWEEN '" + text + "' AND '" + text2 + "' ";
				if (fromCustomer != "")
				{
					text3 = text3 + " AND DN.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
				}
				if (fromClass != "")
				{
					text3 = text3 + " AND DN.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					text3 = text3 + " AND DN.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				if (fromSalesperson != "")
				{
					text3 = text3 + " AND DN.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
				}
				text3 += "Group BY DN.CustomerID,Cus.CustomerName,DN.SysDocID, DN.VoucherID, DN.TransactionDate,DN.SalesFlow, DN.SalespersonID, DN.RequiredDate, DN.ShippingAddressID,DN.ShippingMethodID,DN.BillingAddressID, DN.CustomerAddress, DN.ShipToAddress, DN.Status, DN.CurrencyID, DN.TermID, DN.JobID, DN.CostCategoryID, DN.IsVoid, DN.Reference, DN.Discount, DN.Total, DN.PONumber, DN.Note,DN.CurrencyID,DN.DateCreated,DN.DateUpdated, DN.CreatedBy, DN.UpdatedBy,JobName, TermName, DN.IsExport, DN.SourceDocType, DN.CLUserID, DN.Port, DN.Reference2, DN.IsInvoiced, DN.IsShipped,DN.ContainerNumber, DN.ContainerSizeID, DN.InvoiceSysDocID, DN.InvoiceVoucherID, DN.DriverID, DN.VehicleID, DriverName, VehicleName";
				FillDataSet(dataSet, "DeliveryNote", text3);
				return dataSet;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetSalesReceiptDetailReport(DateTime fromDate, DateTime toDate, string fromItem, string toItem, string fromItemClass, string toItemClass, string fromItemCategory, string toItemCategory, string fromCustomer, string toCustomer, string fromCustomerClass, string toCustomerClass, string fromCustomerGroup, string toCustomerGroup, string fromSalesperson, string toSalesperson, string fromLocation, string toLocation, string customerIDs)
		{
			string text = CommonLib.ToSqlDateTimeString(fromDate);
			string text2 = CommonLib.ToSqlDateTimeString(toDate);
			string text3 = "SELECT DISTINCT SR.CustomerID,Cus.CustomerName FROM Sales_Receipt SR\r\n                                INNER JOIN Customer CUS ON Cus.CustomerID = SR.CustomerID \r\n\t\t\t\t\t\t\t\t";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (customerIDs != "")
			{
				text3 = text3 + " AND SR.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND SR.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND SR.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND SR.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			text3 += " GROUP BY SR.CustomerID,Cus.CustomerName ORDER BY CustomerID";
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "Case_Client", text3);
			DataSet dataSet2 = new DataSet();
			text3 = "Select SRD.ProductID,\r\n\t\t\t\t\t\tTransactionDate,SRD.VoucherID,SR.CustomerID + '-' + CustomerName AS 'Customer',SR.CustomerID,SRD.Description, SR.CurrencyID, SR.Discount, SR.Note, SR.PONumber, \r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\tSRD.Quantity,UnitPrice, (SRD.Quantity * UnitPrice) AS Amount\r\n\r\n                        FROM Sales_Receipt_Detail SRD INNER JOIN Sales_Receipt SR ON\r\n\r\n                        SRD.SysDocID = SR.SysDocID AND SRD.VoucherID = SR.VoucherID\r\n                       \r\n                        INNER JOIN Product PR ON SRD.ProductID = PR.ProductID INNER JOIN\r\n\r\n                        Customer ON Customer.CustomerID = SR.CustomerID";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (fromItem != "")
			{
				text3 = text3 + " AND SRD.ProductID BETWEEN '" + fromItem + "' AND '" + toItem + "' ";
			}
			if (fromItemClass != "")
			{
				text3 = text3 + " AND SRD.ProductID IN (SELECT ProductID FROM Product WHERE ClassID BETWEEN '" + fromItemClass + "' AND '" + toItemClass + "') ";
			}
			if (fromItemCategory != "")
			{
				text3 = text3 + " AND SRD.ProductID IN (SELECT ProductID FROM Product WHERE CategoryID BETWEEN '" + fromItemCategory + "' AND '" + toItemCategory + "') ";
			}
			if (customerIDs != "")
			{
				text3 = text3 + " AND SR.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND SR.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND SR.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND SR.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			if (fromSalesperson != "")
			{
				text3 = text3 + " AND SR.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
			}
			text3 += " GROUP BY SR.TransactionDate,SR.CustomerID,Customer.CustomerName,SRD.ProductID,TransactionDate,SRD.VoucherID,SRD.Quantity,UnitPrice, SRD.Description,SR.CurrencyID, SR.Discount, SR.Note, SR.PONumber ORDER BY SR.CustomerID";
			FillDataSet(dataSet2, "SalesReceiptDetail", text3);
			dataSet.Merge(dataSet2);
			dataSet.Relations.Add("SalesReceiptREL", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["SalesReceiptDetail"].Columns["CustomerID"], createConstraints: false);
			return dataSet;
		}

		public DataSet GetSalesReceiptSummaryReport(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string fromSalesperson, string toSalesperson, string customerIDs)
		{
			try
			{
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				DataSet dataSet = new DataSet();
				string text3 = "SELECT SR.CustomerID,Cus.CustomerName,SR.* FROM Sales_Receipt SR \r\n                                INNER JOIN Customer CUS \r\n\t\t\t\t\t\t\t\tON Cus.CustomerID = SR.CustomerID\r\n\t\t\t\t\t\t\t\t\r\n                                 WHERE [TransactionDate] BETWEEN '" + text + "' AND '" + text2 + "' ";
				if (customerIDs != "")
				{
					text3 = text3 + " AND SR.CustomerID IN(" + customerIDs + ")";
				}
				if (fromCustomer != "")
				{
					text3 = text3 + " AND SR.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
				}
				if (fromClass != "")
				{
					text3 = text3 + " AND SR.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					text3 = text3 + " AND SR.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				if (fromSalesperson != "")
				{
					text3 = text3 + " AND SR.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
				}
				text3 += "Group BY SR.CustomerID,Cus.CustomerName,SR.SysDocID, SR.VoucherID, SR.TransactionDate,SR.SalesFlow, SR.SalespersonID, SR.RequiredDate, SR.ShippingAddressID,SR.ShippingMethodID,SR.CustomerAddress, SR.Status, SR.CurrencyID, SR.IsVoid, SR.Reference, SR.Discount, SR.Total, SR.PONumber, SR.Note,SR.CurrencyID,SR.DateCreated,SR.DateUpdated, SR.CreatedBy, SR.UpdatedBy, SR.CurrencyRate, SR.RegisterID, SR.DiscountFC, SR.TaxAmount, SR.TaxAmountFC,SR.TotalFC,SR.IsDelivered";
				FillDataSet(dataSet, "SalesReceipt", text3);
				return dataSet;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetSalesInvoiceDetailReport(DateTime fromDate, DateTime toDate, string fromItem, string toItem, string fromItemClass, string toItemClass, string fromItemCategory, string toItemCategory, string fromCustomer, string toCustomer, string fromCustomerClass, string toCustomerClass, string fromCustomerGroup, string toCustomerGroup, string fromSalesperson, string toSalesperson, string fromLocation, string toLocation, string customerIDs)
		{
			string text = CommonLib.ToSqlDateTimeString(fromDate);
			string text2 = CommonLib.ToSqlDateTimeString(toDate);
			string text3 = "SELECT DISTINCT SI.CustomerID,Cus.CustomerName FROM Sales_Invoice SI\r\n                                INNER JOIN Customer CUS ON Cus.CustomerID = SI.CustomerID \r\n\t\t\t\t\t\t\t\t";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (customerIDs != "")
			{
				text3 = text3 + " AND SI.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND SI.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND SI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND SI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			text3 += " GROUP BY SI.CustomerID,Cus.CustomerName ORDER BY CustomerID";
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "Case_Client", text3);
			DataSet dataSet2 = new DataSet();
			text3 = "Select SID.ProductID,\r\n\t\t\t\t\t\tTransactionDate,SID.VoucherID,SI.CustomerID + '-' + CustomerName AS 'Customer',SI.CustomerID,SID.Description, SI.CurrencyID, SI.Discount, SI.Note, SI.PONumber, \r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\tSID.Quantity,UnitPrice, (SID.Quantity * UnitPrice) AS Amount,SP.FullName AS [SalesPerson], SP.SalespersonID\r\n\r\n                        FROM Sales_Invoice_Detail SID INNER JOIN Sales_Invoice SI ON\r\n\r\n                        SID.SysDocID = SI.SysDocID AND SID.VoucherID = SI.VoucherID\r\n                       \r\n                        INNER JOIN Product PR ON SID.ProductID = PR.ProductID INNER JOIN\r\n\r\n\r\n                        Customer ON Customer.CustomerID = SI.CustomerID\r\n\t\t\t\t\t\t\r\n\t\t\t\t\t\tLEFT JOIN Salesperson SP ON SI.SalespersonID=SP.SalespersonID";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			if (fromItem != "")
			{
				text3 = text3 + " AND SID.ProductID BETWEEN '" + fromItem + "' AND '" + toItem + "' ";
			}
			if (fromItemClass != "")
			{
				text3 = text3 + " AND SID.ProductID IN (SELECT ProductID FROM Product WHERE ClassID BETWEEN '" + fromItemClass + "' AND '" + toItemClass + "') ";
			}
			if (fromItemCategory != "")
			{
				text3 = text3 + " AND SID.ProductID IN (SELECT ProductID FROM Product WHERE CategoryID BETWEEN '" + fromItemCategory + "' AND '" + toItemCategory + "') ";
			}
			if (customerIDs != "")
			{
				text3 = text3 + " AND SI.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND SI.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromCustomerClass != "")
			{
				text3 = text3 + " AND SI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromCustomerClass + "' AND '" + toCustomerClass + "') ";
			}
			if (fromCustomerGroup != "")
			{
				text3 = text3 + " AND SI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromCustomerGroup + "' AND '" + toCustomerGroup + "') ";
			}
			if (fromSalesperson != "")
			{
				text3 = text3 + " AND SI.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
			}
			text3 += " GROUP BY SI.TransactionDate,SI.CustomerID,Customer.CustomerName,SID.ProductID,TransactionDate,SID.VoucherID,SID.Quantity,UnitPrice, SID.Description,SI.CurrencyID, SI.Discount, SI.Note, SI.PONumber,SP.FullName,SP.SalespersonID";
			text3 += " ORDER BY SI.CustomerID";
			FillDataSet(dataSet2, "SalesInvoiceDetail", text3);
			dataSet.Merge(dataSet2);
			dataSet.Relations.Add("SalesInvoiceREL", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["SalesInvoiceDetail"].Columns["CustomerID"], createConstraints: false);
			return dataSet;
		}

		public DataSet GetSalesInvoiceSummaryReport(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string fromSalesperson, string toSalesperson, string customerIDs)
		{
			try
			{
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				DataSet dataSet = new DataSet();
				string text3 = "SELECT SI.CustomerID,Cus.CustomerName,SI.*, JobName, SI.CostCategoryID, SP.FullName AS SalesPerson, Sp.SalespersonID FROM Sales_Invoice SI \r\n                                INNER JOIN Customer CUS \r\n\t\t\t\t\t\t\t\tON Cus.CustomerID = SI.CustomerID\r\n\t\t\t\t\t\t\t\tLEFT JOIN Job J ON SI.JobID=J.JobID\r\n\t\t\t\t\t\t\t\tLEFT JOIn Salesperson SP ON SI.SalespersonID=SP.SalespersonID\r\n\t\t\t\t\t\t\t\t\r\n                                 WHERE [TransactionDate] BETWEEN '" + text + "' AND '" + text2 + "' ";
				if (customerIDs != "")
				{
					text3 = text3 + " AND SI.CustomerID IN(" + customerIDs + ")";
				}
				if (fromCustomer != "")
				{
					text3 = text3 + " AND SI.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
				}
				if (fromClass != "")
				{
					text3 = text3 + " AND SI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					text3 = text3 + " AND SI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				if (fromSalesperson != "")
				{
					text3 = text3 + " AND SI.SalespersonID BETWEEN '" + fromSalesperson + "' AND '" + toSalesperson + "' ";
				}
				text3 += "Group BY SI.CustomerID,Cus.CustomerName,SI.SysDocID, SI.VoucherID, SI.TransactionDate,SI.SalesFlow, SI.SalespersonID, SI.RequiredDate, SI.ShippingAddressID, SI.ShippingMethodID,SI.CustomerAddress, SI.Status, SI.CurrencyID, SI.IsVoid, SI.Reference, SI.Discount, SI.Total, SI.PONumber, SI.Note,SI.CurrencyID,SI.DateCreated,SI.DateUpdated, SI.CreatedBy, SI.UpdatedBy, SI.CurrencyRate, SI.RegisterID, SI.DiscountFC, SI.TaxAmount, SI.TaxAmountFC,SI.TotalFC,SI.IsDelivered, SI.DueDate, SI.CLUserID, SI.IsCash, SI.IsExport, SI.SourceDocType, SI.BillingAddressID, SI.ShipToAddress, SI.TermID, SI.JobID, SI.CostCategoryID, SI.Reference2, SI.TotalCOGS, SI.IsWeightInvoice, SI.PaymentMethodType, SI.RequireUpdate, SI.ApprovalStatus, SI.VerificationStatus, JobName, SP.FullName,Sp.SalespersonID";
				FillDataSet(dataSet, "SalesInvoice", text3);
				return dataSet;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetSalesByCustomerGroupDetailReport(DateTime from, DateTime to, string fromGroup, string toGroup)
		{
			string text = CommonLib.ToSqlDateTimeString(from);
			string text2 = CommonLib.ToSqlDateTimeString(to);
			string text3 = "Select DISTINCT ISNULL(CG.GroupID,'No Group') AS GroupID,CG.GroupName\r\n                            FROM Sales_Invoice SI INNER JOIN Customer ON SI.CustomerID=Customer.CustomerID\r\n                            LEFT OUTER JOIN Customer_Group CG ON CG.GroupID=Customer.CustomerGroupID";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			text3 += " AND ISNULL(IsVoid,'False')='False' ";
			if (fromGroup != "")
			{
				text3 = text3 + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			text3 += " UNION ";
			text3 += "Select DISTINCT ISNULL(CG.GroupID,'No Group') AS GroupID,CG.GroupName\r\n                            FROM Sales_Return SI INNER JOIN Customer ON SI.CustomerID=Customer.CustomerID\r\n                            LEFT OUTER JOIN Customer_Group CG ON CG.GroupID=Customer.CustomerGroupID";
			text3 = text3 + " WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			text3 += " AND ISNULL(IsVoid,'False')='False' ";
			if (fromGroup != "")
			{
				text3 = text3 + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			text3 += " ORDER BY GroupID";
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "Case_Client", text3);
			DataSet dataSet2 = new DataSet();
			text3 = "Select ISNULL(CG.GroupID,'No Group') AS GroupID,SysDocID,VoucherID,SI.CustomerID + '-' + Customer.CustomerName AS Customer,TransactionDate,SI.Note,\r\n                    Case ISNULL(IsCash,'False') WHEN 'False' THEN 'Credit Sale' ELSE 'Cash Sale' END AS [Type],\r\n                    SI.SalespersonID, SI.CurrencyID,CurrencyRate,Discount,DiscountFC,\r\n                    Total,TotalFC \r\n\r\n                    FROM Sales_Invoice SI INNER JOIN Customer ON Customer.CustomerID=SI.CustomerID\r\n                    LEFT OUTER JOIN Customer_Group CG ON CG.GroupID=Customer.CustomerGroupID \r\n                    WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			text3 += " AND ISNULL(IsVoid,'False')='False' ";
			if (fromGroup != "")
			{
				text3 = text3 + " AND SI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			text3 += " UNION ";
			text3 = text3 + "Select ISNULL(CG.GroupID,'No Group') AS GroupID,SysDocID,VoucherID,SI.CustomerID + '-' + Customer.CustomerName AS Customer,TransactionDate,SI.Note,\r\n                    Case ISNULL(IsCash,'False') WHEN 'False' THEN 'Credit Return' ELSE 'Cash Return' END AS [Type],\r\n                    SI.SalespersonID, SI.CurrencyID,CurrencyRate,-1*Discount,-1*DiscountFC,\r\n                    -1*Total,-1*TotalFC \r\n\r\n                    FROM Sales_Return SI INNER JOIN Customer ON Customer.CustomerID=SI.CustomerID\r\n                    LEFT OUTER JOIN Customer_Group CG ON CG.GroupID=Customer.CustomerGroupID  \r\n                        WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			text3 += " AND ISNULL(IsVoid,'False')='False' ";
			if (fromGroup != "")
			{
				text3 = text3 + " AND SI.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			text3 += " ORDER BY TransactionDate";
			FillDataSet(dataSet2, "Sales", text3);
			dataSet.Merge(dataSet2);
			dataSet.Relations.Add("Sales Detail", dataSet.Tables["Case_Client"].Columns["GroupID"], dataSet.Tables["Sales"].Columns["GroupID"], createConstraints: false);
			return dataSet;
		}

		public DataSet GetSalesByCustomerGroupSummaryReport(DateTime from, DateTime to, string fromGroup, string toGroup)
		{
			string text = CommonLib.ToSqlDateTimeString(from);
			string text2 = CommonLib.ToSqlDateTimeString(to);
			DataSet dataSet = new DataSet();
			string str = "Select ISNULL(CG.GroupID,'No Group') AS GroupID, CG.GroupName,\r\n                            SUM(Discount) AS Discount,\r\n                            SUM(CASE ISNULL(IsCash,'False') WHEN  'True' THEN Total ELSE 0 END) AS [CashSale],\r\n                            SUM(CASE ISNULL(IsCash,'False') WHEN  'False' THEN Total ELSE 0 END) AS [CreditSale] \r\n                            FROM Sales_Invoice SI INNER JOIN Customer CU ON SI.CustomerID=CU.CustomerID\r\n\t\t\t\t\t\t\tLEFT OUTER JOIN Customer_Group CG ON CU.CustomerGroupID=CG.GroupID\r\n                            WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			str += " AND ISNULL(IsVoid,'False')='False' ";
			if (fromGroup != "")
			{
				str = str + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			str += " GROUP BY CG.GroupID, CG.GroupName";
			FillDataSet(dataSet, "Sales", str);
			dataSet.Tables[0].PrimaryKey = new DataColumn[1]
			{
				dataSet.Tables[0].Columns["CustomerID"]
			};
			str = "Select ISNULL(CG.GroupID,'No Group') AS GroupID, CG.GroupName,\r\n                            -1*SUM(Discount) AS DiscountReturn,\r\n                            SUM(Total) AS [SalesReturn]\r\n                            FROM Sales_Return SI INNER JOIN Customer CU ON SI.CustomerID=CU.CustomerID\r\n\t\t\t\t\t\t\tLEFT OUTER JOIN Customer_Group CG ON CU.CustomerGroupID=CG.GroupID\r\n                    WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' ";
			str += " AND ISNULL(IsVoid,'False')='False' ";
			if (fromGroup != "")
			{
				str = str + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
			}
			str += " GROUP BY CG.GroupID, CG.GroupName";
			DataSet dataSet2 = new DataSet();
			FillDataSet(dataSet2, "Sales", str);
			dataSet2.Tables[0].PrimaryKey = new DataColumn[1]
			{
				dataSet2.Tables[0].Columns["GroupID"]
			};
			dataSet.Merge(dataSet2.Tables[0]);
			return dataSet;
		}

		public DataSet GetCustomerListReport(string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string fromArea, string toArea, bool showInactive, string customerIDs)
		{
			DataSet dataSet = new DataSet();
			string text = "SELECT  CustomerID,CustomerName,CustomerClassID, AreaID,\r\n                                ContactName,CountryID,CustomerGroupID \r\n                                FROM Customer \r\n                                WHERE 1=1 ";
			if (customerIDs != "")
			{
				text = text + " AND CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text = text + " AND CustomerID>='" + fromCustomer + "'";
			}
			if (toCustomer != "")
			{
				text = text + " AND CustomerID<='" + toCustomer + "'";
			}
			if (fromClass != "")
			{
				text = text + " AND CustomerClassID>='" + fromClass + "'";
			}
			if (toClass != "")
			{
				text = text + " AND CustomerClassID<='" + toClass + "'";
			}
			if (fromGroup != "")
			{
				text = text + " AND CustomerGroupID>='" + fromGroup + "'";
			}
			if (toGroup != "")
			{
				text = text + " AND CustomerGroupID<='" + toGroup + "'";
			}
			if (fromArea != "")
			{
				text = text + " AND AreaID>='" + fromArea + "'";
			}
			if (toArea != "")
			{
				text = text + " AND AreaID<='" + toArea + "'";
			}
			if (!showInactive)
			{
				text += " AND ISNULL(IsInactive,'False') = 'False'";
			}
			FillDataSet(dataSet, "Customers", text);
			return dataSet;
		}

		public DataSet GetCustomerPrimaryContactListReport(string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string fromArea, string toArea, bool showInactive, string customerIDs)
		{
			DataSet dataSet = new DataSet();
			string text = "SELECT  Customer.CustomerID,CustomerName,\r\n                            CA.ContactName,AddressPrintFormat,City,Country,Phone1,Mobile,Fax,Email\r\n                            FROM Customer LEFT OUTER JOIN Customer_Address CA\r\n                            ON Customer.CustomerID=CA.CustomerID\r\n                                WHERE CA.AddressID=Customer.PrimaryAddressID ";
			if (customerIDs != "")
			{
				text = text + " AND Customer.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text = text + " AND Customer.CustomerID>='" + fromCustomer + "'";
			}
			if (toCustomer != "")
			{
				text = text + " AND Customer.CustomerID<='" + toCustomer + "'";
			}
			if (fromClass != "")
			{
				text = text + " AND CustomerClassID>='" + fromClass + "'";
			}
			if (toClass != "")
			{
				text = text + " AND CustomerClassID<='" + toClass + "'";
			}
			if (fromGroup != "")
			{
				text = text + " AND CustomerGroupID>='" + fromGroup + "'";
			}
			if (toGroup != "")
			{
				text = text + " AND CustomerGroupID<='" + toGroup + "'";
			}
			if (fromArea != "")
			{
				text = text + " AND AreaID>='" + fromArea + "'";
			}
			if (toArea != "")
			{
				text = text + " AND AreaID<='" + toArea + "'";
			}
			if (!showInactive)
			{
				text += " AND ISNULL(IsInactive,'False') = 'False'";
			}
			FillDataSet(dataSet, "Customers", text);
			return dataSet;
		}

		public DataSet GetCustomerProfileReport(string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string fromArea, string toArea, bool showInactive, string customerIDs)
		{
			DataSet dataSet = new DataSet();
			string text = "SELECT  Case_Client.CaseClientID, CaseClientName,ForeignName, LegalName,Case_Client.ContactName,Case_Client.TermID,\r\n                            AreaName,Case_Client.AcceptCheckPayment,CA.Phone1,CA.Mobile,CA.Fax,CA.Email,CA.Website,\r\n                            Case_Client.AcceptPDC,Case_Client.CreditLimitType,Case_Client.CreditAmount,\r\n                            Case_Client.CountryID,Case_Client.ShippingMethodID,Case_Client.IsInactive,IsHold,Case_Client.BankName,Case_Client.BankBranch,Case_Client.BankAccountNumber,\r\n                            Case_Client.StatementSendingMethod,Case_Client.PaymentTermID,IsCustomerSince,\r\n                            Case_Client.Note,Case_Client.PaymentMethodID,Case_Client.SalesPersonID + '-' + Salesperson.FullName AS Salesperson\r\n                            FROM Case_Client \r\n                            \r\n                            LEFT OUTER JOIN Area Area ON Case_Client.AreaID=Area.AreaID\r\n                            LEFT OUTER JOIN Salesperson Salesperson ON Case_Client.SalespersonID=Salesperson.SalespersonID\r\n                            LEFT OUTER JOIN Customer_Address CA ON Case_Client.CaseClientID=CA.CustomerID AND Case_Client.PrimaryAddressID=CA.AddressID \r\n                            WHERE 1=1 ";
			if (customerIDs != "")
			{
				text = text + " AND Case_Client.CaseClientID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text = text + " AND Case_Client.CaseClientID>='" + fromCustomer + "'";
			}
			if (toCustomer != "")
			{
				text = text + " AND Case_Client.CaseClientID<='" + toCustomer + "'";
			}
			if (fromArea != "")
			{
				text = text + " AND Case_Client.AreaID>='" + fromArea + "'";
			}
			if (toArea != "")
			{
				text = text + " AND Case_Client.AreaID<='" + toArea + "'";
			}
			if (!showInactive)
			{
				text += " AND ISNULL(Case_Client.IsInactive,'False') = 'False'";
			}
			FillDataSet(dataSet, "Case_Client", text);
			return dataSet;
		}

		public DataSet GetCustomerActivityReport(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string customerIDs)
		{
			string text = CommonLib.ToSqlDateTimeString(from);
			string text2 = CommonLib.ToSqlDateTimeString(to);
			string str = "SELECT CustomerID,CustomerName FROM Customer WHERE ISNULL(IsInactive,'False')='False' ";
			if (customerIDs != "")
			{
				str = str + " AND CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				str = str + " AND CustomerID >= '" + fromCustomer + "'";
			}
			if (toCustomer != "")
			{
				str = str + " AND CustomerID <= '" + toCustomer + "'";
			}
			if (fromClass != "")
			{
				str = str + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID >= '" + fromClass + "') ";
			}
			if (toClass != "")
			{
				str = str + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID <= '" + toClass + "') ";
			}
			if (fromGroup != "")
			{
				str = str + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID >= '" + fromGroup + "') ";
			}
			if (toGroup != "")
			{
				str = str + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID <= '" + toGroup + "') ";
			}
			str += " ORDER BY CustomerID ";
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "Case_Client", str);
			DataSet dataSet2 = new DataSet();
			string text3 = "";
			if (customerIDs != "")
			{
				str = str + " AND CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = " AND CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
			}
			if (fromClass != "")
			{
				str = str + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID >= '" + fromClass + "') ";
			}
			if (toClass != "")
			{
				str = str + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID <= '" + toClass + "') ";
			}
			if (fromGroup != "")
			{
				str = str + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID >= '" + fromGroup + "') ";
			}
			if (toGroup != "")
			{
				str = str + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID <= '" + toGroup + "') ";
			}
			str = "SELECT Sales_Invoice.SysDocID,VoucherID,CustomerID,TransactionDate,\r\n                        SysDocType,Note,\r\n                        Total AS Amount \r\n                        FROM Sales_Invoice INNER JOIN System_Document SD ON Sales_Invoice.SysDocID=SD.SysDocID\r\n                        WHERE ISNULL(IsVoid,'False')='False' AND TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' " + text3 + "\r\n\r\n                        UNION \r\n\r\n                        SELECT Sales_Return.SysDocID,VoucherID,CustomerID,TransactionDate,\r\n                        SysDocType,Note,\r\n                        Total AS Amount \r\n                        FROM Sales_Return INNER JOIN System_Document SD ON Sales_Return.SysDocID=SD.SysDocID\r\n                        WHERE ISNULL(IsVoid,'False')='False' AND TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'  " + text3 + "\r\n\r\n                        UNION \r\n\r\n                        SELECT Sales_Quote.SysDocID,VoucherID,CustomerID,TransactionDate,\r\n                        SysDocType,Note,\r\n                        Total AS Amount \r\n                        FROM Sales_Quote INNER JOIN System_Document SD ON Sales_Quote.SysDocID=SD.SysDocID\r\n                        WHERE ISNULL(IsVoid,'False')='False' AND TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'  " + text3 + "\r\n\r\n                        UNION \r\n\r\n                        SELECT Sales_Order.SysDocID,VoucherID,CustomerID,TransactionDate,\r\n                        SysDocType,Note,\r\n                        Total AS Amount \r\n                        FROM Sales_Order INNER JOIN System_Document SD ON Sales_Order.SysDocID=SD.SysDocID\r\n                        WHERE ISNULL(IsVoid,'False')='False' AND TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'  " + text3 + "\r\n\r\n                        UNION \r\n\r\n                        SELECT Sales_Order.SysDocID,VoucherID,CustomerID,TransactionDate,\r\n                        SysDocType,Note,\r\n                        Total AS Amount \r\n                        FROM Sales_Order INNER JOIN System_Document SD ON Sales_Order.SysDocID=SD.SysDocID\r\n                        WHERE ISNULL(IsVoid,'False')='False' AND TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'  " + text3 + "\r\n\r\n\r\n                        UNION \r\n\r\n                        SELECT Delivery_Note.SysDocID,VoucherID,CustomerID,TransactionDate,\r\n                        SysDocType,Note,\r\n                        NULL AS Amount \r\n                        FROM Delivery_Note INNER JOIN System_Document SD ON Delivery_Note.SysDocID=SD.SysDocID\r\n                        WHERE  ISNULL(IsVoid,'False')='False' AND TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'  " + text3 + "\r\n\r\n                        UNION \r\n\r\n\r\n                        SELECT GL_Transaction.SysDocID,VoucherID,PayeeID AS CustomerID,TransactionDate,\r\n                        SysDocType,Description AS [Note],\r\n                        NULL AS Amount \r\n                        FROM GL_Transaction INNER JOIN System_Document SD ON GL_Transaction.SysDocID=SD.SysDocID\r\n                        WHERE ISNULL(IsVoid,'False')='False' AND PayeeType='C' AND\r\n                        TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'\r\n\r\n                        ORDER BY TransactionDate";
			FillDataSet(dataSet2, "CustomerActivity", str);
			dataSet.Merge(dataSet2);
			dataSet.Relations.Add("Customer_Activity", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["CustomerActivity"].Columns["CustomerID"], createConstraints: false);
			return dataSet;
		}

		public DataSet RequestForCreditLimitReport(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, string customerIDmultiple)
		{
			string text = CommonLib.ToSqlDateTimeString(from);
			string text2 = CommonLib.ToSqlDateTimeString(to);
			string str = "SELECT CustomerID,CustomerName,CreditAmount, PT.TermName,CASE WHEN InsuranceID ='' THEN 'NA' ELSE 'Yes' END [Insurance],CollectionRemarks,\r\n                            InsApprovedAmount,CASE WHEN (SELECT SUM(AMOUNT)   from Collateral WHERE PayeeID=CustomerID \r\n                            AND ISNULL(IsReturned,'False')='False') > 0 THEN 'Yes' ELSE 'NA' END AS [Security Cheque],\r\n                            CASE WHEN (SELECT SUM(AMOUNT)   from Cheque_Received WHERE PayeeID=CustomerID \r\n                            AND Status=1) > 0 THEN 'Yes' ELSE 'NA' END AS [PDC On Hand],\r\n                            CASE WHEN (SELECT SUM(AMOUNT)   FROM GL_Transaction WHERE  SysDocID IN (SELECT SysDocID FROM System_Document WHERE SysDocType='12') AND\r\n                            PayeeID=CustomerID ) > 0 THEN 'Yes' ELSE 'NA' END AS [Bounced],\r\n                            (SELECT SUM(AMOUNT)   FROM GL_Transaction WHERE  SysDocID IN (SELECT SysDocID FROM System_Document WHERE SysDocType='12') AND\r\n                            PayeeID=CustomerID ) AS [Bounced_Amt],\r\n                            (SELECT SUM(AMOUNT)   from Collateral WHERE PayeeID=CustomerID AND ISNULL(IsReturned,'False')='False') AS [Securiry],InsRating,Customer.Note,\r\n                            SP.FullName AS [Sales Person]\r\n                            FROM customer LEFT JOIN Payment_Term PT On PT.PaymentTermID=customer.PaymentTermID\r\n                            LEFT JOIN Salesperson SP ON customer.SalesPersonID=SP.SalespersonID  WHERE ISNULL(customer.IsInactive,'False')='False' ";
			if (customerIDmultiple != "")
			{
				str = str + " AND customer.CustomerID IN(" + customerIDmultiple + ")";
			}
			if (fromCustomer != "")
			{
				str = str + " AND customer.CustomerID >= '" + fromCustomer + "'";
			}
			if (toCustomer != "")
			{
				str = str + " AND customer.CustomerID <= '" + toCustomer + "'";
			}
			if (fromClass != "")
			{
				str = str + " AND customer.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID >= '" + fromClass + "') ";
			}
			if (toClass != "")
			{
				str = str + " AND customer.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID <= '" + toClass + "') ";
			}
			if (fromGroup != "")
			{
				str = str + " AND customer.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID >= '" + fromGroup + "') ";
			}
			if (toGroup != "")
			{
				str = str + " AND customer.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID <= '" + toGroup + "') ";
			}
			str += " ORDER BY customer.CustomerID ";
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "Case_Client", str);
			if (dataSet.Tables["Case_Client"].Rows.Count == 0)
			{
				return dataSet;
			}
			string text3 = string.Empty;
			for (int i = 0; i < dataSet.Tables["Case_Client"].Rows.Count; i++)
			{
				text3 = text3 + "'" + dataSet.Tables["Case_Client"].Rows[i]["CustomerID"] + "'";
				if (i < dataSet.Tables["Case_Client"].Rows.Count - 1)
				{
					text3 += ",";
				}
			}
			DataSet dataSet2 = new DataSet();
			str = " SELECT  CustomerID,YEAR(Date) AS [Year],SUM(Amount) AS [Sales],SUM(COGS) AS [Cost],SUM(Profit) AS [Profit]\r\n                    FROM Axo_Sales_Detail\r\n                    WHERE Date \r\n                    BETWEEN '" + text + "' AND '" + text2 + "' and  CustomerID IN (" + text3 + ") GROUP BY YEAR(Date),CustomerID";
			FillDataSet(dataSet2, "Yearly_Sale", str);
			dataSet.Merge(dataSet2);
			dataSet.Relations.Add("CustomerYearlySaleREL", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["Yearly_Sale"].Columns["CustomerID"], createConstraints: false);
			DataSet dataSet3 = new DataSet();
			str = " SELECT * FROM GL_Transaction WHERE  SysDocID IN (SELECT SysDocID FROM System_Document WHERE SysDocType='12') and PayeeID IN (" + text3 + ")";
			FillDataSet(dataSet3, "Bounced_Cheque", str);
			dataSet.Merge(dataSet3);
			dataSet.Relations.Add("CustomerBouncedChequeREL", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["Bounced_Cheque"].Columns["PayeeID"], createConstraints: false);
			DataSet dataSet4 = new DataSet();
			str = "SELECT ChequeNumber,ChequeDate,Amount, PayeeID FROM Cheque_Received WHERE Status=1 and PayeeID IN (" + text3 + ")";
			FillDataSet(dataSet4, "PDC", str);
			dataSet.Merge(dataSet4);
			dataSet.Relations.Add("CustomerPDCREL", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["PDC"].Columns["PayeeID"], createConstraints: false);
			DataSet dataSet5 = new DataSet();
			str = "SELECT X.Year,X.Month, X.CustomerID,SUM(X.OriginalAmount) AS [Invoice],SUM(X.AmountDue)  AS [Balnce] FROM (\r\n                    SELECT YEAR(ARDate) AS [Year],DATENAME(month, (ARDate)) AS [Month],CustomerID,ISNULL(ISNULL(DebitFC,Debit),0) AS OriginalAmount,\r\n                    ISNULL(ISNULL(ISNULL(DebitFC,Debit),0) -   \r\n                    (SELECT CASE WHEN ARJ.CurrencyID IS NULL  OR ARJ.CurrencyID=(SELECT CurrencyID FROM Currency WHERE IsBase='True') THEN SUM(ISNULL(PaymentAmount,0)+ISNULL(DiscountAmount,0)) ELSE SUM(ISNULL(PaymentAmountFC,0)+ISNULL(DiscountAmountFC,0)) END FROM AR_Payment_Allocation ARP\r\n                    WHERE ARJ.ARID = ARP.ARJournalID  AND AllocationDate <= GETDATE()),ISNULL(ISNULL(DebitFC,Debit),0))  AS AmountDue\r\n                    FROM ARJournal ARJ     LEFT OUTER JOIN System_Document SD ON SD.SysDocID = ARJ.SysDocID\r\n                    WHERE ISNULL(Debit,0)>0 AND ISNULL(IsVoid,'False')='False'  AND ISNULL(SD.SysDocType,1) <> 12   AND ISNULL(ISPDCRow,'False') = 'False'                            \r\n                    AND (SELECT CASE WHEN (ARJ.CurrencyID IS NULL OR ARJ.CurrencyID =(SELECT CurrencyID FROM Currency WHERE IsBase='True')) THEN \r\n                    ISNULL(SUM(ISNULL(PaymentAmount,0)+ISNULL(DiscountAmount,0)),0) ELSE  \r\n                    ISNULL(SUM(ISNULL(PaymentAmountFC,0)+ISNULL(DiscountAmountFC,0)),0) END FROM AR_Payment_Allocation PA\r\n                    WHERE ARJ.ARID = PA.ARJournalID  AND AllocationDate <= GETDATE())<\r\n                    CASE WHEN (ARJ.CurrencyID IS NULL OR ARJ.CurrencyID = (SELECT CurrencyID FROM Currency WHERE IsBase='True') )\r\n                    THEN ISNULL(ISNULL(Debit,0),0) ELSE ISNULL(ISNULL(DebitFC,0),0) END   AND ARDate BETWEEN '" + text + "' AND '" + text2 + "') X  Where  X.CustomerID IN (" + text3 + ") Group BY X.Year,X.CustomerID, X.Month";
			FillDataSet(dataSet5, "Outstanding_Invoice", str);
			dataSet.Merge(dataSet5);
			dataSet.Relations.Add("CustomerOutstandingInvoiceREL", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["Outstanding_Invoice"].Columns["CustomerID"], createConstraints: false);
			return dataSet;
		}

		public DataSet GetCustomerYearMonthPaymentReport(string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, DateTime fromYear, DateTime toYear, DateTime fromMonth, DateTime toMonth, DateTime LPfromDate, DateTime LPtodate, string customerIDs)
		{
			CommonLib.ToSqlDateTimeString(fromYear);
			CommonLib.ToSqlDateTimeString(toYear);
			CommonLib.ToSqlDateTimeString(fromMonth);
			CommonLib.ToSqlDateTimeString(toMonth);
			string text = CommonLib.ToSqlDateTimeString(LPfromDate);
			string text2 = CommonLib.ToSqlDateTimeString(LPtodate);
			string text3 = "SELECT C.*  FROM Customer C WHERE ISNULL(IsInactive,'False')='False' ";
			if (customerIDs != "")
			{
				text3 = text3 + " AND CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND CustomerID >= '" + fromCustomer + "'";
			}
			if (toCustomer != "")
			{
				text3 = text3 + " AND CustomerID <= '" + toCustomer + "'";
			}
			if (fromClass != "")
			{
				text3 = text3 + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID >= '" + fromClass + "') ";
			}
			if (toClass != "")
			{
				text3 = text3 + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID <= '" + toClass + "') ";
			}
			if (fromGroup != "")
			{
				text3 = text3 + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID >= '" + fromGroup + "') ";
			}
			if (toGroup != "")
			{
				text3 = text3 + " AND CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID <= '" + toGroup + "') ";
			}
			DataSet dataSet = new DataSet();
			FillDataSet(dataSet, "CustomerDetails", text3);
			text3 = "SELECT  CustomerID,SUM(Amount) AS [Total Sales],(Count(DISTINCT Month(Date)) ) AS [Month],YEAR(Date) AS [Year] FROM Axo_Sales_Detail WHERE 1=1  AND\r\n                        Year(Date) BETWEEN '" + fromYear.Year + "' AND '" + toYear.Year + "'";
			if (customerIDs != "")
			{
				text3 = text3 + " AND CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND CustomerID >= '" + fromCustomer + "'";
			}
			if (toCustomer != "")
			{
				text3 = text3 + " AND CustomerID <= '" + toCustomer + "'";
			}
			text3 += "GROUP BY YEAR(Date),CustomerID";
			DataSet dataSet2 = new DataSet();
			FillDataSet(dataSet2, "yearDetails", text3);
			dataSet.Merge(dataSet2);
			text3 = "SELECT  CustomerID,SUM(Amount) AS [Total Sales],(Count(DISTINCT Month(Date)) ) AS [Month],Month(Date) AS [Month] FROM Axo_Sales_Detail WHERE 1=1  AND\r\n                        Month(Date) BETWEEN '" + fromMonth.Month + "' AND '" + toMonth.Month + "'";
			if (customerIDs != "")
			{
				text3 = text3 + " AND CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND CustomerID >= '" + fromCustomer + "'";
			}
			if (toCustomer != "")
			{
				text3 = text3 + " AND CustomerID <= '" + toCustomer + "'";
			}
			text3 += "GROUP BY Month(Date),CustomerID";
			DataSet dataSet3 = new DataSet();
			FillDataSet(dataSet3, "monthDetails", text3);
			dataSet.Merge(dataSet3);
			text3 = "SELECT * from Collateral WHERE ISNULL(IsReturned,'False')='False' AND  ReceiveDate BETWEEN '" + text + "' AND '" + text2 + "'";
			if (customerIDs != "")
			{
				text3 = text3 + " AND PayeeID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND PayeeID >= '" + fromCustomer + "'";
			}
			if (toCustomer != "")
			{
				text3 = text3 + " AND PayeeID <= '" + toCustomer + "'";
			}
			DataSet dataSet4 = new DataSet();
			FillDataSet(dataSet4, "collateralDetails", text3);
			dataSet.Merge(dataSet4);
			text3 = "SELECT * FROM GL_Transaction WHERE  SysDocID IN (SELECT SysDocID FROM System_Document WHERE SysDocType='12') AND TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'";
			if (customerIDs != "")
			{
				text3 = text3 + " AND PayeeID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND PayeeID >= '" + fromCustomer + "'";
			}
			if (toCustomer != "")
			{
				text3 = text3 + " AND PayeeID <= '" + toCustomer + "'";
			}
			DataSet dataSet5 = new DataSet();
			FillDataSet(dataSet5, "bouncechequeDetails", text3);
			dataSet.Merge(dataSet5);
			text3 = "SELECT  ARP.CustomerID AS [CustomerID],CUS.CustomerName AS [Customer Name],Reference,\r\n                    InvoiceVoucherID [Invoice No],ARJ.ARDate AS [Invoice Date], ARJ.ARDueDate [Due Date],\r\n                    ARJ.Debit AS [Invoice Amount],SUM(PaymentAmount) [Payment Amount]\r\n                    FROM dbo.AR_Payment_Allocation ARP INNER JOIN Customer CUS ON Cus.CustomerID = ARP.CustomerID\r\n                    INNER JOIN ARJournal ARJ ON ARP.ARJournalID = ARJ.ARID WHERE  ARJ.ARDate BETWEEN '" + text + "' AND '" + text2 + "'";
			if (customerIDs != "")
			{
				text3 = text3 + " AND ARP.CustomerID IN(" + customerIDs + ")";
			}
			if (fromCustomer != "")
			{
				text3 = text3 + " AND ARP.CustomerID>= '" + fromCustomer + "'";
			}
			if (toCustomer != "")
			{
				text3 = text3 + " AND ARP.CustomerID<= '" + toCustomer + "'";
			}
			text3 += "GROUP BY ARP.CustomerID,CUS.CustomerName,InvoiceVoucherID,ARJ.ARDate, ARJ.ARDueDate,ARP.CurrencyID,ARP.CurrencyRate,ARJ.Debit,Reference HAVING ARJ.Debit<> SUM(PaymentAmount)";
			DataSet dataSet6 = new DataSet();
			FillDataSet(dataSet6, "paymentallocationDetails", text3);
			dataSet.Merge(dataSet6);
			if (dataSet.Tables["yearDetails"].Rows.Count > 0)
			{
				dataSet.Relations.Add("CustomerYearlysales", dataSet.Tables["CustomerDetails"].Columns["CustomerID"], dataSet.Tables["yearDetails"].Columns["CustomerID"], createConstraints: false);
			}
			if (dataSet.Tables["monthDetails"].Rows.Count > 0)
			{
				dataSet.Relations.Add("CustomerMonthlysales", dataSet.Tables["CustomerDetails"].Columns["CustomerID"], dataSet.Tables["monthDetails"].Columns["CustomerID"], createConstraints: false);
			}
			if (dataSet.Tables["collateralDetails"].Rows.Count > 0)
			{
				dataSet.Relations.Add("Customercollateral", dataSet.Tables["CustomerDetails"].Columns["CustomerID"], dataSet.Tables["collateralDetails"].Columns["CustomerID"], createConstraints: false);
			}
			if (dataSet.Tables["bouncechequeDetails"].Rows.Count > 0)
			{
				dataSet.Relations.Add("Customerbouncecheque", dataSet.Tables["CustomerDetails"].Columns["CustomerID"], dataSet.Tables["bouncechequeDetails"].Columns["CustomerID"], createConstraints: false);
			}
			if (dataSet.Tables["paymentallocationDetails"].Rows.Count > 0)
			{
				dataSet.Relations.Add("Customerpaymentallocation", dataSet.Tables["CustomerDetails"].Columns["CustomerID"], dataSet.Tables["paymentallocationDetails"].Columns["CustomerID"], createConstraints: false);
			}
			return dataSet;
		}

		public DataSet GetCustomerStatement(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, bool isFC, bool showZeroBalance, bool isConsolidated, bool includeHold, bool onlyEmailMethod, bool showopenInvoices, string customerIDs)
		{
			try
			{
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				string text3 = "";
				string text4 = "0";
				if (isFC)
				{
					text3 = "FC";
					text4 = "ISNULL(CONAmountFC,0)";
				}
				string str = "SELECT DISTINCT CusTable.[Customer Code],StatementEmail,StatementSendingMethod,TermName,SUM([Opening Balance]) AS [Opening Balance],SUM([Ending Balance]) AS [Ending Balance], SUM(PDC) AS PDC,CUS2.CustomerName AS [Customer Name],AddressPrintFormat FROM \r\n                        (SELECT DISTINCT CASE WHEN '" + isConsolidated.ToString() + "' = 'False' THEN   ARJ.CustomerID   ELSE ISNULL(CUS.ParentCustomerID,CUS.CustomerID) END [Customer Code] ,PT.TermName\r\n\t\t\t\t\t\t \r\n                            ";
				if (customerIDs != "")
				{
					str += ", SUBSTRING((SELECT  DISTINCT ',' + TermName FROM Customer C INNER JOIN Payment_Term PT ON PT.PaymentTermID = C.PaymentTermID ";
					str = ((!isConsolidated) ? (str + "where  C.CustomerID  IN(" + customerIDs + ") FOR XML PATH('')),2,20000) AS TermName_Consolidated ") : (str + " where C.CustomerID IN(" + customerIDs + ") OR C.ParentCustomerID IN(" + customerIDs + ") FOR XML PATH('')),2,20000) AS TermName_Consolidated "));
				}
				if (fromCustomer != "")
				{
					str += ", SUBSTRING((SELECT  DISTINCT ',' + TermName FROM Customer C INNER JOIN Payment_Term PT ON PT.PaymentTermID = C.PaymentTermID ";
					str = ((!isConsolidated) ? (str + "where  C.CustomerID  BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' FOR XML PATH('')),2,20000) AS TermName_Consolidated ") : (str + " where C.CustomerID  BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' OR C.ParentCustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "'FOR XML PATH('')),2,20000) AS TermName_Consolidated "));
				}
				str = (isFC ? (str + " ,ISNULL((SELECT SUM(ISNULL(DebitFC,0) + ISNULL(ConDebitFC,0) - ISNULL(CreditFC,0) - ISNULL(ConCreditFC,0)) ") : (str + ", ISNULL((SELECT SUM(ISNULL(Debit,0)- ISNULL(Credit,0)) "));
				str = str + " FROM ARJournal ARJ2 \r\n                         WHERE ARJ.CustomerID=ARJ2.CustomerID AND ARJ2.ARDate<'" + text + "'  AND ISNULL(ISPDCRow,'False') = 'False'  AND ISNULL(IsVoid,'False')='False'),0)\r\n                        AS [Opening Balance], ";
				str = (isFC ? (str + " ISNULL((SELECT SUM(ISNULL(DebitFC,0) + ISNULL(ConDebitFC,0) - ISNULL(CreditFC,0) - ISNULL(ConCreditFC,0)) ") : (str + " ISNULL((SELECT SUM(ISNULL(Debit,0)- ISNULL(Credit,0)) "));
				str = str + "FROM ARJournal ARJ2 \r\n                         WHERE ARJ.CustomerID=ARJ2.CustomerID AND ARJ2.ARDate<='" + text2 + "'  AND ISNULL(ISPDCRow,'False') = 'False' AND ISNULL(IsVoid,'False')='False'),0)\r\n                        AS [Ending Balance],\r\n\r\n                        (SELECT ISNULL(SUM(ISNULL(Amount" + text3 + ",0) + " + text4 + "),0) AS PDC FROM Cheque_Received ChqRec WHERE Status IN (1,2,3,4,8) AND ISNULL(IsVoid,'False')='False'  \r\n                        AND ChqRec.PayeeType = 'C' AND ChqRec.PayeeID = ARJ.CustomerID      AND (DepositDate IS NULL OR Status IN (1,4,8) OR DepositDate > '" + text2 + "') AND ReceiptDate < '" + text2 + "') AS PDC\r\n\r\n                        FROM ARJournal ARJ INNER JOIN Customer CUS ON CUS.CustomerID  = ARJ.CustomerID\r\n                         \r\n                        LEFT OUTER JOIN Payment_Term PT ON CUS.PaymentTermID=PT.PaymentTermID\r\n                         WHERE ";
				str = str + " ARDate < '" + text2 + "' ";
				str += " AND ISNULL(IsVoid,'False')='False' ";
				if (customerIDs != "")
				{
					str += ", SUBSTRING((SELECT  DISTINCT ',' + TermName FROM Customer C INNER JOIN Payment_Term PT ON PT.PaymentTermID = C.PaymentTermID ";
					str = ((!isConsolidated) ? (str + "AND  ARJ.CustomerID  IN(" + customerIDs + ") FOR XML PATH('')),2,20000) AS TermName_Consolidated ") : (str + " AND (ARJ.CustomerID IN(" + customerIDs + ") OR C.ParentCustomerID IN(" + customerIDs + ") )"));
				}
				if (fromCustomer != "")
				{
					str = ((!isConsolidated) ? (str + " AND ARJ.CustomerID  BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ") : (str + " AND (ARJ.CustomerID  BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' OR CUS.ParentCustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "')"));
				}
				if (fromClass != "")
				{
					str = str + " AND CustomerClassID >= '" + fromClass + "' ";
				}
				if (toClass != "")
				{
					str = str + " AND CustomerClassID <= '" + toClass + "' ";
				}
				if (fromGroup != "")
				{
					str = str + " AND CustomerGroupID >= '" + fromGroup + "' ";
				}
				if (toGroup != "")
				{
					str = str + " AND CustomerGroupID <= '" + toGroup + "' ";
				}
				if (!includeHold)
				{
					str += " AND ISNULL(IsHold,'False') = 'False' ";
				}
				if (onlyEmailMethod)
				{
					str += " AND ISNULL(StatementSendingMethod, 0) = 1 ";
				}
				str += " ) AS CusTable ";
				str += "  INNER JOIN Customer CUS2 ON CUS2.CustomerID = CUSTable.[Customer Code]\r\n\t\t\t\t\t\tLEFT OUTER JOIN Customer_Address CA ON CA.CustomerID=CusTable.[Customer Code]  AND CA.AddressID='Primary'  ";
				if (!showZeroBalance)
				{
					str += " WHERE CusTable.[Ending Balance] <> 0 OR CusTable.PDC <>0 ";
				}
				str += " GROUP BY StatementSendingMethod,StatementEmail,CusTable.[Customer Code],Custable.TermName,CustomerName,AddressPrintFormat ORDER BY [Customer Code]";
				DataSet dataSet = new DataSet();
				FillDataSet(dataSet, "Case_Client", str);
				DataSet dataSet2 = new DataSet();
				if (!showopenInvoices)
				{
					str = "SELECT CASE WHEN '" + isConsolidated.ToString() + "' = 'False' THEN   ARJ.CustomerID   ELSE ISNULL(CUS.ParentCustomerID,CUS.CustomerID) END AS [Customer Code],\r\n                            SysDocType,'' AS [Doc Type], ARJ.SysDocID AS [Doc ID],VoucherID [Doc No],ARDate AS [Date],ARDueDate,\r\n                            (SELECT PONumber FROM Sales_Invoice WHERE SysDocID=ARJ.SysDocID AND VoucherID=ARJ.VoucherID) AS [PO Number],\r\n                            CASE WHEN '" + isConsolidated.ToString() + "' = 'False' THEN   NULL   ELSE ChildCus.CustomerID  END  AS ChildCode,\r\n                            CASE WHEN '" + isConsolidated.ToString() + "' = 'False' THEN   NULL   ELSE ChildCus.CustomerName  END  AS ChildName,\r\n                            ChequeNumber AS [Chq#],ChequeDate AS [Chq Date],Description,Reference,ARJ.CurrencyID,CurrencyRate,DebitFC,CreditFC,";
					str = ((!isFC) ? (str + " Debit, Credit ") : (str + " ISNULL(DebitFC,0) + ISNULL(ConDebitFC,0) AS Debit, ISNULL(CreditFC,0) +  ISNULL(ConCreditFC,0) AS Credit "));
					str = str + " FROM ARJournal ARJ LEFT OUTER JOIN System_Document SD ON ARJ.SysDocID=SD.SysDocID \r\n\t\t\t\t\t\t\tINNER JOIN Customer CUS ON CUS.CustomerID = ARJ.CustomerID \r\n                            LEFT OUTER JOIN Customer ChildCus ON ChildCus.CustomerID = CUS.CustomerID\r\n                            WHERE ARDate BETWEEN '" + text + "' AND '" + text2 + "' ";
					str += "  AND ISNULL(ISPDCRow,'False') = 'False' AND ISNULL(IsVoid,'False')='False' ";
				}
				else
				{
					str = "SELECT ARID,SysDocID [Doc ID],'' AS [Doc Type],VoucherID [Doc No],Reference,'' AS [PO Number],CustomerID AS [Customer Code],ARDate AS [Date],ARDueDate, CurrencyID,CurrencyRate,Unallocated AS Credit,'' AS Debit,Description,SysDocType FROM \r\n                            (SELECT ARJ.SysDocID,VoucherID,ISNULL(IsPDCRow,'False') AS IsPDC, ARJ.CustomerID,CustomerName,ARDate,ARDueDate,Description,CurrencyRate,Reference,SD.SysDocType,ISNULL(ARJ.CurrencyID,\r\n                            (SELECT CurrencyID FROM Currency WHERE IsBase='True')) AS CurrencyID, ARJ.ARID,\r\n                            ISNULL(ISNULL(CreditFC,Credit),0) -\r\n                            (SELECT ISNULL(SUM(ISNULL(Amount,0)),0) FROM Cheque_Received Chq\r\n                            WHERE ARJ.SysDocID=Chq.SysDocID AND ARJ.VoucherID=Chq.VoucherID AND ARJ.CustomerID = Chq.PayeeID AND Status = 9) -\r\n                            ISNULL((SELECT CASE WHEN CurrencyID IS NULL OR CurrencyID =(SELECT CurrencyID FROM Currency WHERE IsBase='True')\r\n                            THEN SUM(PaymentAmount) ELSE SUM(ISNULL(ISNULL(PaymentAmountFC,PaymentAmount),0)) END FROM AR_Payment_Allocation ARP\r\n                            WHERE ARJ.SysDocID=ARP.PaymentSysDocID AND ARJ.VoucherID=ARP.PaymentVoucherID AND ARJ.CustomerID = ARP.CustomerID AND ARJ.ARID = ARP.PaymentARID  GROUP BY CurrencyID),0)  AS Unallocated\r\n                            FROM ARJournal ARJ   LEFT OUTER JOIN System_Document SD ON ARJ.SysDocID = SD.SysDocID \r\n                            INNER JOIN Customer ON ARJ.CustomerID=Customer.CustomerID\r\n                            WHERE ISNULL(Credit,0)>0 AND ISNULL(IsVoid,'False')='False'   AND (SD.SysDocType IS NULL OR SD.SysDocType <> 7 AND ISNULL(ISPDCRow,'False') = 'False')\r\n                            AND (SELECT ISNULL(SUM(ISNULL(PaymentAmountFC,PaymentAmount)),0) FROM AR_Payment_Allocation PA\r\n                            WHERE PA.PaymentSysDocID=ARJ.SysDocID AND PA.PaymentVoucherID=ARJ.VoucherID  AND ARJ.CustomerID = PA.CustomerID AND ARJ.ARID = PA.PaymentARID)<ISNULL(ISNULL(CreditFC,Credit),0)) ALC\r\n                            WHERE Unallocated<>0 AND ARDate BETWEEN '" + text + "' AND '" + text2 + "'";
					str = str + " Union\r\n                            SELECT ARID,ARJ.SysDocID [Doc ID],'' AS [Doc Type],VoucherID,Reference,(SELECT PONumber FROM Sales_Invoice WHERE SysDocID=ARJ.SysDocID AND VoucherID=ARJ.VoucherID) AS [PO Number],CustomerID,ARDate,ARDueDate,--ISNULL(ISNULL(DebitFC,Debit),0) AS OriginalAmount,\r\n                            ISNULL(ARJ.CurrencyID,(SELECT CurrencyID FROM Currency WHERE IsBase='True')) AS CurrencyID,ARJ.CurrencyRate, '' AS Credit,\r\n                            ISNULL(ISNULL(ISNULL(DebitFC,Debit),0) -   \r\n                            (SELECT CASE WHEN ARJ.CurrencyID IS NULL  OR ARJ.CurrencyID=(SELECT CurrencyID FROM Currency WHERE IsBase='True') THEN SUM(ISNULL(PaymentAmount,0)+ISNULL(DiscountAmount,0)) \r\n                            ELSE SUM(ISNULL(PaymentAmountFC,0)+ISNULL(DiscountAmountFC,0)) END FROM AR_Payment_Allocation ARP\r\n                            WHERE ARJ.ARID = ARP.ARJournalID),ISNULL(ISNULL(DebitFC,Debit),0))  AS Debit,Description,SD.SysDocType\r\n                            FROM ARJournal ARJ    LEFT OUTER JOIN System_Document SD ON SD.SysDocID = ARJ.SysDocID\r\n                            WHERE ISNULL(Debit,0)>0 AND ARJ.ARDate BETWEEN '" + text + "' AND '" + text2 + "' AND ISNULL(IsVoid,'False')='False' AND ISNULL(SD.SysDocType,1) <> 12                     \r\n                            AND (SELECT CASE WHEN (ARJ.CurrencyID IS NULL OR ARJ.CurrencyID =(SELECT CurrencyID FROM Currency WHERE IsBase='True')) THEN \r\n                            ISNULL(SUM(ISNULL(PaymentAmount,0)+ISNULL(DiscountAmount,0)),0) ELSE  \r\n                            ISNULL(SUM(ISNULL(PaymentAmountFC,0)+ISNULL(DiscountAmountFC,0)),0) END FROM AR_Payment_Allocation PA\r\n                            WHERE ARJ.ARDate BETWEEN '" + text + "' AND '" + text2 + "' AND \r\n                            ARJ.ARID = PA.ARJournalID)<\r\n                            CASE WHEN (ARJ.CurrencyID IS NULL OR ARJ.CurrencyID = (SELECT CurrencyID FROM Currency WHERE IsBase='True') )\r\n                            THEN ISNULL(ISNULL(Debit,0),0) ELSE ISNULL(ISNULL(DebitFC,0),0) END ";
				}
				if (customerIDs != "")
				{
					str = ((!isConsolidated) ? (str + "where  ARJ.CustomerID  IN(" + customerIDs + ") ") : (str + " where (ARJ.CustomerID IN(" + customerIDs + ") OR C.ParentCustomerID IN(" + customerIDs + ") )"));
				}
				if (fromCustomer != "")
				{
					str = ((!isConsolidated) ? (str + " AND ARJ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ") : (str + " AND (ARJ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' OR CUS.ParentCustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "')"));
				}
				if (fromClass != "")
				{
					str = str + " AND ARJ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					str = str + " AND ARJ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				str += " ORDER BY Date";
				FillDataSet(dataSet2, "ARJournal", str);
				dataSet.Merge(dataSet2);
				dataSet.Relations.Add("Balance Detail", dataSet.Tables["Case_Client"].Columns["Customer Code"], dataSet.Tables["ARJournal"].Columns["Customer Code"], createConstraints: false);
				str = "SELECT SysDocID,VoucherID,CASE WHEN Status<>8 THEN ChequeNumber ELSE '(R)' + ChequeNumber END AS ChequeNumber,\r\n                        CASE WHEN '" + isConsolidated.ToString() + "' = 'False' THEN   PayeeID   ELSE ISNULL(CUS.ParentCustomerID,CUS.CustomerID) END AS [Customer Code],\r\n                        ChqRec.BankID,Bank.BankName,PayeeID,ChequeDate,ISNULL(Amount" + text3 + ",0) + " + text4 + " AS Amount\r\n                        FROM Cheque_Received ChqRec\r\n                        LEFT OUTER JOIN Bank ON Bank.BankID=ChqRec.BankID\r\n                        LEFT OUTER JOIN Customer CUS ON CUS.CustomerID = ChqRec.PayeeID\r\n                        WHERE Status IN (1,2,3,4,8) AND ISNULL(IsVoid,'False')='False'\r\n                         AND (DepositDate IS NULL OR Status IN (1,4,8) OR DepositDate > '" + text2 + "')\r\n                        AND ReceiptDate < '" + text2 + "'\r\n                        AND PayeeType='C' ";
				if (customerIDs != "")
				{
					str = ((!isConsolidated) ? (str + "AND  PayeeID  IN(" + customerIDs + ") ") : (str + " AND (PayeeID IN(" + customerIDs + ") OR CUS.ParentCustomerID IN(" + customerIDs + ") )"));
				}
				if (fromCustomer != "")
				{
					str = ((!isConsolidated) ? (str + " AND PayeeID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ") : (str + " AND (PayeeID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' OR CUS.ParentCustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "')"));
				}
				if (fromClass != "")
				{
					str = str + " AND PayeeID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					str = str + " AND PayeeID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				FillDataSet(dataSet, "Cheque_Received", str);
				dataSet.Relations.Add("PDCRel", dataSet.Tables["Case_Client"].Columns["Customer Code"], dataSet.Tables["Cheque_Received"].Columns["Customer Code"], createConstraints: false);
				DataSet customerAgingSummary = GetCustomerAgingSummary(fromCustomer, toCustomer, fromClass, toClass, fromGroup, toGroup, to, showZeroBalance: true, includeAgingTable: false, isFC, isConsolidated, "", "", customerIDs);
				customerAgingSummary.Tables[0].TableName = "Aging";
				dataSet.Merge(customerAgingSummary.Tables["Aging"]);
				dataSet.Relations.Add("Aging", dataSet.Tables["Case_Client"].Columns["Customer Code"], dataSet.Tables["Aging"].Columns["CustomerID"], createConstraints: false);
				dataSet.Tables.Add("StatementInfo");
				dataSet.Tables["StatementInfo"].Columns.Add("PeriodFrom", typeof(DateTime));
				dataSet.Tables["StatementInfo"].Columns.Add("PeriodTo", typeof(DateTime));
				dataSet.Tables["StatementInfo"].Rows.Add(from, to);
				return dataSet;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetCustomerAgingDetail(string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, DateTime asOfDate, bool showZeroBalance, string fromSalesperson, string toSalesperson, string customerIDs)
		{
			DateTime dateTime = DateTime.Today;
			bool.Parse(new CompanyOption(base.DBConfig).GetCompanyOptionValue(CompanyOptionsEnum.PDCByMaturity, true).ToString());
			if (asOfDate < DateTime.Today)
			{
				dateTime = asOfDate;
			}
			if (asOfDate == DateTime.MaxValue)
			{
				CommonLib.ToSqlDateTimeString(DateTime.Parse("1-1-2099"));
			}
			else
			{
				CommonLib.ToSqlDateTimeString(asOfDate);
			}
			bool.Parse(new CompanyOption(base.DBConfig).GetCompanyOptionValue(CompanyOptionsEnum.AgingByDueDate, true).ToString());
			DataSet dataSet = new DataSet();
			dataSet = new CompanyOption(base.DBConfig).GetCompanyOptionList(76, 107);
			DataSet customerAgingSummary = GetCustomerAgingSummary(fromCustomer, toCustomer, fromClass, toClass, fromGroup, toGroup, asOfDate, showZeroBalance, includeAgingTable: true, isFC: false, fromSalesperson, toSalesperson, customerIDs);
			if (customerAgingSummary.Tables.Contains("Aging"))
			{
				customerAgingSummary.Tables["Aging"].Columns.Add("Current", typeof(decimal));
				customerAgingSummary.Tables["Aging"].Columns.Add("Month1", typeof(decimal));
				customerAgingSummary.Tables["Aging"].Columns.Add("Month2", typeof(decimal));
				customerAgingSummary.Tables["Aging"].Columns.Add("Month3", typeof(decimal));
				customerAgingSummary.Tables["Aging"].Columns.Add("Month4", typeof(decimal));
				customerAgingSummary.Tables["Aging"].Columns.Add("Month5", typeof(decimal));
				customerAgingSummary.Tables["Aging"].Columns.Add("Month6", typeof(decimal));
				customerAgingSummary.Tables["Aging"].Columns.Add("Over", typeof(decimal));
				new DateTime(dateTime.Year, dateTime.Month, dateTime.Day, 23, 59, 59);
				DataHelper dataHelper = new DataHelper(base.DBConfig);
				bool companyOption = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.ShowAging1, defaultValue: true);
				bool companyOption2 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.ShowAging2, defaultValue: true);
				bool companyOption3 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.ShowAging3, defaultValue: true);
				bool companyOption4 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.ShowAging4, defaultValue: true);
				bool companyOption5 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.ShowAging5, defaultValue: true);
				bool companyOption6 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.ShowAging6, defaultValue: true);
				dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom0, 0);
				int companyOption7 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom1, 1);
				int companyOption8 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom2, 31);
				int companyOption9 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom3, 61);
				int companyOption10 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom4, 91);
				int companyOption11 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom5, 121);
				int companyOption12 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom6, 151);
				dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom7, 181);
				int companyOption13 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo0, 0);
				int companyOption14 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo1, 30);
				int companyOption15 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo2, 60);
				int companyOption16 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo3, 90);
				int companyOption17 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo4, 120);
				int companyOption18 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo5, 150);
				int companyOption19 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo6, 180);
				dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo7, 999);
				int num = 0;
				num = (companyOption6 ? companyOption19 : (companyOption5 ? companyOption18 : (companyOption4 ? companyOption17 : (companyOption3 ? companyOption16 : (companyOption2 ? companyOption15 : ((!companyOption) ? companyOption13 : companyOption14))))));
				decimal num2 = default(decimal);
				foreach (DataRow row in customerAgingSummary.Tables["Aging"].Rows)
				{
					if (row["AmountDue"] != DBNull.Value && decimal.Parse(row["AmountDue"].ToString()) > 0m)
					{
						decimal.Parse(row["AmountDue"].ToString());
						int num3 = int.Parse(row["Age"].ToString());
						if (num3 <= 0)
						{
							row["Current"] = row["AmountDue"];
						}
						else if (num3 >= companyOption7 && num3 <= companyOption14)
						{
							row["Month1"] = row["AmountDue"];
						}
						else if (num3 >= companyOption8 && num3 <= companyOption15)
						{
							row["Month2"] = row["AmountDue"];
						}
						else if (num3 >= companyOption9 && num3 <= companyOption16)
						{
							row["Month3"] = row["AmountDue"];
						}
						else if (num3 >= companyOption10 && num3 <= companyOption17)
						{
							row["Month4"] = row["AmountDue"];
						}
						else if (num3 >= companyOption11 && num3 <= companyOption18)
						{
							row["Month5"] = row["AmountDue"];
						}
						else if (num3 >= companyOption12 && num3 <= companyOption19)
						{
							row["Month6"] = row["AmountDue"];
						}
						if (num3 > num)
						{
							row["Over"] = row["AmountDue"];
						}
						if (num3 >= companyOption7)
						{
							num2 += decimal.Parse(row["AmountDue"].ToString());
						}
					}
				}
				DataRow[] array = customerAgingSummary.Tables["Aging"].Select(" AmountDue IS NOT NULL AND ISNULL(AmountDue,0) > 0");
				if (array.Length != 0)
				{
					DataSet dataSet2 = new DataSet();
					dataSet2.Merge(array);
					customerAgingSummary.Tables["Aging"].Rows.Clear();
					customerAgingSummary.Tables["Aging"].Merge(dataSet2.Tables[0]);
				}
			}
			return customerAgingSummary;
		}

		public DataSet GetCustomerAgingSummary(string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, DateTime asOfDate, bool showZeroBalance, bool isFC, string fromSalesperson, string toSalesperson, string customerIDs)
		{
			return GetCustomerAgingSummary(fromCustomer, toCustomer, fromClass, toClass, fromGroup, toGroup, asOfDate, showZeroBalance, includeAgingTable: false, isFC, isConsolidated: false, fromSalesperson, toSalesperson, customerIDs);
		}

		public DataSet GetCustomerAgingSummary(string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, DateTime asOfDate, bool showZeroBalance, bool includeAgingTable, bool isFC, string fromSalesperson, string toSalesperson, string customerIDs)
		{
			return GetCustomerAgingSummary(fromCustomer, toCustomer, fromClass, toClass, fromGroup, toGroup, asOfDate, showZeroBalance, includeAgingTable, isFC, isConsolidated: false, fromSalesperson, toSalesperson, customerIDs);
		}

		public DataSet GetCustomerAgingSummary(string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, DateTime asOfDate, bool showZeroBalance, bool includeAgingTable, bool isFC, bool isConsolidated, string fromSalesperson, string toSalesperson, string customerIDs)
		{
			try
			{
				DateTime d = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day, 23, 59, 59);
				bool flag = bool.Parse(new CompanyOption(base.DBConfig).GetCompanyOptionValue(CompanyOptionsEnum.PDCByMaturity, true).ToString());
				if (asOfDate < DateTime.Today)
				{
					d = asOfDate;
				}
				string text = (!(asOfDate == DateTime.MaxValue)) ? CommonLib.ToSqlDateTimeString(asOfDate) : CommonLib.ToSqlDateTimeString(DateTime.Parse("1-1-2099"));
				DataHelper dataHelper = new DataHelper(base.DBConfig);
				DataSet dataSet = new DataSet();
				dataSet = new CompanyOption(base.DBConfig).GetCompanyOptionList(76, 107);
				bool companyOption = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingByDueDate, defaultValue: true);
				DataSet dataSet2 = new DataSet();
				dataSet2 = new CompanyOption(base.DBConfig).GetCompanyOptionList(193, 194);
				bool companyOption2 = dataHelper.GetCompanyOption(dataSet2, CompanyOptionsEnum.AgingByEOMDueDate, defaultValue: false);
				string text2 = "";
				if (isFC)
				{
					text2 = "FC";
				}
				string text3 = "0";
				string text4 = "0";
				string text5 = "0";
				if (isFC)
				{
					text3 = "ISNULL(CONDebitFC,0)";
					text4 = "ISNULL(CONCreditFC,0)";
					text5 = "ISNULL(CONAmountFC,0)";
				}
				DataSet dataSet3 = new DataSet();
				string text6 = "SELECT Aging.CustomerID,CUS.CustomerName,SP.SalespersonID, SP.FullName AS SalesPerson, 0.00 AS CurrentBalance, 0.00 AS Month1, 0.00 AS Month2,0.00 AS Month3,0.00 AS Month4,0.00 AS Month5,0.00 AS Month6, 0.00 AS [Over], 0.0 AS Unallocated, SUM(Aging.Total) AS Total,SUM(ISNULL(PDC,0)) AS PDC, 0.00 AS NetOffPDC   FROM (\r\n                            SELECT CASE WHEN '" + isConsolidated.ToString() + "' = 'False' THEN   Cus.CustomerID   ELSE ISNULL(CUS.ParentCustomerID,CUS.CustomerID) END AS CustomerID , \r\n                            ISNULL((SELECT SUM(ISNULL(Debit" + text2 + ",0) + " + text3 + " - ISNULL(Credit" + text2 + " ,0) - " + text4 + ") FROM ARJournal ARJ WHERE   ARJ.CustomerID = Cus.CustomerID   \r\n                            AND ISNULL(ISPDCRow,'False') = 'False' AND ISNULL(IsVoid,'False')='False' AND ARJ.ARDate<='" + text + "'),0) AS Total,\r\n                            (Select SUM(ISNULL(Amount" + text2 + ",0) + " + text5 + ") FROM Cheque_Received CR WHERE Status IN(1,2,3,4,8) AND CR.PayeeType = 'C' AND    CR.PayeeID = CUS.CustomerID AND ISNULL(IsVoid,'False') = 'False'  AND (DepositDate IS NULL OR Status IN (1,4,8) OR DepositDate > '" + text + "') AND CR.ReceiptDate<='" + text + "') AS PDC \r\n                            FROM Customer Cus  WHERE 1=1 ";
				if (customerIDs != "")
				{
					text6 = ((!isConsolidated) ? (text6 + " AND CUS.CustomerID IN(" + customerIDs + ") ") : (text6 + "  AND ( CUS.CustomerID IN(" + customerIDs + ") OR CUS.ParentCustomerID IN(" + customerIDs + "))"));
				}
				if (fromCustomer != "")
				{
					text6 = ((!isConsolidated) ? (text6 + " AND Cus.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ") : (text6 + " AND (Cus.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' OR CUS.ParentCustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "')"));
				}
				if (fromClass != "")
				{
					text6 = text6 + " AND CustomerClassID >= '" + fromClass + "' ";
				}
				if (toClass != "")
				{
					text6 = text6 + " AND CustomerClassID <= '" + toClass + "' ";
				}
				if (fromGroup != "")
				{
					text6 = text6 + " AND CustomerGroupID >= '" + fromGroup + "' ";
				}
				if (toGroup != "")
				{
					text6 = text6 + " AND CustomerGroupID <= '" + toGroup + "' ";
				}
				if (fromSalesperson != "")
				{
					text6 = text6 + " AND Cus.SalesPersonID >= '" + fromSalesperson + "' ";
				}
				if (toSalesperson != "")
				{
					text6 = text6 + " AND Cus.SalesPersonID <= '" + toSalesperson + "' ";
				}
				text6 += ") Aging INNER JOIN Customer CUS ON CUS.CustomerID = Aging.CustomerID\r\n                            LEFT JOIN Salesperson SP ON CUS.SalesPersonID=SP.SalespersonID\r\n\t\t\t\t\t\t\tGROUP BY Aging.CustomerID,CUS.CustomerName,SP.FullName,SP.SalespersonID ORDER BY CustomerID,CustomerName";
				FillDataSet(dataSet3, "Case_Client", text6);
				text6 = " SELECT CASE WHEN '" + isConsolidated.ToString() + "' = 'False' THEN   Cus.CustomerID   ELSE ISNULL(CUS.ParentCustomerID,CUS.CustomerID) END AS CustomerID ,ARJ.SysDocID,VoucherID,Reference,ARDate,ARDueDate,ARJ.ARID, ";
				text6 = (companyOption ? (text6 + " DateDiff(Day,ISNULL(ARJ.ARDueDate,ARDate),'" + text + "') AS Age, ") : ((!companyOption2) ? (text6 + " DateDiff(Day,ARJ.ARDate,'" + text + "') AS Age, ") : (text6 + " DateDiff(Day,EOMONTH(ISNULL(ARJ.ARDueDate,ARDate)),'" + text + "') AS Age, ")));
				text6 = text6 + " ISNULL(Debit" + text2 + ",0) + " + text3 + " -   \r\n                                (SELECT ISNULL(SUM(ISNULL(PaymentAmount" + text2 + ",0) ";
				text6 = (isFC ? (text6 + ") ") : (text6 + " - ISNULL(RealizedGainLoss,0)) "));
				text6 = text6 + " ,0) FROM AR_Payment_Allocation ARP\r\n                                WHERE ARJ.ARID = ARP.ARJournalID  AND ARP.AllocationDate<='" + text + "')  AS AmountDue\r\n                                  FROM ARJournal ARJ   \r\n                                LEFT OUTER JOIN Customer CUS ON Cus.CustomerID = ARJ.CustomerID\r\n                                LEFT OUTER JOIN System_Document SD ON ARJ.SysDocID = SD.SysDocID\r\n                                WHERE ISNULL(Debit" + text2 + ",0) + " + text3 + ">0 AND ISNULL(IsVoid,'False')='False' AND ISNULL(SD.SysDocType,1) NOT IN ( 7 ,12) AND ARJ.ARDate <= '" + text + "'\r\n                                AND (SELECT ISNULL(SUM(ISNULL(PaymentAmount" + text2 + ",0) ";
				text6 = (isFC ? (text6 + ")") : (text6 + " - ISNULL(RealizedGainLoss,0))"));
				text6 = text6 + ",0) FROM AR_Payment_Allocation PA\r\n\t                                WHERE ARJ.ARID = PA.ARJournalID  AND PA.AllocationDate<='" + text + "' )<ISNULL(Debit" + text2 + " ,0) + " + text3 + " ";
				if (fromCustomer != "")
				{
					text6 = ((!isConsolidated) ? (text6 + " AND Cus.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ") : (text6 + " AND (Cus.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' OR CUS.ParentCustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "')"));
				}
				if (fromClass != "")
				{
					text6 = text6 + " AND CustomerClassID >= '" + fromClass + "' ";
				}
				if (toClass != "")
				{
					text6 = text6 + " AND CustomerClassID <= '" + toClass + "' ";
				}
				if (fromGroup != "")
				{
					text6 = text6 + " AND CustomerGroupID >= '" + fromGroup + "' ";
				}
				if (toGroup != "")
				{
					text6 = text6 + " AND CustomerGroupID <= '" + toGroup + "' ";
				}
				if (fromSalesperson != "")
				{
					text6 = text6 + " AND Cus.SalesPersonID >= '" + fromSalesperson + "' ";
				}
				if (toSalesperson != "")
				{
					text6 = text6 + " AND Cus.SalesPersonID <= '" + toSalesperson + "' ";
				}
				text6 = text6 + "           UNION\r\n\t     \r\n                                SELECT CASE WHEN '" + isConsolidated.ToString() + "' = 'False' THEN   ARJ.CustomerID   ELSE ISNULL(CUS.ParentCustomerID,CUS.CustomerID) END AS CustomerID,ARJ.SysDocID,VoucherID,Reference,ARDate, ARDueDate, ARJ.ARID,NULL AS Age,\r\n                                -1 *    ISNULL(Credit" + text2 + ",0) + " + text4 + " +  \r\n\t\t\t\t\t\t\t\t(SELECT ISNULL(SUM(ISNULL(Amount" + text2 + ",0) + " + text5 + "),0) FROM Cheque_Received Chq\r\n                                WHERE ARJ.SysDocID=Chq.SysDocID AND ARJ.VoucherID=Chq.VoucherID AND ARJ.CustomerID = Chq.PayeeID AND Status = 9)\r\n                                +\r\n                                (SELECT ISNULL(SUM(ISNULL(PaymentAmount" + text2 + ",0)),0) FROM AR_Payment_Allocation ARP\r\n                                WHERE ARJ.SysDocID=ARP.PaymentSysDocID AND ARJ.VoucherID=ARP.PaymentVoucherID AND ARJ.CustomerID = ARP.CustomerID  AND ARP.PaymentARID = ARJ.ARID  AND ARP.AllocationDate<='" + text + "')  AS Unallocated\r\n                                  FROM ARJournal ARJ  \r\n                                LEFT OUTER JOIN System_Document SD ON ARJ.SysDocID = SD.SysDocID\r\n                                INNER JOIN Customer CUS ON ARJ.CustomerID=CUS.CustomerID \r\n                                WHERE ISNULL(Credit" + text2 + ",0) + " + text4 + ">0 AND ISNULL(IsVoid,'False')='False'  AND ISNULL(SD.SysDocType,1)  NOT IN ( 7 ,12)  AND ARJ.ARDate <= '" + text + "'\r\n                                AND (SELECT ISNULL(SUM(ISNULL(PaymentAmount" + text2 + ",0)),0) FROM AR_Payment_Allocation PA\r\n\t                                WHERE PA.PaymentSysDocID=ARJ.SysDocID AND PA.PaymentVoucherID=ARJ.VoucherID AND PA.CustomerID = ARJ.CustomerID  AND PA.PaymentARID = ARJ.ARID  AND PA.AllocationDate<='" + text + "' )<ISNULL(ISNULL(Credit,0),0)  ";
				if (fromCustomer != "")
				{
					text6 = ((!isConsolidated) ? (text6 + " AND Cus.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ") : (text6 + " AND (Cus.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' OR CUS.ParentCustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "')"));
				}
				if (fromClass != "")
				{
					text6 = text6 + " AND CustomerClassID >= '" + fromClass + "' ";
				}
				if (toClass != "")
				{
					text6 = text6 + " AND CustomerClassID <= '" + toClass + "' ";
				}
				if (fromGroup != "")
				{
					text6 = text6 + " AND CustomerGroupID >= '" + fromGroup + "' ";
				}
				if (toGroup != "")
				{
					text6 = text6 + " AND CustomerGroupID <= '" + toGroup + "' ";
				}
				if (fromSalesperson != "")
				{
					text6 = text6 + " AND Cus.SalesPersonID >= '" + fromSalesperson + "' ";
				}
				if (toSalesperson != "")
				{
					text6 = text6 + " AND Cus.SalesPersonID <= '" + toSalesperson + "' ";
				}
				DataSet dataSet4 = new DataSet();
				FillDataSet(dataSet4, "Aging", text6);
				bool companyOption3 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.ShowAging1, defaultValue: true);
				bool companyOption4 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.ShowAging2, defaultValue: true);
				bool companyOption5 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.ShowAging3, defaultValue: true);
				bool companyOption6 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.ShowAging4, defaultValue: true);
				bool companyOption7 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.ShowAging5, defaultValue: true);
				bool companyOption8 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.ShowAging6, defaultValue: true);
				dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom0, 0);
				int companyOption9 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom1, 1);
				int companyOption10 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom2, 31);
				int companyOption11 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom3, 61);
				int companyOption12 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom4, 91);
				int companyOption13 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom5, 121);
				int companyOption14 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom6, 151);
				dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingFrom7, 181);
				int companyOption15 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo0, 0);
				int companyOption16 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo1, 30);
				int companyOption17 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo2, 60);
				int companyOption18 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo3, 90);
				int companyOption19 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo4, 120);
				int companyOption20 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo5, 150);
				int companyOption21 = dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo6, 180);
				dataHelper.GetCompanyOption(dataSet, CompanyOptionsEnum.AgingTo7, 999);
				int num = 1;
				int num2 = 0;
				if (companyOption8)
				{
					num = 6;
					num2 = companyOption21;
				}
				else if (companyOption7)
				{
					num = 5;
					num2 = companyOption20;
				}
				else if (companyOption6)
				{
					num = 4;
					num2 = companyOption19;
				}
				else if (companyOption5)
				{
					num = 3;
					num2 = companyOption18;
				}
				else if (companyOption4)
				{
					num = 2;
					num2 = companyOption17;
				}
				else if (companyOption3)
				{
					num = 1;
					num2 = companyOption16;
				}
				else
				{
					num = 0;
					num2 = companyOption15;
				}
				for (int i = 0; i < dataSet3.Tables["Case_Client"].Rows.Count; i++)
				{
					DataRow dataRow = dataSet3.Tables["Case_Client"].Rows[i];
					string str = dataRow["CaseClientID"].ToString();
					new DateTime(d.Year, d.Month, d.Day, 23, 59, 59);
					DataRow[] array = dataSet4.Tables["Aging"].Select("CustomerID = '" + str + "'");
					decimal num3 = default(decimal);
					decimal num4 = default(decimal);
					decimal num5 = default(decimal);
					decimal num6 = default(decimal);
					decimal num7 = default(decimal);
					decimal num8 = default(decimal);
					decimal num9 = default(decimal);
					decimal num10 = default(decimal);
					decimal num11 = default(decimal);
					decimal num12 = default(decimal);
					for (int j = 0; j < array.Length; j++)
					{
						DateTime d2 = DateTime.Parse(array[j]["ARDate"].ToString());
						if (companyOption && array[j]["ARDueDate"] != DBNull.Value)
						{
							d2 = DateTime.Parse(array[j]["ARDueDate"].ToString());
						}
						if (!companyOption)
						{
							d2 = d2.AddDays(companyOption15);
						}
						if (companyOption2 && array[j]["ARDueDate"] != DBNull.Value)
						{
							d2 = DateTime.Parse(array[j]["ARDueDate"].ToString());
							d2 = new DateTime(d2.Year, d2.Month, 1).AddMonths(1).AddDays(-1.0);
						}
						if (array[j]["AmountDue"] != DBNull.Value && decimal.Parse(array[j]["AmountDue"].ToString()) > 0m)
						{
							decimal.Parse(array[j]["AmountDue"].ToString());
							int num13 = (d - d2).Days - companyOption15;
							if (num13 <= 0)
							{
								num3 += decimal.Parse(array[j]["AmountDue"].ToString());
							}
							else if (num13 >= companyOption9 && num13 <= companyOption16)
							{
								num5 += decimal.Parse(array[j]["AmountDue"].ToString());
							}
							else if (num13 >= companyOption10 && num13 <= companyOption17)
							{
								num6 += decimal.Parse(array[j]["AmountDue"].ToString());
							}
							else if (num13 >= companyOption11 && num13 <= companyOption18)
							{
								num7 += decimal.Parse(array[j]["AmountDue"].ToString());
							}
							else if (num13 >= companyOption12 && num13 <= companyOption19)
							{
								num8 += decimal.Parse(array[j]["AmountDue"].ToString());
							}
							else if (num13 >= companyOption13 && num13 <= companyOption20)
							{
								num9 += decimal.Parse(array[j]["AmountDue"].ToString());
							}
							else if (num13 >= companyOption14 && num13 <= companyOption21)
							{
								num10 += decimal.Parse(array[j]["AmountDue"].ToString());
							}
							if (num13 > num2)
							{
								num4 += decimal.Parse(array[j]["AmountDue"].ToString());
							}
							if (num13 >= companyOption9)
							{
								num12 += decimal.Parse(array[j]["AmountDue"].ToString());
							}
						}
						else if (array[j]["AmountDue"] != DBNull.Value)
						{
							num11 += Math.Abs(decimal.Parse(array[j]["AmountDue"].ToString()));
						}
					}
					decimal result = default(decimal);
					decimal.TryParse(dataRow["Total"].ToString(), out result);
					dataRow["CurrentBalance"] = num3;
					dataRow["Month1"] = num5;
					dataRow["Month2"] = num6;
					dataRow["Month3"] = num7;
					dataRow["Month4"] = num8;
					dataRow["Month5"] = num9;
					dataRow["Month6"] = num10;
					dataRow["Over"] = num4;
					dataRow["Unallocated"] = num11;
					decimal result2 = default(decimal);
					decimal.TryParse(dataRow["PDC"].ToString(), out result2);
					if (flag)
					{
						dataRow["NetOffPDC"] = result - result2;
					}
					else
					{
						dataRow["NetOffPDC"] = result + result2;
					}
					if (!showZeroBalance && result == 0m && result2 == 0m)
					{
						dataSet3.Tables["Case_Client"].Rows.RemoveAt(i);
						i--;
					}
				}
				if (includeAgingTable)
				{
					dataSet3.Merge(dataSet4);
					dataSet3.Relations.Add("AgingRel", new DataColumn[1]
					{
						dataSet3.Tables["Customer"].Columns["CustomerID"]
					}, new DataColumn[1]
					{
						dataSet3.Tables["Aging"].Columns["CustomerID"]
					}, createConstraints: false);
				}
				for (int num14 = 6; num14 > num; num14--)
				{
					dataSet3.Tables["Case_Client"].Columns.Remove("Month" + num14.ToString());
				}
				return dataSet3;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetCustomerAgingBalanceList(bool showZeroBalance, bool isFC, bool inActive)
		{
			bool flag = bool.Parse(new CompanyOption(base.DBConfig).GetCompanyOptionValue(CompanyOptionsEnum.PDCByMaturity, true).ToString());
			string text = "";
			string baseCurrencyID = new Currencies(base.DBConfig).GetBaseCurrencyID();
			if (isFC)
			{
				text = "FC";
			}
			string text2 = "0";
			string text3 = "0";
			string text4 = "0";
			if (isFC)
			{
				text2 = "ISNULL(CONDebitFC,0)";
				text3 = "ISNULL(CONCreditFC,0)";
				text4 = "ISNULL(CONAmountFC,0)";
			}
			DataSet dataSet = new DataSet();
			string str = "SELECT * FROM (SELECT CUS.IsInactive I,'' AS F, CASE WHEN ISNULL(IsHold,'False')='True' THEN 'Hold' WHEN ISNULL(CUS.IsInactive,'False')='True' THEN 'Inactive' ELSE 'Active' END AS Status, Cus.CustomerID ,\r\n                            CASE WHEN  ShortName IS NULL OR ShortName = '' THEN  CustomerName ELSE CustomerName + ' [' + ShortName + ']' END AS CustomerName,";
			str = ((!isFC) ? (str + "'" + baseCurrencyID + "' AS CUR ") : (str + "ISNULL(Cus.CurrencyID,'" + baseCurrencyID + "') AS CUR "));
			str = str + ", 0.00 AS CurrentBalance, 0.00 AS Month1, 0.00 AS Month2,0.00 AS Month3,0.00 AS Month4,0.00 AS Month5,0.00 AS Month6,0.00 AS [Over], \r\n\r\n                              CASE WHEN CUS.CurrencyID IS NULL OR CUS.CurrencyID = '" + baseCurrencyID + "' THEN\r\n\t\t\t\t\t\t\t  ISNULL((SELECT SUM(ISNULL(Debit,0)- ISNULL(Credit ,0)) FROM ARJournal ARJ WHERE CUS.CustomerID=ARJ.CustomerID AND ISNULL(ISPDCRow,'False') = 'False' AND ISNULL(IsVoid,'False')='False'),0) ELSE\r\n\t\t\t\t\t\t\t   ISNULL((SELECT SUM(ISNULL(Debit" + text + " ,0)- ISNULL(Credit" + text + " ,0)) FROM ARJournal ARJ WHERE ";
			if (isFC)
			{
				str += " ARJ.CurrencyID = Cus.CurrencyID AND ";
			}
			str += "  CUS.CustomerID=ARJ.CustomerID AND  ISNULL(ISPDCRow,'False') = 'False' AND ISNULL(IsVoid,'False')='False'),0) ";
			if (isFC)
			{
				str = str + " + ISNULL((SELECT SUM(ISNULL(ConDebitFC ,0)- ISNULL(ConCreditFC ,0)) FROM ARJournal ARJ WHERE  ISNULL(ARJ.CurrencyID,'" + baseCurrencyID + "') <> Cus.CurrencyID AND  Cus.CustomerID=ARJ.CustomerID  AND ISNULL(ISPDCRow,'False') = 'False' AND ISNULL(IsVoid,'False')='False'),0) ";
			}
			str = str + " END  AS TotalBalance,\r\n\r\n                              0.0 AS Unallocated, 0.0 AS TotalDue,\r\n\t                          (Select CASE WHEN CUS.CurrencyID IS NULL OR CUS.CurrencyID = '" + baseCurrencyID + "' THEN SUM(Amount) ELSE SUM(ISNULL(AmountFC,0) + " + text4 + ") END FROM Cheque_Received CR WHERE Status IN (1,3,4,8) AND CR.PayeeType = 'C' AND CUS.CustomerID = CR.PayeeID  AND ISNULL(IsVoid,'False') = 'False') AS PDC ,\r\n                                (Select CASE WHEN CUS.CurrencyID IS NULL OR CUS.CurrencyID = '" + baseCurrencyID + "' THEN SUM(Amount) ELSE SUM(ISNULL(AmountFC,0) + " + text4 + ") END FROM Cheque_Received CR WHERE Status IN (8) AND CR.PayeeType = 'C' AND CUS.CustomerID = CR.PayeeID  AND ISNULL(IsVoid,'False') = 'False') AS Bounced,\r\n                                (SELECT SUM(AMOUNT)   from Collateral WHERE PayeeID=CUS.CustomerID AND ISNULL(IsReturned,'False')='False') AS [Security],\r\n                                0.00 AS NetOffPDC,\r\n\t                          CUS.PaymentTermID,PT.TermName,CUS.CreditAmount,\r\n                                (SELECT ISNULL(SUM(Amount),0) FROM CL_Voucher CLV WHERE ISNULL(CLV.IsVoid,'False' ) = 'False' \r\n                                AND CLV.CustomerID = CUS.CustomerID AND\r\n                                 ValidFrom <= GETDATE() AND ValidTo >=GetDate()) AS [Temp Credit]\r\n                               ,CUS.CreditReviewDate,CUS.CreditReviewBy,CUS.AcceptPDC,Rating,IsCustomerSince ,\r\n\r\n(SELECT DATEDIFF(Day,  Max(ARDate),GetDate())  FROM ARJournal ARj INNER JOIN System_Document SD ON SD.SysDocID = ARJ.SysDocID WHERE ARJ.CustomerID = CUS.CustomerID AND SD.SysDocType IN (25,26,51,48)) AS LastSale,\r\n\r\n\r\n(SELECT DATEDIFF(Day,  Max(ARDate),GetDate()) FROM ARJournal ARj INNER JOIN System_Document SD ON SD.SysDocID = ARJ.SysDocID WHERE ARJ.CustomerID = CUS.CustomerID AND SD.SysDocType IN (2,3,7,65)) AS LastPayment,\r\n\r\n                                CUS.SalesPersonID + '-'+ SP.FullName AS Salesperson, CON.CountryName Country,Area.AreaName Area,CLS.ClassName Class,\r\n\t                          CollectionUserID [Collection User],CA.ContactName,CA.ContactTitle,CA.Email,CA.Mobile,CA.Phone1,CA.Phone2,CA.Fax,CA.PostalCode,\r\n                                (SELECT (cast(CC.CategoryName as varchar(200))+', ') as [text()] FROM Entity_Category_Detail ccd INNER JOIN Entity_Category CC ON CC.CategoryID=CCD.CategoryID\r\n                                  WHERE ccd.EntityID = cus.CustomerID AND CCD.EntityType = 1 order by ccd.CategoryID for XML PATH('')) as Categories,CUS.InsStatus,CUS.InsuranceID AS [InsuranceID],Cus.InsApprovedAmount, InsRemarks,CollectionRemarks,'' AS FollowUp, CUS.LicenseExpDate\r\n\r\n                              FROM Customer Cus\r\n                              LEFT OUTER JOIN Area ON Area.AreaID = CUS.AreaID\r\n                              LEFT OUTER JOIN Country CON ON CON.CountryID = CUS.CountryID\r\n                              LEFT OUTER JOIN Customer_Class CLS ON CLS.ClassID = CUS.CustomerClassID\r\n                              LEFT OUTER JOIN Payment_Term PT ON Cus.PaymentTermID=PT.PaymentTermID\r\n                              LEFT OUTER JOIN Customer_Address CA ON CA.CustomerID = CUS.CustomerID AND CA.AddressID = 'PRIMARY'\r\n                              LEFT OUTER JOIN Salesperson SP ON SP.SalespersonID = CUS.SalesPersonID WHERE 1=1";
			if (inActive)
			{
				str += " AND ISNULL(Cus.IsInactive,'false') = 'True' ";
			}
			str += ") AS Customer  WHERE 1 = 1 ";
			if (!showZeroBalance)
			{
				str += " AND (ISNULL(PDC,0)<>0 OR ISNULL(TotalBalance,0) <> 0 )";
			}
			str += " ORDER BY CustomerID,CustomerName";
			FillDataSet(dataSet, "Case_Client", str);
			str = " SELECT ARID, ARJ.CustomerID,ARDate,ARDueDate,\r\n                                CASE WHEN Cus.CurrencyID IS NULL OR Cus.CurrencyID = '" + baseCurrencyID + "' THEN\r\n                                  ISNULL(Debit,0) -   \r\n                                (SELECT ISNULL(SUM(ISNULL(PaymentAmount,0)-ISNULL(RealizedGainLoss,0)),0) FROM AR_Payment_Allocation ARP WHERE ARJ.ARID = ARP.ARJournalID)  ELSE \r\n                                ISNULL(Debit" + text + ",0)  + " + text2 + " -  (SELECT ISNULL(SUM(ISNULL(PaymentAmount" + text + ",0)-ISNULL(RealizedGainLoss,0)),0) FROM AR_Payment_Allocation ARP WHERE ARJ.ARID = ARP.ARJournalID)\tEND\t AS AmountDue\r\n                                  FROM ARJournal ARJ   \r\n                                LEFT OUTER JOIN System_Document SD ON ARJ.SysDocID = SD.SysDocID\r\n                                INNER JOIN Customer Cus ON Cus.CustomerID = ARJ.CustomerID\r\n                                WHERE ISNULL(Debit,0)>0 AND ISNULL(IsVoid,'False')='False' AND  ISNULL(SD.SysDocType,1) NOT IN ( 7 ,12)\r\n                                AND (SELECT CASE WHEN Cus.CurrencyID IS NULL OR Cus.CurrencyID = '" + baseCurrencyID + "' THEN ISNULL(SUM(ISNULL(PaymentAmount,0)-ISNULL(RealizedGainLoss,0)),0) ELSE\r\n                                 ISNULL(SUM(ISNULL(PaymentAmount" + text + ",0)),0) END   FROM AR_Payment_Allocation PA\r\n\t                                WHERE ARJ.ARID = PA.ARJournalID)< (CASE WHEN Cus.CurrencyID IS NULL OR Cus.CurrencyID = '" + baseCurrencyID + "' THEN ISNULL(Debit,0) ELSE  ISNULL(Debit" + text + ",0) + " + text2 + " END) ";
			if (isFC)
			{
				str = str + " AND ISNULL(ARJ.CurrencyID,'" + baseCurrencyID + "') =  ISNULL(Cus.CurrencyID,'" + baseCurrencyID + "') ";
			}
			str = str + "               UNION\r\n\t     \r\n                            SELECT ARID, ARJ.CustomerID,ARDate, ARDueDate, \r\n                                -1 *    CASE WHEN Cus.CurrencyID IS NULL OR Cus.CurrencyID = '" + baseCurrencyID + "' THEN ISNULL(Credit,0) ELSE ISNULL(Credit" + text + ",0) + " + text3 + " END    \r\n                                +\r\n\t\t\t\t\t\t\t\t(SELECT ISNULL(SUM(ISNULL(Amount,0)),0) FROM Cheque_Received Chq\r\n                                WHERE ARJ.SysDocID=Chq.SysDocID AND ARJ.VoucherID=Chq.VoucherID AND ARJ.CustomerID = Chq.PayeeID AND Status = 9)\r\n                                +\r\n                                (SELECT CASE WHEN Cus.CurrencyID IS NULL OR Cus.CurrencyID = '" + baseCurrencyID + "' THEN ISNULL(SUM(ISNULL(PaymentAmount,0)),0) ELSE ISNULL(SUM(ISNULL(PaymentAmount" + text + ",0)),0) END FROM AR_Payment_Allocation ARP\r\n                                WHERE ARJ.SysDocID=ARP.PaymentSysDocID AND ARJ.VoucherID=ARP.PaymentVoucherID  AND ARJ.ARID = ARP.PaymentARID AND ARJ.CustomerID = ARP.CustomerID)  AS Unallocated\r\n                                  FROM ARJournal ARJ   \r\n                                LEFT OUTER JOIN System_Document SD ON ARJ.SysDocID = SD.SysDocID\r\n                                INNER JOIN Customer CUS ON ARJ.CustomerID=Cus.CustomerID\r\n                                WHERE CASE WHEN Cus.CurrencyID IS NULL OR Cus.CurrencyID = '" + baseCurrencyID + "' THEN  ISNULL(Credit,0) ELSE ISNULL(Credit" + text + ",0) + " + text3 + " END > 0 AND ISNULL(IsVoid,'False')='False'  AND ISNULL(SD.SysDocType,1)  NOT IN ( 7 ,12) \r\n                                  AND (SELECT CASE WHEN Cus.CurrencyID IS NULL OR Cus.CurrencyID = '" + baseCurrencyID + "' THEN  ISNULL(SUM(ISNULL(PaymentAmount,0)),0) ELSE  ISNULL(SUM(ISNULL(PaymentAmount" + text + ",0)),0) END FROM AR_Payment_Allocation PA\r\n\t                                WHERE PA.PaymentSysDocID=ARJ.SysDocID AND PA.PaymentVoucherID=ARJ.VoucherID  AND PA.PaymentARID= ARJ.ARID AND PA.CustomerID = ARJ.CustomerID)< CASE WHEN Cus.CurrencyID IS NULL OR Cus.CurrencyID = '" + baseCurrencyID + "' THEN  ISNULL(ISNULL(Credit,0),0) ELSE  ISNULL(ISNULL(Credit" + text + ",0)+  " + text2 + ",0) END ";
			DataSet dataSet2 = new DataSet();
			FillDataSet(dataSet2, "Aging", str);
			DataHelper dataHelper = new DataHelper(base.DBConfig);
			DataSet dataSet3 = new DataSet();
			dataSet3 = new CompanyOption(base.DBConfig).GetCompanyOptionList(76, 107);
			bool companyOption = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingByDueDate, defaultValue: true);
			DataSet dataSet4 = new DataSet();
			dataSet4 = new CompanyOption(base.DBConfig).GetCompanyOptionList(193, 194);
			bool companyOption2 = dataHelper.GetCompanyOption(dataSet4, CompanyOptionsEnum.AgingByEOMDueDate, defaultValue: false);
			bool companyOption3 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.ShowAging1, defaultValue: true);
			bool companyOption4 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.ShowAging2, defaultValue: true);
			bool companyOption5 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.ShowAging3, defaultValue: true);
			bool companyOption6 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.ShowAging4, defaultValue: true);
			bool companyOption7 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.ShowAging5, defaultValue: true);
			bool companyOption8 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.ShowAging6, defaultValue: true);
			dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingFrom0, 0);
			int companyOption9 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingFrom1, 1);
			int companyOption10 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingFrom2, 31);
			int companyOption11 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingFrom3, 61);
			int companyOption12 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingFrom4, 91);
			int companyOption13 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingFrom5, 121);
			int companyOption14 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingFrom6, 151);
			dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingFrom7, 181);
			int companyOption15 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingTo0, 0);
			int companyOption16 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingTo1, 30);
			int companyOption17 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingTo2, 60);
			int companyOption18 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingTo3, 90);
			int companyOption19 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingTo4, 120);
			int companyOption20 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingTo5, 150);
			int companyOption21 = dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingTo6, 180);
			dataHelper.GetCompanyOption(dataSet3, CompanyOptionsEnum.AgingTo7, 999);
			int num = 1;
			int num2 = 0;
			if (companyOption8)
			{
				num = 6;
				num2 = companyOption21;
			}
			else if (companyOption7)
			{
				num = 5;
				num2 = companyOption20;
			}
			else if (companyOption6)
			{
				num = 4;
				num2 = companyOption19;
			}
			else if (companyOption5)
			{
				num = 3;
				num2 = companyOption18;
			}
			else if (companyOption4)
			{
				num = 2;
				num2 = companyOption17;
			}
			else if (companyOption3)
			{
				num = 1;
				num2 = companyOption16;
			}
			else
			{
				num = 0;
				num2 = companyOption15;
			}
			for (int i = 0; i < dataSet.Tables["Case_Client"].Rows.Count; i++)
			{
				DataRow dataRow = dataSet.Tables["Case_Client"].Rows[i];
				string str2 = dataRow["CaseClientID"].ToString();
				_ = DateTime.Today;
				new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day, 23, 59, 59);
				DataRow[] array = dataSet2.Tables["Aging"].Select("CustomerID = '" + str2 + "'");
				decimal num3 = default(decimal);
				decimal num4 = default(decimal);
				decimal num5 = default(decimal);
				decimal num6 = default(decimal);
				decimal num7 = default(decimal);
				decimal num8 = default(decimal);
				decimal num9 = default(decimal);
				decimal num10 = default(decimal);
				decimal num11 = default(decimal);
				decimal d = default(decimal);
				for (int j = 0; j < array.Length; j++)
				{
					DateTime d2 = DateTime.Parse(array[j]["ARDate"].ToString());
					if (companyOption && array[j]["ARDueDate"] != DBNull.Value)
					{
						d2 = DateTime.Parse(array[j]["ARDueDate"].ToString());
					}
					else if (!companyOption)
					{
						d2 = d2.AddDays(companyOption15);
					}
					if (companyOption2 && array[j]["ARDueDate"] != DBNull.Value)
					{
						d2 = DateTime.Parse(array[j]["ARDueDate"].ToString());
						d2 = new DateTime(d2.Year, d2.Month, 1).AddMonths(1).AddDays(-1.0);
					}
					if (array[j]["AmountDue"] != DBNull.Value && decimal.Parse(array[j]["AmountDue"].ToString()) > 0m)
					{
						decimal.Parse(array[j]["AmountDue"].ToString());
						int num12 = (DateTime.Today - d2).Days - companyOption15;
						if (num12 <= 0)
						{
							num3 += decimal.Parse(array[j]["AmountDue"].ToString());
						}
						else if (num12 >= companyOption9 && num12 <= companyOption16)
						{
							num5 += decimal.Parse(array[j]["AmountDue"].ToString());
						}
						else if (num12 >= companyOption10 && num12 <= companyOption17)
						{
							num6 += decimal.Parse(array[j]["AmountDue"].ToString());
						}
						else if (num12 >= companyOption11 && num12 <= companyOption18)
						{
							num7 += decimal.Parse(array[j]["AmountDue"].ToString());
						}
						else if (num12 >= companyOption12 && num12 <= companyOption19)
						{
							num8 += decimal.Parse(array[j]["AmountDue"].ToString());
						}
						else if (num12 >= companyOption13 && num12 <= companyOption20)
						{
							num9 += decimal.Parse(array[j]["AmountDue"].ToString());
						}
						else if (num12 >= companyOption14 && num12 <= companyOption21)
						{
							num10 += decimal.Parse(array[j]["AmountDue"].ToString());
						}
						if (num12 > num2)
						{
							num4 += decimal.Parse(array[j]["AmountDue"].ToString());
						}
						if (num12 >= companyOption9)
						{
							d += decimal.Parse(array[j]["AmountDue"].ToString());
						}
					}
					else if (array[j]["AmountDue"] != DBNull.Value)
					{
						num11 += Math.Abs(decimal.Parse(array[j]["AmountDue"].ToString()));
					}
				}
				decimal result = default(decimal);
				decimal.TryParse(dataRow["TotalBalance"].ToString(), out result);
				dataRow["CurrentBalance"] = num3;
				dataRow["Month1"] = num5;
				dataRow["Month2"] = num6;
				dataRow["Month3"] = num7;
				dataRow["Month4"] = num8;
				dataRow["Month5"] = num9;
				dataRow["Month6"] = num10;
				dataRow["Over"] = num4;
				dataRow["Unallocated"] = num11;
				if (d - num11 > 0m)
				{
					dataRow["TotalDue"] = d - num11;
				}
				else
				{
					dataRow["TotalDue"] = 0;
				}
				decimal result2 = default(decimal);
				decimal.TryParse(dataRow["PDC"].ToString(), out result2);
				if (flag)
				{
					dataRow["NetOffPDC"] = result - result2;
				}
				else
				{
					dataRow["NetOffPDC"] = result + result2;
				}
				if (!showZeroBalance && result == 0m && result2 == 0m)
				{
					dataSet.Tables["Case_Client"].Rows.RemoveAt(i);
					i--;
				}
			}
			for (int num13 = 6; num13 > num; num13--)
			{
				dataSet.Tables["Case_Client"].Columns.Remove("Month" + num13.ToString());
			}
			DataSet entityAssignedFlagsList = new EntityFlag(base.DBConfig).GetEntityAssignedFlagsList(EntityTypesEnum.Customers);
			dataSet.Merge(entityAssignedFlagsList);
			return dataSet;
		}

		public DataSet GetPOSCustomerList()
		{
			DataSet dataSet = new DataSet();
			string textCommand = "SELECT CustomerID [Customer Code],CustomerName [Customer Name] FROM Customer \r\n                             WHERE ((CustomerClassID IS NULL OR CustomerClassID IN (SELECT ClassID FROM Customer_Class WHERE ISNULL(HasPOSAccess,'True')='True')) AND ISNULL(IsInactive,'False')='False')  \r\n                                    AND (ISNULL(Customer.POSHidden,'False') = 'False')";
			FillDataSet(dataSet, "Case_Client", textCommand);
			return dataSet;
		}

		public CaseClientData GetCustomerParentChildRelation(string parentID)
		{
			CaseClientData caseClientData = new CaseClientData();
			string str = "SELECT DISTINCT ARJ.CustomerID, CustomerName, ParentCustomerID,\r\n\t\t\t\t            ISNULL(\r\n\t\t\t\t                (SELECT SUM(ISNULL(Debit,0)- ISNULL(Credit,0))  + ISNULL(\r\n\t\t\t\t\t                (SELECT SUM(ISNULL(RealizedGainLoss,0)) \r\n\t\t\t\t\t                FROM AR_Payment_Allocation ARP WHERE ARP.CustomerID=ARJ.CustomerID),0)  \r\n\t\t\t\t\t             FROM ARJournal ARJ2 \r\n\t\t\t\t                 WHERE ARJ.CustomerID=ARJ2.CustomerID AND ISNULL(ISPDCRow,'False') = 'False' \r\n                                 AND ISNULL(IsVoid,'False')='False'),0) AS [Balance]\r\n\r\n                        FROM ARJournal ARJ INNER JOIN Customer ON ARJ.CustomerID=Customer.CustomerID\r\n                        WHERE  ISNULL(IsVoid,'False')='False' AND ISNULL(ISPDCRow,'False') = 'False' ";
			str = str + " AND ParentCustomerID = '" + parentID + "' ";
			str += " ORDER BY ARJ.CustomerID ";
			FillDataSet(caseClientData, "Case_Client", str);
			return caseClientData;
		}

		public DataSet GetTopCustomers(DateTime from, DateTime to, int count)
		{
			DataSet dataSet = new DataSet();
			string text = CommonLib.ToSqlDateTimeString(from);
			string text2 = CommonLib.ToSqlDateTimeString(to);
			string textCommand = "SELECT TOP " + count.ToString() + " CUS.CustomerID Code,CustomerName Name,SUM(Total-Discount) AS Sales \r\n                                    FROM Sales_Invoice SI\r\n                                    INNER JOIN Customer CUS ON CUS.CustomerID=SI.CustomerID\r\n                                    WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'\r\n                                    GROUP BY CUS.CustomerName ,CUS.CustomerID\r\n                                    HAVING SUM(Total-Discount)>0\r\n                                    ORDER BY Sales DESC";
			FillDataSet(dataSet, "Case_Client", textCommand);
			return dataSet;
		}

		public DataSet GetTopSalesperson(DateTime from, DateTime to, int count)
		{
			DataSet dataSet = new DataSet();
			string text = CommonLib.ToSqlDateTimeString(from);
			string text2 = CommonLib.ToSqlDateTimeString(to);
			string textCommand = "SELECT TOP " + count.ToString() + " ISNULL(SP.FullName,'None') AS Salesperson,SUM(Total-Discount) AS Sales \r\n                                    FROM Sales_Invoice SI \r\n\t\t\t\t\t\t\t\t\tINNER JOIN Salesperson SP ON SP.SalespersonID = SI.SalespersonID\r\n                                    WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'\r\n                                    GROUP BY FullName\r\n                                    HAVING SUM(Total-Discount)>0\r\n                                    ORDER BY Sales DESC";
			FillDataSet(dataSet, "Case_Client", textCommand);
			return dataSet;
		}

		public DataSet GetSalesHistory(DateTime from, DateTime to)
		{
			try
			{
				DataSet dataSet = new DataSet();
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				base.DBConfig.StartNewTransaction();
				string textCommand = "  SELECT 25 AS [Type], SysDocID [Doc ID],VoucherID [Doc Number],SI.CustomerID ,Cus.CustomerName,TransactionDate [Date],S.SalespersonID,S.FullName AS [Salesperson Name],Reference,Total\r\n                                    FROM Sales_Invoice SI\r\n\t\t\t\t\t\t\t        INNER JOIN Customer CUS ON Cus.customerID = SI.CustomerID\r\n\t\t\t\t\t\t\t        LEFT OUTER JOIN Salesperson S ON S.SalespersonID = SI.SalespersonID\r\n                                    WHERE  TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'  AND ISNULL(IsVoid,'False')='False'\r\n                            \r\n\r\n\r\n                                    UNION \r\n\r\n                                    SELECT 46 AS [Type], SysDocID  [Doc ID],VoucherID  [Doc Number],SI.CustomerID,Cus.CustomerName,TransactionDate [Date],S.SalespersonID,S.FullName AS [Salesperson Name],Reference,Total\r\n                                    FROM Sales_POS SI\r\n\t\t\t\t\t\t\t        INNER JOIN Customer CUS ON Cus.customerID = SI.CustomerID\r\n\t\t\t\t\t\t\t        LEFT OUTER JOIN Salesperson S ON S.SalespersonID = SI.SalespersonID\r\n                                    WHERE  TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'  AND ISNULL(IsVoid,'False')='False'\r\n                         \r\n \r\n                                     UNION \r\n\r\n                                    SELECT 27 AS [Type], SysDocID [Doc ID],VoucherID  [Doc Number],SI.CustomerID,Cus.CustomerName,TransactionDate [Date],S.SalespersonID,S.FullName AS [Salesperson Name],Reference,-1 *Total AS Total\r\n                                    FROM Sales_Return SI\r\n\t\t\t\t\t\t\t        INNER JOIN Customer CUS ON Cus.customerID = SI.CustomerID\r\n\t\t\t\t\t\t\t        LEFT OUTER JOIN Salesperson S ON S.SalespersonID = SI.SalespersonID\r\n                                    WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'  AND ISNULL(IsVoid,'False')='False' ORDER BY [Date]";
				FillDataSet(dataSet, "Sales", textCommand);
				textCommand = "SELECT DET.SysDocID,DET.VoucherID,RowIndex,ProductID,Description,LocationID, Quantity,UnitPrice,Amount\r\n\t\t\t\t\t\t\tFROM Sales_Invoice_Detail DET\r\n\t\t\t\t\t\t\tINNER JOIN Sales_Invoice SI ON SI.SysDocID = DET.SysDocID AND SI.VoucherID = DET.VoucherID\r\n                            WHERE  TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'  AND ISNULL(IsVoid,'False')='False'\r\n                            \r\n                            UNION \r\n\r\n                            SELECT DET.SysDocID,DET.VoucherID,RowIndex,ProductID,Description,LocationID, Quantity,UnitPrice,Amount\r\n                            FROM Sales_POS_Detail DET\r\n\t\t\t\t\t\t\tINNER JOIN Sales_POS SI ON SI.SysDocID = DET.SysDocID AND SI.VoucherID = DET.VoucherID\r\n                            WHERE  TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'  AND ISNULL(IsVoid,'False')='False'\r\n \r\n                             UNION \r\n\r\n                            SELECT DET.SysDocID,DET.VoucherID,RowIndex,ProductID,Description,LocationID, Quantity,UnitPrice,(-1 * Quantity * UnitPrice) AS Amount\r\n                            FROM Sales_Return_Detail DET\r\n\t\t\t\t\t\t\tINNER JOIN Sales_Return SI ON SI.SysDocID = DET.SysDocID AND SI.VoucherID = DET.VoucherID\r\n                            WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "'  AND ISNULL(IsVoid,'False')='False'\r\n \t\t\t\t\t        ORDER BY RowIndex ";
				FillDataSet(dataSet, "SalesDetails", textCommand);
				dataSet.Relations.Add("Rel", new DataColumn[2]
				{
					dataSet.Tables["Sales"].Columns["Doc ID"],
					dataSet.Tables["Sales"].Columns["Doc Number"]
				}, new DataColumn[2]
				{
					dataSet.Tables["SalesDetails"].Columns["SysDocID"],
					dataSet.Tables["SalesDetails"].Columns["VoucherID"]
				}, createConstraints: true);
				return dataSet;
			}
			catch
			{
				throw;
			}
			finally
			{
				base.DBConfig.EndTransaction(result: false);
			}
		}

		public DataSet GetMonthlySalesReport(DateTime from, DateTime to)
		{
			try
			{
				DataSet dataSet = new DataSet();
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				base.DBConfig.StartNewTransaction();
				string textCommand = " SELECT * INTO Temp_Sale FROM\r\n                            (\r\n                            SELECT DatePart(Month,TransactionDate) AS M,SUM(Total) Total \r\n                            FROM Sales_Invoice\r\n                            WHERE DATEPART(Year,TransactionDate) = DATEPART(Year,GetDate())  AND TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' AND ISNULL(IsVoid,'False')='False'\r\n                            Group BY DatePart(Month,TransactionDate)\r\n\r\n                            UNION\r\n\r\n                            SELECT DatePart(Month,TransactionDate) AS M,SUM(Total) Total \r\n                            FROM ConsignOut_Settlement\r\n                            WHERE DATEPART(Year,TransactionDate) = DATEPART(Year,GetDate())  AND TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' AND ISNULL(IsVoid,'False')='False'\r\n                            Group BY DatePart(Month,TransactionDate)\r\n\r\n                            UNION \r\n\r\n                            SELECT   DatePart(Month,TransactionDate) AS M,SUM(Total) Total\r\n\r\n                            FROM Sales_POS\r\n                            WHERE DATEPART(Year,TransactionDate) = DATEPART(Year,GetDate())  AND TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' AND ISNULL(IsVoid,'False')='False'\r\n                            Group BY DatePart(Month,TransactionDate)\r\n \r\n                             UNION \r\n\r\n                             SELECT   DatePart(Month,TransactionDate) AS M, SUM(-1 * Total) Total\r\n\r\n                            FROM Sales_Return\r\n                            WHERE DATEPART(Year,TransactionDate) = DATEPART(Year,GetDate())  AND TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' AND ISNULL(IsVoid,'False')='False'\r\n                            Group BY DatePart(Month,TransactionDate)\r\n \r\n                             UNION \r\n\r\n                            SELECT DatePart(Month,TransactionDate) AS M,SUM(Total) Total\r\n                            FROM Sales_Receipt\r\n                            WHERE DATEPART(Year,TransactionDate) = DATEPART(Year,GetDate())  AND TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' AND ISNULL(IsVoid,'False')='False'\r\n                            Group BY DatePart(Month,TransactionDate)\r\n                            ) as TMP\r\n\r\n\r\n\r\n                            SELECT M,'Name' AS [Month], SUM(Total) AS Sale FROM Temp_Sale\r\n                            GROUP BY M\r\n                            ORDER BY M\r\n\r\n                            DROP Table Temp_Sale";
				FillDataSet(dataSet, "Sales", textCommand);
				if (dataSet != null && dataSet.Tables.Count > 0)
				{
					DataHelper dataHelper = new DataHelper(base.DBConfig);
					foreach (DataRow row in dataSet.Tables[0].Rows)
					{
						row["Month"] = dataHelper.GetMonthNameAbr(int.Parse(row["M"].ToString()));
					}
					dataSet.Tables[0].Columns.Remove("M");
				}
				return dataSet;
			}
			catch
			{
				throw;
			}
			finally
			{
				base.DBConfig.EndTransaction(result: false);
			}
		}

		public DataSet GetTopInvoicesReport(DateTime from, DateTime to, int count)
		{
			try
			{
				DataSet dataSet = new DataSet();
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				SqlTransaction sqlTransaction = base.DBConfig.StartNewTransaction();
				string textCommand = " SELECT * INTO Temp_Sale FROM\r\n                                (\r\n                                SELECT TOP " + count.ToString() + " Cus.CustomerName, Total  \r\n                                FROM Sales_Invoice SI INNER JOIN Customer CUS ON SI.CustomerID = CUS.CustomerID\r\n                                WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' AND ISNULL(IsVoid,'False')='False'\r\n                                 ORDER BY Total DESC\r\n\r\n                                UNION \r\n\r\n                                SELECT TOP " + count.ToString() + " Cus.CustomerName, Total  \r\n                                FROM Sales_POS SI INNER JOIN Customer CUS ON SI.CustomerID = CUS.CustomerID\r\n                                WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' AND ISNULL(IsVoid,'False')='False'\r\n                                 ORDER BY Total DESC\r\n \r\n                                 UNION\r\n \r\n                                SELECT TOP " + count.ToString() + " Cus.CustomerName, Total  \r\n                                FROM Sales_Receipt SI INNER JOIN Customer CUS ON SI.CustomerID = CUS.CustomerID\r\n                                WHERE TransactionDate BETWEEN '" + text + "' AND '" + text2 + "' AND ISNULL(IsVoid,'False')='False'\r\n                                 ORDER BY Total DESC\r\n                                 ) AS Sales\r\n\r\n                                SELECT TOP " + count.ToString() + " CustomerName, Total FROM Temp_Sale\r\n \r\n                                DROP Table Temp_Sale";
				FillDataSet(dataSet, "Sales", textCommand, sqlTransaction);
				return dataSet;
			}
			catch
			{
				throw;
			}
			finally
			{
				base.DBConfig.EndTransaction(result: false);
			}
		}

		internal DateTime CalculateDueDate(DateTime invoiceDate, string customerID, SqlTransaction sqlTransaction)
		{
			DateTime result = invoiceDate;
			DataSet dataSet = new DataSet();
			if (customerID != "")
			{
				string textCommand = "SELECT * FROM Payment_Term\r\n                                WHERE PaymentTermID IN (Select PaymentTermID FROM Customer WHERE CustomerID = '" + customerID + "')";
				FillDataSet(dataSet, "Term", textCommand, sqlTransaction);
				if (dataSet == null || dataSet.Tables.Count == 0 || dataSet.Tables["Term"].Rows.Count == 0)
				{
					return result;
				}
				DataRow dataRow = dataSet.Tables["Term"].Rows[0];
				int result2 = 0;
				int.TryParse(dataRow["TermType"].ToString(), out result2);
				PaymentTermTypes paymentTermTypes = (PaymentTermTypes)result2;
				int num = int.Parse(dataRow["NetDays"].ToString());
				switch (paymentTermTypes)
				{
				case PaymentTermTypes.FromInvoiceDate:
					result = invoiceDate.AddDays(num);
					break;
				case PaymentTermTypes.FromEOM:
					result = new DateTime(invoiceDate.Year, invoiceDate.Month, 1).AddMonths(1).AddDays(-1.0).AddDays(num);
					break;
				default:
					result = invoiceDate.AddDays(num);
					break;
				}
			}
			return result;
		}

		public bool SetFlag(string customerID, byte flagID)
		{
			try
			{
				string exp = (flagID <= 0) ? ("UPDATE Customer SET Flag = NULL WHERE CustomerID = '" + customerID + "'") : ("UPDATE Customer SET Flag = " + flagID + " WHERE CustomerID = '" + customerID + "'");
				return ExecuteNonQuery(exp) > 0;
			}
			catch
			{
				throw;
			}
		}

		public bool UpdateDueDates(string fromCustomerID, string toCustomerID)
		{
			bool result = true;
			try
			{
				string text = "select ARID,ARJ.CustomerID,SysDocID,VoucherID,ARDate,ARDueDate ,CUS.PaymentTermID,PT.TermType,PT.NetDays AS TermDays\r\n                                FROM ARJournal ARJ INNER JOIN Customer CUS ON CUS.CUstomerID = ARJ.CustomerID \r\n                                INNER JOIN Payment_Term PT ON PT.PaymentTermID = CUS.PaymentTermID\r\n                                WHERE Debit IS NOT NULL AND Credit IS NULL AND ARID NOT IN (SELECT ARJournalID FROM AR_Payment_Allocation) ";
				if (fromCustomerID != "")
				{
					text = text + " AND ARJ.CustomerID BETWEEN '" + fromCustomerID + "' AND '" + toCustomerID + "'";
				}
				DataSet dataSet = new DataSet();
				FillDataSet(dataSet, "ARJournal", text);
				foreach (DataRow row in dataSet.Tables["ARJournal"].Rows)
				{
					DateTime invoiceDate = DateTime.Parse(row["ARDate"].ToString());
					string paymentTermID = row["PaymentTermID"].ToString();
					PaymentTermTypes termType = PaymentTermTypes.FromInvoiceDate;
					if (!row["TermType"].IsDBNullOrEmpty())
					{
						termType = (PaymentTermTypes)int.Parse(row["TermType"].ToString());
					}
					int termDays = 0;
					if (!row["TermDays"].IsDBNullOrEmpty())
					{
						termDays = int.Parse(row["TermDays"].ToString());
					}
					DateTime dateTime = CalculateDueDate(invoiceDate, paymentTermID, termType, termDays);
					row["ARDueDate"] = dateTime;
				}
				updateCommand = new SqlCommand("", base.DBConfig.Connection);
				updateCommand.CommandType = CommandType.Text;
				string commandText = "UPDATE ARJournal SET ARDueDate = @ARDueDate WHERE ARID = @ARID ";
				updateCommand.Transaction = base.DBConfig.StartNewTransaction();
				updateCommand.CommandText = commandText;
				updateCommand.Parameters.Add("@ARDueDate", SqlDbType.DateTime, 18, "ARDueDate");
				updateCommand.Parameters.Add("@ARID", SqlDbType.Int, 18, "ARID");
				result = Update(dataSet, "ARJournal", updateCommand);
				return result;
			}
			catch
			{
				result = false;
				throw;
			}
			finally
			{
				base.DBConfig.EndTransaction(result);
			}
		}

		private DateTime CalculateDueDate(DateTime invoiceDate, string paymentTermID, PaymentTermTypes termType, int termDays)
		{
			DateTime result = invoiceDate.AddMonths(1);
			if (paymentTermID != "")
			{
				switch (termType)
				{
				case PaymentTermTypes.FromInvoiceDate:
					result = invoiceDate.AddDays(termDays);
					break;
				case PaymentTermTypes.FromEOM:
					result = new DateTime(invoiceDate.Year, invoiceDate.Month, 1).AddMonths(1).AddDays(-1.0).AddDays(termDays);
					break;
				default:
					result = invoiceDate.AddDays(termDays);
					break;
				}
			}
			return result;
		}

		public DataSet GetDailySalesReport(int year, int month)
		{
			try
			{
				DataSet dataSet = new DataSet();
				SqlTransaction sqlTransaction = base.DBConfig.StartNewTransaction();
				string textCommand = " SELECT DatePart(Day,TransactionDate) AS D,SUM(Total) AS Amount FROM Sales_Invoice\r\n                                WHERE ISNULL(IsVoid,'False') = 'False' AND DatePart(MONTH,TransactionDate) = " + month + " AND DatePart(Year,TransactionDate) = " + year + "\r\n                                GROUP BY DatePart(Day,TransactionDate)\r\n\r\n\r\n                                UNION\r\n\r\n                                SELECT DatePart(Day,TransactionDate) AS D,SUM(Total) AS Amount FROM Sales_POS\r\n                                WHERE ISNULL(IsVoid,'False') = 'False' AND DatePart(MONTH,TransactionDate) = " + month + " AND DatePart(Year,TransactionDate) = " + year + "\r\n                                GROUP BY DatePart(Day,TransactionDate)\r\n                                ORDER BY D";
				FillDataSet(dataSet, "Sales", textCommand, sqlTransaction);
				return dataSet;
			}
			catch
			{
				throw;
			}
			finally
			{
				base.DBConfig.EndTransaction(result: false);
			}
		}

		public bool HasBalance(string customerID)
		{
			try
			{
				DataSet customerSnapBalance = GetCustomerSnapBalance(customerID, DateTime.Now);
				decimal result = default(decimal);
				decimal result2 = default(decimal);
				if (customerSnapBalance == null || customerSnapBalance.Tables[0].Rows.Count == 0)
				{
					return false;
				}
				decimal.TryParse(customerSnapBalance.Tables[0].Rows[0]["Balance"].ToString(), out result);
				decimal.TryParse(customerSnapBalance.Tables[0].Rows[0]["PDCAmount"].ToString(), out result2);
				if (result2 != 0m || result != 0m)
				{
					return true;
				}
				return false;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetCustomerSnapBalance(string customerID, DateTime transactionDate)
		{
			try
			{
				DataSet dataSet = new DataSet();
				string text = CommonLib.ToSqlDateTimeString(new DateTime(transactionDate.Year, transactionDate.Month, transactionDate.Day));
				string text2 = CommonLib.ToSqlDateTimeString(new DateTime(transactionDate.Year, transactionDate.Month, transactionDate.Day, 23, 59, 59));
				string textCommand = "  SELECT DISTINCT CUS.CustomerID,CustomerName,CreditAmount,IsInactive,IsHold,CreditLimitType,ParentCustomerID,\r\n                            (SELECT SUM((DND.Quantity - ISNULL(DND.QuantityReturned,0)) * CASE WHEN ISNULL(P.StandardCost,0)=0 THEN P.AverageCost ELSE (CASE WHEN P.StandardCost<>0 THEN P.StandardCost ELSE DND.UnitPrice END) END) AS Amount\r\n                            FROM Delivery_Note_Detail DND INNER JOIN Delivery_Note DN ON DN.SysDocID = DND.SysDocID AND DN.VoucherID = DND.VoucherID\r\n                            INNER JOIN Product P ON P.ProductID = DND.ProductID\r\n                            WHERE ISNULL(IsInvoiced,'False')= 'False' AND ISNULL(DN.ISVoid,'False')='False' AND DN.CustomerID = CUS.CustomerID ) AS OpenDNAmount, \r\n                            (SELECT SUM(Amount) FROM CL_Voucher CLV WHERE CLV.CustomerID = CUS.CustomerID AND ISNULL(IsVoid,'False')='False' AND ValidFrom <= '" + text + "' AND ValidTo >= '" + text2 + "') AS TempCL,\r\n                              ISNULL((SELECT  SUM(ISNULL(Debit,0)- ISNULL(Credit,0))  FROM ARJournal \r\n\t                              WHERE CustomerID = CUS.CustomerID and ISNULL(isvoid,'False') = 'False' AND ISNULL(IsPDCRow,'False') = 'False'),0) +\r\n\t\t\t\t\t\t\t\t   ISNULL((SELECT  SUM(ISNULL(Debit,0)- ISNULL(Credit,0)) AS Balance FROM ARJournal  WHERE CustomerID IN \r\n\t\t\t\t\t\t\t\t (Select CustomerID FROM Customer WHERE ParentCustomerID = CUS.CustomerID)  and ISNULL(isvoid,'False') = 'False' AND ISNULL(IsPDCRow,'False') = 'False'),0) AS Balance,\r\n                                 ISNULL((SELECT SUM(ISNULL(AmountFC,Amount)) AS Amount FROM Cheque_Received ChqRec\r\n                                 WHERE Status IN (1,3,4,8) AND ISNULL(IsVoid,'False')='False' AND PayeeType='C' AND PayeeID = CUS.CustomerID),0) + \r\n\t\t\t\t\t\t\t\t ISNULL((SELECT SUM(ISNULL(AmountFC,Amount)) AS Amount FROM Cheque_Received ChqRec\r\n                                 WHERE Status IN (1,3,4,8) AND ISNULL(IsVoid,'False')='False' AND PayeeType='C' AND PayeeID IN (Select CustomerID FROM Customer WHERE ParentCustomerID = CUS.CustomerID)),0)  AS PDCAmount,\r\n                                 AcceptCheckPayment,AcceptPDC,CUS.CurrencyID \r\n                                 FROM  Customer CUS  WHERE CUS.CustomerID = '" + customerID + "'  \r\n\t                             GROUP BY CUS.CustomerID,CUS.ParentCustomerID,CustomerName,CreditAmount,IsInactive,IsHold,AcceptCheckPayment,AcceptPDC,CUS.CurrencyID ,CreditLimitType";
				FillDataSet(dataSet, "Customer", textCommand);
				return dataSet;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetInventorySalesDetail(DateTime from, DateTime to, string productID)
		{
			return GetInventorySalesDetail(from, to, isCategory: false, productID);
		}

		public DataSet GetInventorySalesDetailByCategory(DateTime from, DateTime to, string productID)
		{
			return GetInventorySalesDetail(from, to, isCategory: true, productID);
		}

		internal DataSet GetInventorySalesDetail(DateTime from, DateTime to, bool isCategory, string productID)
		{
			try
			{
				DataSet dataSet = new DataSet();
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				string text3 = " SELECT * INTO #TMP  FROM Axo_Sales_Detail ASD   WHERE Date BETWEEN '" + text + "' AND '" + text2 + "' ";
				text3 = ((!isCategory) ? (text3 + " AND (ASD.ProductID LIKE '" + productID + "' OR ASD.Description LIKE '" + productID + "')") : (text3 + " AND ASD.ProductID IN (SELECT ProductID FROM Product WHERE CategoryID = '" + productID + "') "));
				text3 = text3 + "  SELECT ASD.* ,P.Description AS ProductDescription,SP.FullName AS [Salesperson Name],CUS.CustomerName,   P.CategoryID,PC.CategoryName AS Category \r\n                                            FROM #TMP AS ASD\r\n                                         INNER JOIN Product P ON P.ProductID = ASD.ProductID\r\n                                          INNER JOIN Customer CUS ON CUS.CUstomerID = ASD.CustomerID\r\n\t\t\t\t\t\t\t\t\t\t  LEFT OUTER JOIN Product_Category PC ON PC.CategoryID = P.CategoryID\r\n\t\t\t\t\t\t\t\t\t\t  LEFT OUTER JOIN Salesperson SP ON SP.SalespersonID = ASD.SalespersonID\r\n                                            WHERE Date BETWEEN '" + text + "' AND '" + text2 + "' ";
				text3 = ((!isCategory) ? (text3 + " AND (ASD.ProductID LIKE '" + productID + "')") : (text3 + " AND P.CategoryID = '" + productID + "'"));
				text3 += " DROP Table #TMP ";
				FillDataSet(dataSet, "Sales", text3);
				text3 = "  SELECT X.AvgPrice,X.AvgCost,X.Volume, Convert(Date,TransactionDate) AS  PriceDate\r\n                          FROM (SELECT   Convert(date,IT.Date) AS TransactionDate,ABS(SUM(Quantity)) AS Volume, CASE WHEN SUM(Quantity) = 0 THEN 0 ELSE  ROUND(sum(Quantity * UnitPrice)/SUM(Quantity),2) END as AvgPrice,\r\n\t\t                          CASE WHEN SUM(Quantity) = 0 THEN 0 ELSE   ROUND(SUM(Quantity * IT.AverageCost)/SUM(Quantity),2) END as AvgCost\r\n                                  FROM Axo_Sales_Detail IT WHERE   IT.Date BETWEEN '" + text + "' AND '" + text2 + "' ";
				text3 = ((!isCategory) ? (text3 + " AND (productid LIKE '" + productID + "')") : (text3 + " AND ProductID IN (SELECT ProductID FROM Product WHERE CategoryID = '" + productID + "') "));
				text3 += " GROUP BY Convert(Date,IT.Date)) X  ORDER BY PriceDate  ";
				FillDataSet(dataSet, "Price", text3);
				return dataSet;
			}
			catch
			{
				throw;
			}
			finally
			{
				base.DBConfig.EndTransaction(result: false);
			}
		}

		public DataSet GetCustomerSalesDetail(DateTime from, DateTime to, string customerID)
		{
			return GetCustomerSalesDetail(from, to, isClass: false, customerID);
		}

		internal DataSet GetCustomerSalesDetail(DateTime from, DateTime to, bool isClass, string customerID)
		{
			try
			{
				DataSet dataSet = new DataSet();
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				string str = " SELECT * INTO #TMP  FROM Axo_Sales_Detail ASD   WHERE Date BETWEEN '" + text + "' AND '" + text2 + "' ";
				str = ((!isClass) ? (str + " AND ASD.CustomerID LIKE '" + customerID + "' ") : (str + " AND ASD.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID = '" + customerID + "') "));
				str = str + "  SELECT ASD.* ,P.Description AS ProductDescription,SP.FullName AS [Salesperson Name],CUS.CustomerName,   P.CategoryID,PC.CategoryName AS Category \r\n                                            FROM #TMP AS ASD\r\n                                         INNER JOIN Product P ON P.ProductID = ASD.ProductID\r\n                                          INNER JOIN Customer CUS ON CUS.CUstomerID = ASD.CustomerID\r\n\t\t\t\t\t\t\t\t\t\t  LEFT OUTER JOIN Product_Category PC ON PC.CategoryID = P.CategoryID\r\n\t\t\t\t\t\t\t\t\t\t  LEFT OUTER JOIN Salesperson SP ON SP.SalespersonID = ASD.SalespersonID\r\n                                            WHERE Date BETWEEN '" + text + "' AND '" + text2 + "' ";
				str = ((!isClass) ? (str + " AND ASD.CustomerID LIKE '" + customerID + "' ") : (str + " AND CUS.CustomerClassID = '" + customerID + "'"));
				str += " DROP Table #TMP ";
				FillDataSet(dataSet, "Sales", str);
				return dataSet;
			}
			catch
			{
				throw;
			}
			finally
			{
				base.DBConfig.EndTransaction(result: false);
			}
		}

		public DataSet GetInventorySalesItemDetail(string customerID, string productID)
		{
			try
			{
				DataSet dataSet = new DataSet();
				string str = "select TOP 3 CONVERT(VARCHAR(10), SI.TransactionDate, 110)as Date,SI.SysDocID,SI.VoucherID,CustomerName,SID.Quantity,SID.UnitID ,SID.UnitPrice  From Sales_Invoice SI\r\n                      INNER JOIN Sales_Invoice_Detail SID ON SI.SysDocID=SID.SysDocID and SI.VoucherID=SID.VoucherID \r\n\t\t\t\t\t  INNER JOIN Customer C ON C.CustomerID=SI.CustomerID\r\n\t\t\t\t\t  WHERE SID.ProductID LIKE '" + productID + "'";
				if (customerID != "")
				{
					str = str + " AND SI.CustomerID='" + customerID + "' ";
				}
				str += " ORDER BY SI.TransactionDate DESC";
				FillDataSet(dataSet, "SalesItem", str);
				if (customerID == "")
				{
					dataSet.Clear();
					str = "select TOP 5 CONVERT(VARCHAR(10), SI.TransactionDate, 110)as Date,SI.SysDocID,SI.VoucherID,CustomerName,SID.Quantity,SID.UnitID ,SID.UnitPrice  From Sales_Invoice SI\r\n                      INNER JOIN Sales_Invoice_Detail SID ON SI.SysDocID=SID.SysDocID and SI.VoucherID=SID.VoucherID \r\n\t\t\t\t\t  INNER JOIN Customer C ON C.CustomerID=SI.CustomerID\r\n\t\t\t\t\t  WHERE SID.ProductID LIKE '" + productID + "'";
					str += " ORDER BY SI.TransactionDate DESC";
					FillDataSet(dataSet, "SalesItem", str);
				}
				if (productID == "")
				{
					dataSet.Clear();
					str = "select TOP 5 CONVERT(VARCHAR(10), SI.TransactionDate, 110)as Date,SI.SysDocID,SI.VoucherID,CustomerName,SID.Quantity,SID.UnitID ,SID.UnitPrice  From Sales_Invoice SI\r\n                      INNER JOIN Sales_Invoice_Detail SID ON SI.SysDocID=SID.SysDocID and SI.VoucherID=SID.VoucherID \r\n\t\t\t\t\t  INNER JOIN Customer C ON C.CustomerID=SI.CustomerID\r\n\t\t\t\t\t  WHERE SI.CustomerID LIKE '" + customerID + "'";
					str += " ORDER BY SI.TransactionDate DESC";
					FillDataSet(dataSet, "SalesItem", str);
				}
				return dataSet;
			}
			catch
			{
				throw;
			}
			finally
			{
				base.DBConfig.EndTransaction(result: false);
			}
		}

		public DataSet GetCustomerOutstandingInvoicesDetailReport(DateTime reportDate, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, bool showZeroBalance, bool isFC, string customerIDs)
		{
			try
			{
				string text = CommonLib.ToSqlDateTimeString(reportDate);
				string str = "\tSELECT DISTINCT ARJ.CustomerID   ,CustomerName   , Customer.CurrencyID, Customer.PaymentTermID,PT.TermName,SP.SalesPersonID,SP.FullName [SalesPerson],\r\n                     \r\n                            ( SELECT SUM(ISNULL(Debit,0)- ISNULL(Credit,0))\r\n\t                            FROM ARJournal ARJ3\r\n                             WHERE ARJ.CustomerID=ARJ3.CustomerID \r\n                             AND ISNULL(ISPDCRow,'False') = 'False'  AND ISNULL(IsVoid,'False')='False'  AND ARDate <= '" + text + "') AS EndingBalance,\r\n\r\n                              SUM(ISNULL(Credit,0)) - (SELECT ISNULL(SUM(ISNULL(PaymentAmount,0)),0) FROM AR_Payment_Allocation ARP\r\n                                WHERE ARJ.CustomerID = ARP.CustomerID  AND AllocationDate <= '" + text + "')  AS Unallocated\r\n\r\n                        FROM ARJournal ARJ LEFT OUTER JOIN System_Document SD ON ARJ.SysDocID = SD.SysDocID INNER JOIN Customer ON ARJ.CustomerID=Customer.CustomerID \r\n                        LEFT OUTER JOIN Payment_Term PT ON Customer.PaymentTermID =PT.PaymentTermID \r\n                        LEFT OUTER JOIN Salesperson SP on Customer.SalesPersonID=SP.SalespersonID\r\n                        WHERE ISNULL(SD.SysDocType,1) NOT IN(7,12) AND  ISNULL(IsVoid,'False') = 'False' ";
				str = str + " AND ARDate < '" + text + "' ";
				if (customerIDs != "")
				{
					str = str + " AND ARJ.CustomerID IN(" + customerIDs + ")";
				}
				if (fromCustomer != "")
				{
					str = str + " AND ARJ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
				}
				if (fromClass != "")
				{
					str = str + " AND CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "' ";
				}
				if (fromGroup != "")
				{
					str = str + " AND CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "' ";
				}
				str += " GROUP BY ARJ.CustomerID,CustomerName,Customer.CurrencyID,Customer.PaymentTermID,PT.TermName,SP.SalesPersonID,SP.FullName";
				if (!showZeroBalance)
				{
					str = str + " HAVING ( SELECT SUM(ISNULL(Debit,0)- ISNULL(Credit,0))\r\n\t                            FROM ARJournal ARJ3\r\n                             WHERE ARJ.CustomerID=ARJ3.CustomerID \r\n                             AND ISNULL(IsVoid,'False')='False' AND ISNULL(ISPDCRow,'False') = 'False'  AND ARDate <= '" + text + "') > 0 OR \r\n                                SUM(ISNULL(Credit,0)) - (SELECT ISNULL(SUM(ISNULL(PaymentAmount,0)),0) FROM AR_Payment_Allocation ARP\r\n                                WHERE ARJ.CustomerID = ARP.CustomerID  AND AllocationDate <= '" + text + "' )>0 ";
				}
				str += " ORDER BY ARJ.CustomerID";
				DataSet dataSet = new DataSet();
				FillDataSet(dataSet, "Case_Client", str);
				str = "\tSELECT ARID JournalID,CustomerID,ARJ.ARDate,ARJ.SysDocID,ARJ.VoucherID,ARJ.Description,ARJ.Reference, ISNULL(ISNULL(DebitFC,Debit),0) AS Amount,\r\n                            ISNULL((SELECT CASE WHEN ARJ.CurrencyID IS NULL  OR ARJ.CurrencyID=(SELECT CurrencyID FROM Currency WHERE IsBase='True') \r\n                            THEN SUM(ISNULL(PaymentAmount,0)+ISNULL(DiscountAmount,0)) ELSE SUM(ISNULL(PaymentAmountFC,0)+ISNULL(DiscountAmountFC,0)) \r\n                            END FROM AR_Payment_Allocation ARP WHERE ARJ.ARID = ARP.ARJournalID  AND AllocationDate <='" + text + "'),0)  AS PaidAmount,\r\n                            (SELECT SUM(PaymentAmount) FROM AR_Payment_Allocation ARP1 WHERE ARP1.InvoiceSysDocID=ARJ.SysDocID AND ARP1.InvoiceVoucherID=ARJ.VoucherID \r\n                            AND ISNULL((SELECT IsPDCRow FROM ARJournal WHERE SysDocID=ARP1.PaymentSysDocID AND VoucherID=ARP1.PaymentVoucherID AND ISNULL(ISPDCRow,'False')='True'),'False') = 'True' ) AS PDC\r\n                            FROM ARJournal ARJ  LEFT OUTER JOIN System_Document SD ON SD.SysDocID = ARJ.SysDocID \r\n                            WHERE ISNULL(ARJ.Debit,0)>0 AND ISNULL(ARJ.IsVoid,'False')='False'  AND ISNULL(SD.SysDocType,1) <> 12  AND ISNULL(ISPDCRow,'False') = 'False' ";
				str = str + " AND ARJ.ARDate <= '" + text + "' ";
				if (customerIDs != "")
				{
					str = str + " AND ARJ.CustomerID IN(" + customerIDs + ")";
				}
				if (fromCustomer != "")
				{
					str = str + " AND ARJ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ";
				}
				if (fromClass != "")
				{
					str = str + " AND ARJ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					str = str + " AND ARJ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				FillDataSet(dataSet, "InvoicesDetail", str);
				dataSet.Relations.Add("OutstandingInvoicesDetail", dataSet.Tables["Case_Client"].Columns["CustomerID"], dataSet.Tables["InvoicesDetail"].Columns["CustomerID"], createConstraints: false);
				return dataSet;
			}
			catch
			{
				throw;
			}
		}

		public DataSet GetCustomerLeadsComboList()
		{
			DataSet dataSet = new DataSet();
			string textCommand = "(SELECT CustomerID [Code],CustomerName [Name],REPLACE(CustomerID,' ','') + REPLACE(CustomerName,' ','')   AS SearchColumn,'Customer' AS EntityType,1 AS EntityEnum,ISNULL(CurrencyID,(SELECT CurrencyID FROM Currency WHERE IsBase='True')) AS CurrencyID,AllowConsignment, ISNULL(IsHold,'False') AS IsHold,\r\n\t\t\t\t\t\t        PriceLevelID, Balance, ParentCustomerID, PaymentTermID , PaymentMethodID, ShippingMethodID,BillToAddressID, ShipToAddressID, SalesPersonID, IsWeightInvoice, CustomerClassID,\r\n                                (SELECT COUNT(*) FROM Customer C2 WHERE C2.ParentCustomerID = C.CustomerID) AS ChildCustomers, IsLPO,IsPRO\r\n                            FROM Customer C\r\n\t\t\t\t\t\t\tLEFT OUTER JOIN Customer_Class CC ON C.CustomerClassID = CC.ClassID\r\n                            WHERE C.ISINACTIVE<>1 \t\t\t\t\t\t\r\n\t\t\t\t\t\t\tUNION ALL\r\n\t\t\t\t\t\t\tSELECT LeadID [Code],LeadName [Name],REPLACE(LeadID,' ','') + REPLACE(LeadName,' ','')   AS SearchColumn,'Lead' AS EntityType,2 AS EntityEnum,'' AS CurrencyID,''as AllowConsignment, '' AS IsHold,\r\n\t\t\t\t\t\t        '' as PriceLevelID, 0 as Balance, '' as ParentCustomerID, '' as PaymentTermID , '' as PaymentMethodID,'' as BillToAddressID,'' as ShippingMethodID, '' as ShipToAddressID, SalesPersonID, '' as IsWeightInvoice,LeadSourceID as CustomerClassID,\r\n                               '' AS ChildLeads, '' as IsLPO,'' as IsPRO\r\n                            FROM Lead C\r\n\t\t\t\t\t\t\t\r\n                            WHERE C.ISINACTIVE<>1 )\t\t\t\t\t\t\t\r\n\t\t\t\t\t\t\tORDER BY Code,Name";
			FillDataSet(dataSet, "Case_Client", textCommand);
			return dataSet;
		}

		public DataSet GetSMSCustomerList()
		{
			DataSet dataSet = new DataSet();
			string textCommand = "SELECT Customer.CustomerID ,CASE WHEN ShortName = '' THEN  Customer.CustomerName ELSE Customer.CustomerName + ' [' + ShortName + ']' END AS [Number], \r\n\t\t\t\t\t            Area.AreaName AS Area, CA.City,CA.Mobile AS [Doc ID],CC.ClassName\r\n                                FROM  Customer INNER JOIN\r\n                                Customer_Address AS CA ON Customer.CustomerID = CA.CustomerID AND CA.AddressID = 'PRIMARY' \r\n                                LEFT OUTER JOIN Country ON Country.CountryID = Customer.CountryID\r\n\t\t\t\t\t            LEFT OUTER JOIN Area ON Area.AreaID = Customer.AreaID\r\n                                LEFT JOIN Customer_Class CC ON CC.ClassID=Customer.CustomerClassID\r\n                                ORDER BY Customer.CustomerID,Customer.CustomerName";
			FillDataSet(dataSet, "Case_Client", textCommand);
			return dataSet;
		}

		public DataSet GetCustomerMobileNo(string CustomerID)
		{
			DataSet dataSet = new DataSet();
			string textCommand = "SELECT Customer.CustomerID ,CASE WHEN ShortName = '' THEN  Customer.CustomerName ELSE Customer.CustomerName + ' [' + ShortName + ']' END AS [Number], \r\n\t\t\t\t\t            Area.AreaName AS Area, CA.City,CA.Mobile AS [Doc ID],CC.ClassName\r\n                                FROM  Customer INNER JOIN\r\n                                Customer_Address AS CA ON Customer.CustomerID = CA.CustomerID AND CA.AddressID = 'PRIMARY' \r\n                                LEFT OUTER JOIN Country ON Country.CountryID = Customer.CountryID\r\n\t\t\t\t\t            LEFT OUTER JOIN Area ON Area.AreaID = Customer.AreaID\r\n                                LEFT JOIN Customer_Class CC ON CC.ClassID=Customer.CustomerClassID WHERE Customer.CustomerID='" + CustomerID + "'\r\n                                ORDER BY Customer.CustomerID,Customer.CustomerName";
			FillDataSet(dataSet, "Case_Client", textCommand);
			return dataSet;
		}

		public DataSet GetTransactionDetails(string CustomerID)
		{
			DataSet dataSet = new DataSet();
			string textCommand = "SELECT * from ARJournal where customerid='" + CustomerID + "'";
			FillDataSet(dataSet, "Case_Client", textCommand);
			return dataSet;
		}

		internal bool UpdateInsuranceDetails(CustomerInsuranceData InsuranceData, SqlTransaction sqlTransaction)
		{
			DataRow dataRow = InsuranceData.CustomerInsuranceTable.Rows[0];
			string text = dataRow["CustomerID"].ToString();
			string text2 = dataRow["InsStatus"].ToString();
			DateTime dateTime = DateTime.Parse(dataRow["InsApplicationDate"].ToString());
			SqlDateTime sqlDateTime = SqlDateTime.MinValue;
			SqlDateTime sqlDateTime2 = SqlDateTime.MinValue;
			if (dataRow["InsValidTo"].ToString() != "" && dataRow["InsValidTo"] != DBNull.Value)
			{
				sqlDateTime = DateTime.Parse(dataRow["InsValidTo"].ToString());
			}
			if (dataRow["InsEffectiveDate"].ToString() != "" && dataRow["InsEffectiveDate"] != DBNull.Value)
			{
				sqlDateTime2 = DateTime.Parse(dataRow["InsEffectiveDate"].ToString());
			}
			decimal num = decimal.Parse(dataRow["InsRequestedAmount"].ToString());
			decimal num2 = decimal.Parse(dataRow["InsApprovedAmount"].ToString());
			string text3 = dataRow["InsPolicyNumber"].ToString();
			string text4 = dataRow["InsProvider"].ToString().Trim();
			string text5 = dataRow["InsRemarks"].ToString();
			int num3 = int.Parse(dataRow["InsRating"].ToString());
			string text6 = dataRow["InsuranceID"].ToString();
			DataSet dataSet = new DataSet();
			try
			{
				string textCommand = "SELECT * FROM Customer WHERE CustomerID='" + text + "' ";
				FillDataSet(dataSet, "Customer", textCommand);
				textCommand = "UPDATE Customer SET  InsPolicyNumber='" + text3 + "' , InsStatus='" + text2 + "', InsApplicationDate='" + dateTime + "',InsEffectiveDate='" + sqlDateTime2 + "', InsExpiryDate='" + sqlDateTime + "',InsRequestedAmount='" + num + "' ,InsApprovedAmount='" + num2 + "', InsRemarks='" + text5 + "',InsRating=' " + num3 + "',InsProviderID=' " + text4 + "',InsuranceID=' " + text6 + "' WHERE CustomerID='" + text + "'";
				return ExecuteNonQuery(textCommand, sqlTransaction) > 0;
			}
			catch
			{
				return false;
			}
		}

		internal bool UpdateCreditReviewDetails(CreditLimitReviewData CreditLimitReviewData, SqlTransaction sqlTransaction)
		{
			DataRow dataRow = CreditLimitReviewData.CreditLimitReviewTable.Rows[0];
			string text = dataRow["CustomerID"].ToString();
			bool flag = bool.Parse(dataRow["AcceptCheckPayment"].ToString());
			bool flag2 = bool.Parse(dataRow["AcceptPDC"].ToString());
			int num = int.Parse(dataRow["CreditLimitType"].ToString());
			decimal num2 = decimal.Parse(dataRow["CreditAmount"].ToString());
			int num3 = 0;
			if (dataRow["Rating"].ToString() != "" && dataRow["Rating"] != DBNull.Value)
			{
				num3 = int.Parse(dataRow["Rating"].ToString());
			}
			SqlDateTime sqlDateTime = SqlDateTime.MinValue;
			if (dataRow["RatingDate"].ToString() != "" && dataRow["RatingDate"] != DBNull.Value)
			{
				sqlDateTime = DateTime.Parse(dataRow["RatingDate"].ToString());
			}
			string text2 = dataRow["RatingBy"].ToString();
			string text3 = dataRow["RatingRemarks"].ToString();
			DataSet dataSet = new DataSet();
			try
			{
				string textCommand = "SELECT * FROM Customer WHERE CustomerID='" + text + "' ";
				FillDataSet(dataSet, "Customer", textCommand);
				textCommand = "UPDATE Customer SET   Rating='" + num3 + "',  RatingBy='" + text2 + "',  RatingDate='" + sqlDateTime + "',  RatingRemarks='" + text3 + "', AcceptCheckPayment ='" + flag.ToString() + "' , AcceptPDC='" + flag2.ToString() + "', CreditLimitType='" + num + "', CreditAmount='" + num2 + "' WHERE CustomerID='" + text + "'";
				return ExecuteNonQuery(textCommand, sqlTransaction) > 0;
			}
			catch
			{
				return false;
			}
		}

		internal bool UpdateInsuranceDetailsAfterDeletion(string id)
		{
			string text = Convert.ToString(1);
			DateTime now = DateTime.Now;
			decimal num = default(decimal);
			decimal num2 = default(decimal);
			DataSet dataSet = new DataSet();
			try
			{
				string text2 = "SELECT CustomerID FROM Customer WHERE InsPolicyNumber='" + id + "' ";
				FillDataSet(dataSet, "Customer", text2);
				if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
				{
					string text3 = dataSet.Tables[0].Rows[0]["CustomerID"].ToString();
					text2 = "UPDATE Customer SET  InsPolicyNumber='" + id + "' , InsStatus='" + text + "', InsApplicationDate='" + now + "', InsRequestedAmount='" + num + "' ,InsApprovedAmount='" + num2 + " WHERE CustomerID='" + text3 + "'";
				}
				return ExecuteNonQuery(text2) > 0;
			}
			catch
			{
				return false;
			}
		}

		public DataSet GetTransactionCustomerList()
		{
			DataSet dataSet = new DataSet();
			string textCommand = "SELECT CustomerID [Customer Code],CustomerName [Name] FROM Customer\r\n                            WHERE ISINACTIVE<>1 ORDER BY CustomerID,CustomerName";
			FillDataSet(dataSet, "Case_Client", textCommand);
			return dataSet;
		}

		public DataSet GetCustomerList()
		{
			DataSet dataSet = new DataSet();
			string textCommand = "SELECT CaseClientID [Code],CaseClientName [Name] FROM Case_Client\r\n                            WHERE ISINACTIVE<>1 ORDER BY CaseClientID,CaseClientName";
			FillDataSet(dataSet, "Case_Client", textCommand);
			return dataSet;
		}

		public DataSet GetCaseClientList(bool isDefendant, bool plantiff)
		{
			DataSet dataSet = new DataSet();
			string textCommand = "SELECT CaseClientID [Code],CaseClientName [Name] FROM Case_Client\r\n                            WHERE ISINACTIVE<>1  AND IsDefendant='" + isDefendant.ToString() + "' AND IsPlantiff='" + plantiff.ToString() + "' ORDER BY CaseClientID,CaseClientName  ";
			FillDataSet(dataSet, "Case_Client", textCommand);
			return dataSet;
		}

		public DataSet GetSecondCustomerStatement(DateTime from, DateTime to, string fromCustomer, string toCustomer, string fromClass, string toClass, string fromGroup, string toGroup, bool isFC, bool showZeroBalance, bool isConsolidated, bool includeHold, bool onlyEmailMethod, bool showopenInvoices, string customerIDs)
		{
			try
			{
				string text = CommonLib.ToSqlDateTimeString(from);
				string text2 = CommonLib.ToSqlDateTimeString(to);
				string text3 = "";
				string text4 = "0";
				if (isFC)
				{
					text3 = "FC";
					text4 = "ISNULL(CONAmountFC,0)";
				}
				string str = "SELECT DISTINCT CusTable.[Customer Code],StatementEmail,StatementSendingMethod,TermName,SUM([Opening Balance]) AS [Opening Balance],SUM([Ending Balance]) AS [Ending Balance], SUM(PDC) AS PDC,CUS2.CustomerName AS [Customer Name],AddressPrintFormat FROM \r\n                        (SELECT DISTINCT CASE WHEN '" + isConsolidated.ToString() + "' = 'False' THEN   ARJ.CustomerID   ELSE ISNULL(CUS.ParentCustomerID,CUS.CustomerID) END [Customer Code] ,PT.TermName\r\n\t\t\t\t\t\t \r\n                            ";
				if (customerIDs != "")
				{
					str += ", SUBSTRING((SELECT  DISTINCT ',' + TermName FROM Customer C INNER JOIN Payment_Term PT ON PT.PaymentTermID = C.PaymentTermID ";
					str = ((!isConsolidated) ? (str + "where  C.CustomerID  IN(" + customerIDs + ") FOR XML PATH('')),2,20000) AS TermName_Consolidated ") : (str + " where C.CustomerID IN(" + customerIDs + ") OR C.ParentCustomerID IN(" + customerIDs + ") FOR XML PATH('')),2,20000) AS TermName_Consolidated "));
				}
				if (fromCustomer != "")
				{
					str += ", SUBSTRING((SELECT  DISTINCT ',' + TermName FROM Customer C INNER JOIN Payment_Term PT ON PT.PaymentTermID = C.PaymentTermID ";
					str = ((!isConsolidated) ? (str + "where  C.CustomerID  BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' FOR XML PATH('')),2,20000) AS TermName_Consolidated ") : (str + " where C.CustomerID  BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' OR C.ParentCustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "'FOR XML PATH('')),2,20000) AS TermName_Consolidated "));
				}
				str = (isFC ? (str + " ,ISNULL((SELECT SUM(ISNULL(DebitFC,0) + ISNULL(ConDebitFC,0) - ISNULL(CreditFC,0) - ISNULL(ConCreditFC,0)) ") : (str + ", ISNULL((SELECT SUM(ISNULL(Debit,0)- ISNULL(Credit,0)) "));
				str = str + " FROM ARJournal ARJ2 \r\n                         WHERE ARJ.CustomerID=ARJ2.CustomerID AND ARJ2.ARDate<'" + text + "'  AND ISNULL(ISPDCRow,'False') = 'False'  AND ISNULL(IsVoid,'False')='False'),0)\r\n                        AS [Opening Balance], ";
				str = (isFC ? (str + " ISNULL((SELECT SUM(ISNULL(DebitFC,0) + ISNULL(ConDebitFC,0) - ISNULL(CreditFC,0) - ISNULL(ConCreditFC,0)) ") : (str + " ISNULL((SELECT SUM(ISNULL(Debit,0)- ISNULL(Credit,0)) "));
				str = str + "FROM ARJournal ARJ2 \r\n                         WHERE ARJ.CustomerID=ARJ2.CustomerID AND ARJ2.ARDate<='" + text2 + "'  AND ISNULL(ISPDCRow,'False') = 'False' AND ISNULL(IsVoid,'False')='False'),0)\r\n                        AS [Ending Balance],\r\n\r\n                        (SELECT ISNULL(SUM(ISNULL(Amount" + text3 + ",0) + " + text4 + "),0) AS PDC FROM Cheque_Received ChqRec WHERE Status IN (1,2,3,4,8) AND ISNULL(IsVoid,'False')='False'  \r\n                        AND ChqRec.PayeeType = 'C' AND ChqRec.PayeeID = ARJ.CustomerID      AND (DepositDate IS NULL OR Status IN (1,4,8) OR DepositDate > '" + text2 + "') AND ReceiptDate < '" + text2 + "') AS PDC\r\n\r\n                        FROM ARJournal ARJ INNER JOIN Customer CUS ON CUS.CustomerID  = ARJ.CustomerID\r\n                         \r\n                        LEFT OUTER JOIN Payment_Term PT ON CUS.PaymentTermID=PT.PaymentTermID\r\n                         WHERE ";
				str = str + " ARDate < '" + text2 + "' ";
				str += " AND ISNULL(IsVoid,'False')='False' ";
				if (customerIDs != "")
				{
					str = ((!isConsolidated) ? (str + "AND C.CustomerID  IN(" + customerIDs + ") FOR XML PATH('')),2,20000) AS TermName_Consolidated ") : (str + " AND C.CustomerID IN(" + customerIDs + ") OR C.ParentCustomerID IN(" + customerIDs + ") FOR XML PATH('')),2,20000) AS TermName_Consolidated "));
				}
				if (fromCustomer != "")
				{
					str = ((!isConsolidated) ? (str + " AND ARJ.CustomerID  BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ") : (str + " AND (ARJ.CustomerID  BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' OR CUS.ParentCustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "')"));
				}
				if (fromClass != "")
				{
					str = str + " AND CustomerClassID >= '" + fromClass + "' ";
				}
				if (toClass != "")
				{
					str = str + " AND CustomerClassID <= '" + toClass + "' ";
				}
				if (fromGroup != "")
				{
					str = str + " AND CustomerGroupID >= '" + fromGroup + "' ";
				}
				if (toGroup != "")
				{
					str = str + " AND CustomerGroupID <= '" + toGroup + "' ";
				}
				if (!includeHold)
				{
					str += " AND ISNULL(IsHold,'False') = 'False' ";
				}
				if (onlyEmailMethod)
				{
					str += " AND ISNULL(StatementSendingMethod, 0) = 1 ";
				}
				str += " ) AS CusTable ";
				str += "  INNER JOIN Customer CUS2 ON CUS2.CustomerID = CUSTable.[Customer Code]\r\n\t\t\t\t\t\tLEFT OUTER JOIN Customer_Address CA ON CA.CustomerID=CusTable.[Customer Code]  AND CA.AddressID='Primary'  ";
				if (!showZeroBalance)
				{
					str += " WHERE CusTable.[Ending Balance] <> 0 OR CusTable.PDC <>0 ";
				}
				str += " GROUP BY StatementSendingMethod,StatementEmail,CusTable.[Customer Code],Custable.TermName,CustomerName,AddressPrintFormat ORDER BY [Customer Code]";
				DataSet dataSet = new DataSet();
				FillDataSet(dataSet, "Case_Client", str);
				DataSet dataSet2 = new DataSet();
				str = "SELECT ARID JournalID,CustomerID[Customer Code],ARJ.ARDate,ISNULL(ARJ.CurrencyID,(SELECT CurrencyID FROM Currency WHERE IsBase='True')) AS CurrencyID,ARJ.SysDocID,ARJ.VoucherID,ARJ.Description,ARJ.Reference, \r\n                        ISNULL(ISNULL(DebitFC,Debit),0) AS Amount,\r\n                        ISNULL((SELECT CASE WHEN ARJ.CurrencyID IS NULL  OR ARJ.CurrencyID=(SELECT CurrencyID FROM Currency WHERE IsBase='True') \r\n                        THEN SUM(ISNULL(PaymentAmount,0)+ISNULL(DiscountAmount,0)) ELSE SUM(ISNULL(PaymentAmountFC,0)+ISNULL(DiscountAmountFC,0)) \r\n                        END FROM AR_Payment_Allocation ARP WHERE ARJ.ARID = ARP.ARJournalID  AND AllocationDate BETWEEN '" + text + "' AND '" + text2 + "'),0)  AS PaidAmount,\r\n                        ARJ.ARDueDate,DATEDIFF(DAY,ARJ.ARDueDate,'" + text2 + "') AS OverDue,SysDocType\r\n                        FROM ARJournal ARJ  LEFT OUTER JOIN System_Document SD ON SD.SysDocID = ARJ.SysDocID \r\n                        WHERE ISNULL(ARJ.Debit,0)>0 AND ISNULL(ARJ.IsVoid,'False')='False'  AND ISNULL(SD.SysDocType,1) <> 12  \r\n                        AND ISNULL(ISPDCRow,'False') = 'False'  AND ARJ.ARDate BETWEEN '" + text + "' AND '" + text2 + "'  ";
				if (customerIDs != "")
				{
					str = ((!isConsolidated) ? (str + "AND ARJ.CustomerID  IN(" + customerIDs + ") ") : (str + " AND (ARJ.CustomerID IN(" + customerIDs + ") OR CUS.ParentCustomerID IN(" + customerIDs + ") )"));
				}
				if (fromCustomer != "")
				{
					str = ((!isConsolidated) ? (str + " AND ARJ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ") : (str + " AND (ARJ.CustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' OR CUS.ParentCustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "')"));
				}
				if (fromClass != "")
				{
					str = str + " AND ARJ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					str = str + " AND ARJ.CustomerID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				str += " ORDER BY ARJ.ARDate";
				FillDataSet(dataSet2, "ARJournal", str);
				dataSet.Merge(dataSet2);
				dataSet.Relations.Add("Balance Detail", dataSet.Tables["Case_Client"].Columns["Customer Code"], dataSet.Tables["ARJournal"].Columns["Customer Code"], createConstraints: false);
				str = "SELECT SysDocID,VoucherID,CASE WHEN Status<>8 THEN ChequeNumber ELSE '(R)' + ChequeNumber END AS ChequeNumber,\r\n                        CASE WHEN '" + isConsolidated.ToString() + "' = 'False' THEN   PayeeID   ELSE ISNULL(CUS.ParentCustomerID,CUS.CustomerID) END AS [Customer Code],\r\n                        ChqRec.BankID,Bank.BankName,PayeeID,ChequeDate,ISNULL(Amount" + text3 + ",0) + " + text4 + " AS Amount\r\n                        FROM Cheque_Received ChqRec\r\n                        LEFT OUTER JOIN Bank ON Bank.BankID=ChqRec.BankID\r\n                        LEFT OUTER JOIN Customer CUS ON CUS.CustomerID = ChqRec.PayeeID\r\n                        WHERE Status IN (1,2,3,4,8) AND ISNULL(IsVoid,'False')='False'\r\n                         AND (DepositDate IS NULL OR Status IN (1,4,8) OR DepositDate > '" + text2 + "')\r\n                        AND ReceiptDate < '" + text2 + "'\r\n                        AND PayeeType='C' ";
				if (customerIDs != "")
				{
					str = ((!isConsolidated) ? (str + "AND PayeeID  IN(" + customerIDs + ") ") : (str + " AND (PayeeID IN(" + customerIDs + ") OR CUS.ParentCustomerID IN(" + customerIDs + ") )"));
				}
				if (fromCustomer != "")
				{
					str = ((!isConsolidated) ? (str + " AND PayeeID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' ") : (str + " AND (PayeeID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "' OR CUS.ParentCustomerID BETWEEN '" + fromCustomer + "' AND '" + toCustomer + "')"));
				}
				if (fromClass != "")
				{
					str = str + " AND PayeeID IN (SELECT CustomerID FROM Customer WHERE CustomerClassID BETWEEN '" + fromClass + "' AND '" + toClass + "') ";
				}
				if (fromGroup != "")
				{
					str = str + " AND PayeeID IN (SELECT CustomerID FROM Customer WHERE CustomerGroupID BETWEEN '" + fromGroup + "' AND '" + toGroup + "') ";
				}
				FillDataSet(dataSet, "Cheque_Received", str);
				dataSet.Relations.Add("PDCRel", dataSet.Tables["Case_Client"].Columns["Customer Code"], dataSet.Tables["Cheque_Received"].Columns["Customer Code"], createConstraints: false);
				DataSet customerAgingSummary = GetCustomerAgingSummary(fromCustomer, toCustomer, fromClass, toClass, fromGroup, toGroup, to, showZeroBalance: true, includeAgingTable: false, isFC, isConsolidated, "", "", customerIDs);
				customerAgingSummary.Tables[0].TableName = "Aging";
				dataSet.Merge(customerAgingSummary.Tables["Aging"]);
				dataSet.Relations.Add("Aging", dataSet.Tables["Case_Client"].Columns["Customer Code"], dataSet.Tables["Aging"].Columns["CustomerID"], createConstraints: false);
				dataSet.Tables.Add("StatementInfo");
				dataSet.Tables["StatementInfo"].Columns.Add("PeriodFrom", typeof(DateTime));
				dataSet.Tables["StatementInfo"].Columns.Add("PeriodTo", typeof(DateTime));
				dataSet.Tables["StatementInfo"].Rows.Add(from, to);
				return dataSet;
			}
			catch
			{
				throw;
			}
		}
	}
}
