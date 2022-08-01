using Micromind.Common;
using Micromind.Common.Data;
using Micromind.Common.Libraries;
using System;
using System.Data;
using System.Data.SqlClient;

namespace Micromind.Data
{
	public sealed class Grade : StoreObject
	{
		private const string GRADEID_PARM = "@GradeID";

		private const string GRADENAME_PARM = "@GradeName";

		public const string NOTE_PARM = "@Note";

		public const string GRADE_TABLE = "Employee_Grade";

		private const string CREATEDBY_PARM = "@CreatedBy";

		private const string DATECREATED_PARM = "@DateCreated";

		private const string UPDATEDBY_PARM = "@UpdatedBy";

		private const string DATEUPDATED_PARM = "@DateUpdated";

		public Grade(Config config)
			: base(config)
		{
		}

		private string GetInsertUpdateText(bool isUpdate)
		{
			SqlBuilder sqlBuilder = new SqlBuilder();
			sqlBuilder.AddInsertUpdateParameters("Employee_Grade", new FieldValue("GradeID", "@GradeID", isUpdateConditionField: true), new FieldValue("GradeName", "@GradeName"), new FieldValue("Note", "@Note"));
			if (isUpdate)
			{
				sqlBuilder.AddInsertUpdateParameters("Employee_Grade", new FieldValue("DateUpdated", "@DateUpdated", isUpdateConditionField: true, checkForNullValue: true));
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
			parameters.Add("@GradeID", SqlDbType.NVarChar);
			parameters.Add("@GradeName", SqlDbType.NVarChar);
			parameters.Add("@Note", SqlDbType.NVarChar);
			parameters["@GradeID"].SourceColumn = "GradeID";
			parameters["@GradeName"].SourceColumn = "GradeName";
			parameters["@Note"].SourceColumn = "Note";
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

		public bool InsertGrade(GradeData accountGradeData)
		{
			bool result = true;
			SqlCommand insertUpdateCommand = GetInsertUpdateCommand(isUpdate: false);
			SqlTransaction sqlTransaction = null;
			try
			{
				sqlTransaction = (insertUpdateCommand.Transaction = base.DBConfig.StartNewTransaction());
				result = Insert(accountGradeData, "Employee_Grade", insertUpdateCommand);
				string text = accountGradeData.GradeTable.Rows[0]["GradeID"].ToString();
				AddActivityLog("Grade", text, ActivityTypes.Add, sqlTransaction);
				UpdateTableRowInsertUpdateInfo("Employee_Grade", "GradeID", text, sqlTransaction, isInsert: true);
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

		public bool UpdateGrade(GradeData accountGradeData)
		{
			bool flag = true;
			SqlCommand insertUpdateCommand = GetInsertUpdateCommand(isUpdate: true);
			SqlTransaction sqlTransaction = null;
			try
			{
				sqlTransaction = (insertUpdateCommand.Transaction = base.DBConfig.StartNewTransaction());
				flag = Update(accountGradeData, "Employee_Grade", insertUpdateCommand);
				if (!flag)
				{
					return flag;
				}
				object obj = accountGradeData.GradeTable.Rows[0]["GradeID"];
				UpdateTableRowByID("Employee_Grade", "GradeID", "DateUpdated", obj, DateTime.Now, sqlTransaction);
				string entiyID = accountGradeData.GradeTable.Rows[0]["GradeName"].ToString();
				AddActivityLog("Grade", entiyID, ActivityTypes.Update, sqlTransaction);
				UpdateTableRowInsertUpdateInfo("Employee_Grade", "GradeID", obj, sqlTransaction, isInsert: false);
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

		public GradeData GetGrade()
		{
			SqlBuilder sqlBuilder = new SqlBuilder();
			sqlBuilder.AddTable("Employee_Grade");
			GradeData gradeData = new GradeData();
			sqlBuilder.UseDistinct = false;
			FillDataSet(gradeData, "Employee_Grade", sqlBuilder);
			return gradeData;
		}

		public bool DeleteGrade(string gradeID)
		{
			bool flag = true;
			try
			{
				string commandText = "DELETE FROM Employee_Grade WHERE GradeID = '" + gradeID + "'";
				flag = Delete(commandText, null);
				if (!flag)
				{
					return flag;
				}
				AddActivityLog("Grade", gradeID, ActivityTypes.Delete, null);
				return flag;
			}
			catch
			{
				throw;
			}
		}

		public GradeData GetGradeByID(string id)
		{
			SqlBuilder sqlBuilder = new SqlBuilder();
			CommandHelper commandHelper = null;
			commandHelper = new CommandHelper();
			commandHelper.FieldName = "GradeID";
			commandHelper.SqlFieldType = SqlDbType.NVarChar;
			commandHelper.FieldValue = id;
			commandHelper.TableName = "Employee_Grade";
			sqlBuilder.AddCommandHelper(commandHelper);
			sqlBuilder.IsComparing = true;
			GradeData gradeData = new GradeData();
			sqlBuilder.UseDistinct = false;
			FillDataSet(gradeData, "Employee_Grade", sqlBuilder);
			return gradeData;
		}

		public DataSet GetGradeByFields(params string[] columns)
		{
			return GetGradeByFields(null, isInactive: true, columns);
		}

		public DataSet GetGradeByFields(string[] gradeID, params string[] columns)
		{
			return GetGradeByFields(gradeID, isInactive: true, columns);
		}

		public DataSet GetGradeByFields(string[] ids, bool isInactive, params string[] columns)
		{
			SqlBuilder sqlBuilder = new SqlBuilder();
			sqlBuilder.AddTable("Employee_Grade");
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
				commandHelper.FieldName = "GradeID";
				commandHelper.FieldValue = ids;
				commandHelper.SqlFieldType = SqlDbType.NVarChar;
				commandHelper.TableName = "Employee_Grade";
				sqlBuilder.AddCommandHelper(commandHelper);
			}
			DataSet dataSet = new DataSet();
			dataSet.EnforceConstraints = false;
			sqlBuilder.UseDistinct = false;
			FillDataSet(dataSet, "Employee_Grade", sqlBuilder);
			return dataSet;
		}

		public DataSet GetGradeList()
		{
			DataSet dataSet = new DataSet();
			string textCommand = "SELECT GradeID [Grade Code],GradeName [Grade Name],Note\r\n                           FROM Employee_Grade ";
			FillDataSet(dataSet, "Employee_Grade", textCommand);
			return dataSet;
		}

		public DataSet GetGradeComboList()
		{
			DataSet dataSet = new DataSet();
			string textCommand = "SELECT GradeID [Code],GradeName [Name]\r\n                           FROM Employee_Grade ORDER BY GradeID,GradeName";
			FillDataSet(dataSet, "Employee_Grade", textCommand);
			return dataSet;
		}
	}
}
