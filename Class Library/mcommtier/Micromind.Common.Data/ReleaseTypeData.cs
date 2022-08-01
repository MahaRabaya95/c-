using System;
using System.ComponentModel;
using System.Data;
using System.Runtime.Serialization;

namespace Micromind.Common.Data
{
	[Serializable]
	[DesignerCategory("Code")]
	public class ReleaseTypeData : DataSet
	{
		public const string RELEASETYPEID_FIELD = "ReleaseTypeID";

		public const string RELEASETYPENAME_FIELD = "ReleaseTypeName";

		public const string ISINACTIVE_FIELD = "IsInactive";

		public const string NOTE_FIELD = "Note";

		public const string RELEASETYPE_TABLE = "Release_Type";

		public const string CREATEDBY_FIELD = "CreatedBy";

		public const string DATECREATED_FIELD = "DateCreated";

		public const string UPDATEDBY_FIELD = "UpdatedBy";

		public const string DATEUPDATED_FIELD = "DateUpdated";

		public DataTable ReleaseTypeTable => base.Tables["Release_Type"];

		public ReleaseTypeData()
		{
			BuildDataTables();
		}

		public ReleaseTypeData(SerializationInfo info, StreamingContext context)
			: base(info, context)
		{
		}

		private void BuildDataTables()
		{
			DataTable dataTable = new DataTable("Release_Type");
			DataColumnCollection columns = dataTable.Columns;
			DataColumn dataColumn = columns.Add("ReleaseTypeID", typeof(string));
			dataColumn.AllowDBNull = false;
			dataColumn.AutoIncrement = false;
			dataTable.PrimaryKey = new DataColumn[1]
			{
				dataColumn
			};
			columns.Add("ReleaseTypeName", typeof(string));
			columns.Add("IsInactive", typeof(bool)).DefaultValue = false;
			columns.Add("Note", typeof(string));
			base.Tables.Add(dataTable);
		}
	}
}
