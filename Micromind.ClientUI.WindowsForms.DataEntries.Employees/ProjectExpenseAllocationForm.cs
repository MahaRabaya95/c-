using Infragistics.Win;
using Infragistics.Win.FormattedLinkLabel;
using Infragistics.Win.UltraWinGrid;
using Micromind.ClientLibraries;
using Micromind.ClientUI.Libraries;
using Micromind.ClientUI.Properties;
using Micromind.ClientUI.WindowsForms.DataEntries.Accounts;
using Micromind.ClientUI.WindowsForms.DataEntries.Others;
using Micromind.Common;
using Micromind.Common.Data;
using Micromind.Common.Interfaces;
using Micromind.DataControls;
using Micromind.UISupport;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Windows.Forms;

namespace Micromind.ClientUI.WindowsForms.DataEntries.Employees
{
	public class ProjectExpenseAllocationForm : Form, IForm
	{
		private ProjectExpenseAllocationData currentData;

		private const string TABLENAME_CONST = "Project_Expense_Allocation";

		private const string IDFIELD_CONST = "VoucherID";

		private bool isNewRecord = true;

		private DataTable tempData;

		private int TotalMonthHours = CompanyPreferences.TotalWorkingMonthHours;

		private bool isUpdatingGrid;

		private ScreenAccessRight screenRight;

		private bool isVoid;

		private IContainer components;

		private Panel panelButtons;

		private Line linePanelDown;

		private XPButton xpButton1;

		private XPButton buttonSave;

		private FormManager formManager;

		private DateTimePicker dateTimePickerDate;

		private TextBox textBoxVoucherNumber;

		private Label label1;

		private MMLabel mmLabel1;

		private TextBox textBoxRef1;

		private TextBox textBoxNote;

		private Label label3;

		private XPButton buttonDelete;

		private XPButton buttonNew;

		private UltraFormattedLinkLabel ultraFormattedLinkLabel2;

		private XPButton buttonVoid;

		private Panel panelDetails;

		private Label labelVoided;

		private UltraFormattedLinkLabel ultraFormattedLinkLabel5;

		private ToolStripButton toolStripButtonFirst;

		private ToolStripButton toolStripButtonPrevious;

		private ToolStripButton toolStripButtonNext;

		private ToolStripButton toolStripButtonLast;

		private ToolStripTextBox toolStripTextBoxFind;

		private ToolStripButton toolStripButtonFind;

		private ToolStripSeparator toolStripSeparator2;

		private ToolStrip toolStrip1;

		private XPButton buttonSelectSalarySheet;

		private DataEntryGrid dataGridItems;

		private MMLabel mmLabel4;

		private TextBox textBoxMonth;

		private MMLabel mmLabel3;

		private TextBox textBoxYear;

		private MMLabel mmLabel6;

		private TextBox textBoxSheetName;

		private ToolStripSeparator toolStripSeparator1;

		private ToolStripButton toolStripButtonOpenList;

		private Label label4;

		private Label label5;

		private Label label6;

		private DataEntryGrid dataGriditem;

		private ToolStripButton toolStripButtonPrint;

		private ToolStripButton toolStripButtonPreview;

		private ToolStripButton toolStripButtonInformation;

		private JobComboBox comboBoxJob;

		private ToolStripButton toolStripButtonDistribution;

		private SysDocComboBox comboBoxSysDoc;

		private CostCategoryComboBox ComboBoxcostCategory;

		private XPButton ButtonSelectOverTime;

		public ScreenAreas ScreenArea => ScreenAreas.HR;

		public int ScreenID => 5043;

		public ScreenTypes ScreenType => ScreenTypes.Transaction;

		private string SystemDocID => comboBoxSysDoc.SelectedID;

		private bool IsDirty
		{
			get
			{
				if (IsVoid)
				{
					return false;
				}
				return formManager.GetDirtyStatus();
			}
		}

		private bool IsNewRecord
		{
			get
			{
				return isNewRecord;
			}
			set
			{
				isNewRecord = value;
				if (value)
				{
					buttonNew.Text = UIMessages.ClearButtonText;
					XPButton xPButton = buttonDelete;
					bool enabled = buttonVoid.Enabled = false;
					xPButton.Enabled = enabled;
					SysDocComboBox sysDocComboBox = comboBoxSysDoc;
					enabled = (textBoxVoucherNumber.Enabled = true);
					sysDocComboBox.Enabled = enabled;
					buttonSelectSalarySheet.Enabled = true;
				}
				else
				{
					buttonNew.Text = UIMessages.NewButtonText;
					XPButton xPButton2 = buttonDelete;
					bool enabled = buttonVoid.Enabled = true;
					xPButton2.Enabled = enabled;
					if (IsVoid)
					{
						buttonVoid.Enabled = false;
					}
					SysDocComboBox sysDocComboBox2 = comboBoxSysDoc;
					enabled = (textBoxVoucherNumber.Enabled = false);
					sysDocComboBox2.Enabled = enabled;
					buttonSelectSalarySheet.Enabled = false;
				}
				if (!screenRight.New && isNewRecord)
				{
					buttonSave.Enabled = false;
				}
				else if (!screenRight.Edit && !isNewRecord)
				{
					buttonSave.Enabled = false;
				}
				else
				{
					buttonSave.Enabled = true;
				}
				if (!isNewRecord)
				{
					buttonSave.Enabled = false;
				}
				if (!screenRight.Delete)
				{
					buttonDelete.Enabled = false;
				}
			}
		}

		private bool IsVoid
		{
			get
			{
				return isVoid;
			}
			set
			{
				if (isVoid != value)
				{
					isVoid = value;
					panelDetails.Enabled = !value;
					dataGriditem.Enabled = !value;
					buttonSave.Enabled = !value;
					labelVoided.Visible = value;
					buttonSelectSalarySheet.Enabled = !value;
					if (value)
					{
						buttonVoid.Text = UIMessages.Unvoid;
						buttonVoid.Enabled = false;
					}
					else
					{
						buttonVoid.Text = UIMessages.Void;
					}
				}
			}
		}

		public ProjectExpenseAllocationForm()
		{
			InitializeComponent();
			AddEvents();
		}

		private void AddEvents()
		{
			base.Load += JournalLeavesForm_Load;
			dataGriditem.CellDataError += dataGrid_CellDataError;
			dataGriditem.BeforeCellUpdate += dataGrid_BeforeCellUpdate;
			dataGriditem.AfterRowActivate += dataGriditem_AfterRowActivate;
			dataGriditem.BeforeRowDeactivate += dataGrid_BeforeRowDeactivate;
			dataGriditem.BeforeCellDeactivate += dataGrid_BeforeCellDeactivate;
			dataGriditem.BeforeCellActivate += dataGriditem_BeforeCellActivate;
			dataGriditem.CellChange += dataGriditem_CellChange;
			dataGriditem.AfterRowsDeleted += dataGriditem_AfterRowsDeleted;
			comboBoxSysDoc.SelectedIndexChanged += comboBoxSysDoc_SelectedIndexChanged;
			dataGriditem.AfterCellUpdate += dataGriditem_AfterCellUpdate;
			dataGriditem.HeaderClicked += dataGridItem_HeaderClicked;
		}

		private void comboBoxBankAccount_SelectedIndexChanged(object sender, EventArgs e)
		{
		}

		private void dataGridItem_HeaderClicked(object sender, EventArgs e)
		{
			if (dataGriditem.ActiveRow == null)
			{
				return;
			}
			UltraGridColumn ultraGridColumn = sender as UltraGridColumn;
			if (ultraGridColumn == null)
			{
				return;
			}
			if (ultraGridColumn.Key == "Payroll Item")
			{
				string text = "";
				byte b = byte.Parse(dataGriditem.ActiveRow.Cells["Pay Type"].Value.ToString());
				if (dataGriditem.ActiveRow != null)
				{
					text = dataGriditem.ActiveRow.Cells["Payroll Item"].Text;
				}
				if (!(text == ""))
				{
					FormHelper formHelper = new FormHelper();
					switch (b)
					{
					case 2:
						formHelper.EditDeduction(text);
						break;
					case 1:
						formHelper.EditPayrollItem(text);
						break;
					}
				}
			}
			else if (ultraGridColumn.Key == "Emp ID")
			{
				string text2 = "";
				if (dataGriditem.ActiveRow != null)
				{
					text2 = dataGriditem.ActiveRow.Cells["Emp ID"].Text;
				}
				if (!(text2 == ""))
				{
					new FormHelper().EditEmployee(text2);
				}
			}
		}

		private void comboBoxMonth_SelectedIndexChanged(object sender, EventArgs e)
		{
		}

		private void SetBeginEndDate()
		{
		}

		private void dataGriditem_AfterCellUpdate(object sender, CellEventArgs e)
		{
			try
			{
				if (e.Cell.Column.Key == "Hours")
				{
					if (e.Cell.Value.ToString() != "0" && e.Cell.Value != null && e.Cell.Value.ToString() != "")
					{
						decimal d = decimal.Parse(dataGriditem.ActiveRow.ParentRow.Cells["Amount"].Value.ToString());
						decimal d2 = decimal.Parse(e.Cell.Row.Cells["Hours"].Value.ToString());
						e.Cell.Row.Cells["Amount"].Value = (d / (decimal)TotalMonthHours * d2).ToString(Format.TotalAmountFormat);
					}
				}
				else if (e.Cell.Column.Key == "EmployeeID")
				{
					if (!bool.Parse(e.Cell.Text.ToString()))
					{
						e.Cell.Row.Cells["Amount"].Value = 0.ToString(Format.TotalAmountFormat);
					}
					else if (e.Cell.Row.Cells["Amount"].Value == null || e.Cell.Row.Cells["Amount"].Value.ToString() == "" || decimal.Parse(e.Cell.Row.Cells["Amount"].Value.ToString()) == 0m)
					{
						e.Cell.Row.Cells["Amount"].Value = e.Cell.Row.Cells["Balance"].Value;
					}
					CalculateTotal();
				}
			}
			catch (Exception e2)
			{
				ErrorHelper.ProcessError(e2);
			}
			finally
			{
				isUpdatingGrid = false;
			}
		}

		private void CalculateTotal()
		{
			foreach (UltraGridRow row in dataGriditem.Rows)
			{
				_ = row;
			}
		}

		private void comboBoxSysDoc_SelectedIndexChanged(object sender, EventArgs e)
		{
			if (isNewRecord)
			{
				textBoxVoucherNumber.Text = GetNextVoucherNumber();
			}
			formManager.SetControlDirtyStatus(textBoxVoucherNumber, textBoxVoucherNumber.Text);
		}

		private void dataGriditem_AfterRowsDeleted(object sender, EventArgs e)
		{
			CalculateTotal();
		}

		private void dataGriditem_AfterRowActivate(object sender, EventArgs e)
		{
		}

		private void dataGriditem_CellChange(object sender, CellEventArgs e)
		{
			if (e.Cell.Column.Key == "EmployeeID")
			{
				if (!bool.Parse(e.Cell.Text.ToString()))
				{
					e.Cell.Row.Cells["Amount"].Value = 0.ToString(Format.TotalAmountFormat);
				}
				else if (e.Cell.Row.Cells["Amount"].Value == null || e.Cell.Row.Cells["Amount"].Value.ToString() == "" || decimal.Parse(e.Cell.Row.Cells["Amount"].Value.ToString()) == 0m)
				{
					e.Cell.Row.Cells["Amount"].Value = e.Cell.Row.Cells["Balance"].Value;
				}
			}
		}

		private void dataGriditem_BeforeCellActivate(object sender, CancelableCellEventArgs e)
		{
		}

		private void comboBoxGridEmployee_SelectedIndexChanged(object sender, EventArgs e)
		{
		}

		private void dataGrid_BeforeCellDeactivate(object sender, CancelEventArgs e)
		{
			if (dataGriditem.ActiveRow == null)
			{
				return;
			}
			if (dataGriditem.ActiveCell.Column.Key == "Account")
			{
				if (dataGriditem.ActiveRow.Cells["Emp ID"].Value.ToString() == "")
				{
					dataGriditem.ActiveRow.Cells["Emp Name"].Value = "";
				}
			}
			else if (dataGriditem.ActiveCell.Column.Key == "Amount" && dataGriditem.ActiveCell.Text != "")
			{
				dataGriditem.ActiveCell.Value = decimal.Round(decimal.Parse(dataGriditem.ActiveCell.Text, NumberStyles.Any), 2).ToString(Format.TotalAmountFormat);
			}
		}

		private void dataGrid_BeforeRowDeactivate(object sender, CancelEventArgs e)
		{
		}

		private void dataGrid_BeforeCellUpdate(object sender, BeforeCellUpdateEventArgs e)
		{
			if (e.Cell.Column.Key == "Amount")
			{
				decimal result = default(decimal);
				UltraGridRow activeRow = dataGriditem.ActiveRow;
				decimal.TryParse(activeRow.ParentRow.Cells["GrossSalary"].Value.ToString(), out result);
				decimal d = default(decimal);
				foreach (UltraGridRow row in activeRow.ParentRow.ChildBands[0].Rows)
				{
					decimal result2 = default(decimal);
					decimal.TryParse(row.Cells["Amount"].Value.ToString(), out result2);
					d += result2;
				}
				if (d < 0m)
				{
					ErrorHelper.InformationMessage("Please enter an positive amount not greater than Gross Salary.");
					e.Cancel = true;
				}
				else if (d > result)
				{
					ErrorHelper.InformationMessage("Projects expense should not greater than Gross Salary.");
					e.Cancel = false;
					e.Cell.IsInEditMode = false;
				}
			}
		}

		private void dataGrid_CellDataError(object sender, CellDataErrorEventArgs e)
		{
		}

		private bool GetData()
		{
			try
			{
				if (currentData == null || isNewRecord)
				{
					currentData = new ProjectExpenseAllocationData();
				}
				DataRow dataRow = (!isNewRecord) ? currentData.ProjectExpenseAllocationTable.Rows[0] : currentData.ProjectExpenseAllocationTable.NewRow();
				dataRow["Description"] = textBoxNote.Text;
				dataRow["TransactionDate"] = dateTimePickerDate.Value;
				dataRow["SysDocID"] = comboBoxSysDoc.SelectedID;
				dataRow["VoucherID"] = textBoxVoucherNumber.Text;
				dataRow["Reference"] = textBoxRef1.Text;
				dataRow.EndEdit();
				if (IsNewRecord)
				{
					currentData.ProjectExpenseAllocationTable.Rows.Add(dataRow);
				}
				currentData.ProjectExpenseAllocationDetailTable.Rows.Clear();
				foreach (UltraGridRow row in dataGriditem.Rows)
				{
					string value = row.Cells["SheetSysDocID"].Value.ToString();
					string value2 = row.Cells["SheetVoucherID"].Value.ToString();
					string value3 = row.Cells["SheetRowIndex"].Value.ToString();
					string value4 = row.Cells["OTAmount"].Value.ToString();
					string value5 = row.Cells["GrossSalary"].Value.ToString();
					foreach (UltraGridRow row2 in row.ChildBands[0].Rows)
					{
						DataRow dataRow2 = currentData.ProjectExpenseAllocationDetailTable.NewRow();
						dataRow2.BeginEdit();
						if (row2.Cells["Project"].Value.ToString() != "")
						{
							dataRow2["EmployeeID"] = row2.Cells["EmployeeID"].Value.ToString();
							dataRow2["SheetSysDocID"] = value;
							dataRow2["SheetVoucherID"] = value2;
							dataRow2["ProjectID"] = row2.Cells["Project"].Value.ToString();
							dataRow2["CostCategoryID"] = row2.Cells["CostCategory"].Value.ToString();
							dataRow2["Amount"] = row2.Cells["Amount"].Value.ToString();
							dataRow2["RowIndex"] = row2.Index;
							dataRow2["SheetRowIndex"] = value3;
							dataRow2["OTAmount"] = value4;
							dataRow2["GrossSalary"] = value5;
							if (row2.Cells["Hours"].Value.ToString() != "")
							{
								dataRow2["Hours"] = row2.Cells["Hours"].Value.ToString();
							}
							else
							{
								dataRow2["Hours"] = "0";
							}
							dataRow2.EndEdit();
							currentData.ProjectExpenseAllocationDetailTable.Rows.Add(dataRow2);
						}
					}
				}
				currentData.Merge(tempData);
				return true;
			}
			catch (Exception e)
			{
				ErrorHelper.ProcessError(e);
				return false;
			}
		}

		private void SetupGrid()
		{
			try
			{
				DataSet dataSet = new DataSet();
				dataGriditem.Clear();
				dataGriditem.DataSource = null;
				dataGriditem.DisplayLayout.Bands[0].Columns.ClearUnbound();
				DataTable dataTable = new DataTable("ExpenseAllocation");
				dataTable.Columns.Add("SheetSysDocID");
				dataTable.Columns.Add("SheetVoucherID");
				dataTable.Columns.Add("SheetRowIndex", typeof(int));
				dataTable.Columns.Add("EmployeeID");
				dataTable.Columns.Add("Name");
				dataTable.Columns.Add("OTAmount", typeof(decimal));
				dataTable.Columns.Add("GrossSalary", typeof(decimal));
				dataTable.Columns.Add("Amount", typeof(decimal));
				dataSet.Tables.Add(dataTable);
				DataTable dataTable2 = new DataTable("ExpenseAllocationDetails");
				dataTable2.Columns.Add("Project", typeof(string));
				dataTable2.Columns.Add("CostCategory", typeof(string));
				dataTable2.Columns.Add("Hours", typeof(decimal));
				dataTable2.Columns.Add("Amount", typeof(decimal));
				dataTable2.Columns.Add("EmployeeID");
				dataSet.Tables.Add(dataTable2);
				dataSet.Relations.Add("REL", dataSet.Tables["ExpenseAllocation"].Columns["EmployeeID"], dataSet.Tables["ExpenseAllocationDetails"].Columns["EmployeeID"], createConstraints: true);
				dataGriditem.DataSource = dataSet;
				dataGriditem.DisplayLayout.Bands[0].Override.CellClickAction = CellClickAction.RowSelect;
				UltraGridColumn ultraGridColumn = dataGriditem.DisplayLayout.Bands[0].Columns["Amount"];
				UltraGridColumn ultraGridColumn2 = dataGriditem.DisplayLayout.Bands[0].Columns["SheetSysDocID"];
				UltraGridColumn ultraGridColumn3 = dataGriditem.DisplayLayout.Bands[0].Columns["SheetVoucherID"];
				UltraGridColumn ultraGridColumn4 = dataGriditem.DisplayLayout.Bands[0].Columns["SheetRowIndex"];
				bool flag2 = dataGriditem.DisplayLayout.Bands[1].Columns["EmployeeID"].Hidden = true;
				bool flag4 = ultraGridColumn4.Hidden = flag2;
				bool flag6 = ultraGridColumn3.Hidden = flag4;
				bool hidden = ultraGridColumn2.Hidden = flag6;
				ultraGridColumn.Hidden = hidden;
				HAlign hAlign3 = dataGriditem.DisplayLayout.Bands[0].Columns["OTAmount"].CellAppearance.TextHAlign = (dataGriditem.DisplayLayout.Bands[0].Columns["GrossSalary"].CellAppearance.TextHAlign = HAlign.Right);
				AppearanceBase cellAppearance = dataGriditem.DisplayLayout.Bands[0].Columns["GrossSalary"].CellAppearance;
				AppearanceBase cellAppearance2 = dataGriditem.DisplayLayout.Bands[0].Columns["EmployeeID"].CellAppearance;
				Color color = dataGriditem.DisplayLayout.Bands[0].Columns["Name"].CellAppearance.BackColor = Color.WhiteSmoke;
				Color color4 = cellAppearance.BackColor = (cellAppearance2.BackColor = color);
				AppearanceBase cellAppearance3 = dataGriditem.DisplayLayout.Bands[0].Columns["OTAmount"].CellAppearance;
				AppearanceBase cellAppearance4 = dataGriditem.DisplayLayout.Bands[0].Columns["GrossSalary"].CellAppearance;
				AppearanceBase cellAppearance5 = dataGriditem.DisplayLayout.Bands[0].Columns["EmployeeID"].CellAppearance;
				Color color5 = dataGriditem.DisplayLayout.Bands[0].Columns["Name"].CellAppearance.BackColorDisabled = Color.WhiteSmoke;
				color = (cellAppearance5.BackColorDisabled = color5);
				color4 = (cellAppearance3.BackColorDisabled = (cellAppearance4.BackColorDisabled = color));
				string text2 = dataGriditem.DisplayLayout.Bands[0].Columns["OTAmount"].Format = (dataGriditem.DisplayLayout.Bands[0].Columns["GrossSalary"].Format = Format.GridAmountFormat);
				dataGriditem.DisplayLayout.Override.TemplateAddRowPrompt = "";
				dataGriditem.AllowAddNew = false;
				dataGriditem.DisplayLayout.Bands[0].Override.AllowAddNew = AllowAddNew.No;
				dataGriditem.DisplayLayout.Bands[1].Columns["Amount"].CellAppearance.TextHAlign = HAlign.Right;
				dataGriditem.DisplayLayout.Bands[1].Columns["Amount"].Format = Format.GridAmountFormat;
				dataGriditem.DisplayLayout.Bands[1].Columns["Amount"].CellAppearance.BackColor = Color.WhiteSmoke;
				dataGriditem.DisplayLayout.Bands[1].Columns["Amount"].CellAppearance.BackColorDisabled = Color.WhiteSmoke;
				dataGriditem.DisplayLayout.Bands[1].Columns["Project"].ValueList = comboBoxJob;
				dataGriditem.DisplayLayout.Bands[1].Columns["CostCategory"].ValueList = ComboBoxcostCategory;
				dataGriditem.DisplayLayout.Bands[1].Override.AllowAddNew = AllowAddNew.TemplateOnBottom;
				dataGriditem.DisplayLayout.Bands[0].Override.AllowAddNew = AllowAddNew.No;
				dataGriditem.DisplayLayout.Bands[0].Columns["GrossSalary"].Header.Caption = "Salary";
			}
			catch (Exception e)
			{
				dataGridItems.LoadLayoutFailed = true;
				ErrorHelper.ProcessError(e);
			}
		}

		private void buttonSave_Click(object sender, EventArgs e)
		{
			SaveData();
			dataGriditem.Focus();
		}

		public void LoadData(string voucherID)
		{
			try
			{
				if (!base.IsDisposed && !(voucherID.Trim() == "") && CanClose())
				{
					currentData = Factory.ProjectExpenseAllocationSystem.GetProjectExpenseAllocationByID(SystemDocID, voucherID);
					if (currentData != null)
					{
						FillData();
						IsNewRecord = false;
						formManager.ResetDirty();
					}
				}
			}
			catch (Exception e)
			{
				ErrorHelper.ProcessError(e);
			}
		}

		private void FillData()
		{
			if (currentData != null && currentData.Tables.Count != 0 && currentData.Tables[0].Rows.Count != 0)
			{
				DataRow dataRow = currentData.Tables["Project_Expense_Allocation"].Rows[0];
				dateTimePickerDate.Value = DateTime.Parse(dataRow["TransactionDate"].ToString());
				textBoxVoucherNumber.Text = dataRow["VoucherID"].ToString();
				textBoxRef1.Text = dataRow["Reference"].ToString();
				comboBoxSysDoc.SelectedID = dataRow["SysDocID"].ToString();
				if (dataRow["IsVoid"] != DBNull.Value)
				{
					IsVoid = bool.Parse(dataRow["IsVoid"].ToString());
				}
				else
				{
					IsVoid = false;
				}
				textBoxNote.Text = dataRow["Description"].ToString();
				DataSet obj = dataGriditem.DataSource as DataSet;
				obj.Tables[1].Rows.Clear();
				obj.Tables[0].Rows.Clear();
				SetupGrid();
				DataSet dataSet = dataGriditem.DataSource as DataSet;
				DataTable dataTable = dataSet.Tables["ExpenseAllocation"];
				if (currentData.Tables.Contains("Project_Expense_Allocation_Detail") && currentData.ProjectExpenseAllocationDetailTable.Rows.Count != 0)
				{
					_ = currentData.Tables["Project_Expense_Allocation_Detail"].DefaultView.ToTable("DistinctTable", true, "EmployeeID").Rows.Count;
					string a = "";
					foreach (DataRow row in currentData.Tables["Project_Expense_Allocation_Detail"].Rows)
					{
						DataRow dataRow3 = dataTable.NewRow();
						string b = row["EmployeeName"].ToString();
						if (a != b)
						{
							dataRow3["SheetSysDocID"] = row["SheetSysDocID"];
							dataRow3["SheetVoucherID"] = row["SheetVoucherID"];
							dataRow3["SheetRowIndex"] = row["RowIndex"];
							dataRow3["EmployeeID"] = row["EmployeeID"];
							dataRow3["Name"] = row["EmployeeName"];
							dataRow3["OTAmount"] = row["OTAmount"];
							dataRow3["GrossSalary"] = row["GrossSalary"];
							a = row["EmployeeName"].ToString();
							dataRow3.EndEdit();
							dataTable.Rows.Add(dataRow3);
						}
					}
					dataTable.AcceptChanges();
					DataTable dataTable2 = dataSet.Tables["ExpenseAllocationDetails"];
					foreach (DataRow row2 in currentData.Tables["Project_Expense_Allocation_Detail"].Rows)
					{
						DataRow dataRow5 = dataTable2.NewRow();
						dataRow5["EmployeeID"] = row2["EmployeeID"];
						dataRow5["Project"] = row2["ProjectID"];
						dataRow5["CostCategory"] = row2["CostCategoryID"];
						dataRow5["Amount"] = row2["Amount"];
						dataRow5["Hours"] = row2["Hours"];
						dataRow5.EndEdit();
						dataTable2.Rows.Add(dataRow5);
					}
					dataTable2.AcceptChanges();
					textBoxSheetName.Text = currentData.Tables["Project_Expense_Allocation_Detail"].Rows[0]["SheetName"].ToString();
					textBoxMonth.Text = currentData.Tables["Project_Expense_Allocation_Detail"].Rows[0]["Month"].ToString();
					textBoxYear.Text = currentData.Tables["Project_Expense_Allocation_Detail"].Rows[0]["Year"].ToString();
					CalculateTotal();
				}
			}
		}

		private bool SaveData()
		{
			if (!IsDirty)
			{
				if (!IsNewRecord)
				{
					IsNewRecord = true;
					ClearForm();
				}
				return true;
			}
			if (!IsNewRecord)
			{
				switch (ErrorHelper.QuestionMessageYesNoCancel(UIMessages.DoYouWantToSave))
				{
				case DialogResult.No:
					return true;
				case DialogResult.Cancel:
					return false;
				}
			}
			if (!ValidateData())
			{
				return false;
			}
			if (!GetData())
			{
				return false;
			}
			try
			{
				bool flag = (!isNewRecord) ? Factory.ProjectExpenseAllocationSystem.CreateProjectExpenseAllocation(currentData, isUpdate: true) : Factory.ProjectExpenseAllocationSystem.CreateProjectExpenseAllocation(currentData, isUpdate: false);
				if (!flag)
				{
					ErrorHelper.ErrorMessage(UIMessages.UnableToSave);
				}
				else
				{
					IsNewRecord = true;
					ClearForm();
				}
				return flag;
			}
			catch (CompanyException ex)
			{
				if (ex.Number == 1046)
				{
					string nextVoucherNumber = GetNextVoucherNumber();
					if (nextVoucherNumber == textBoxVoucherNumber.Text)
					{
						ErrorHelper.WarningMessage(UIMessages.DocumentNumberInUse);
						return false;
					}
					if (nextVoucherNumber != "")
					{
						textBoxVoucherNumber.Text = nextVoucherNumber;
					}
					formManager.SetControlDirtyStatus(textBoxVoucherNumber, textBoxVoucherNumber.Text);
					return SaveData();
				}
				ErrorHelper.ProcessError(ex);
				return false;
			}
			catch (Exception e)
			{
				ErrorHelper.ProcessError(e);
				return false;
			}
		}

		private bool ValidateData()
		{
			if (isNewRecord && dateTimePickerDate.Value < DateTime.Today && !Security.IsAllowedSecurityRole(GeneralSecurityRoles.EnterBackDatedTransaction))
			{
				ErrorHelper.WarningMessage("You are not allowed to enter back-dated transactions.");
				return false;
			}
			if (isNewRecord && dateTimePickerDate.Value > DateTime.Today && !Security.IsAllowedSecurityRole(GeneralSecurityRoles.FutureDatedTransaction))
			{
				ErrorHelper.WarningMessage("You are not allowed to enter future-dated transactions.");
				return false;
			}
			ArrayList arrayList = new ArrayList();
			if (dataGriditem.Rows.Count <= 0)
			{
				return false;
			}
			foreach (object item in arrayList)
			{
				decimal d = default(decimal);
				DataTable dataTable = dataGriditem.DataSource as DataTable;
				if (dataTable == null)
				{
					ErrorHelper.ErrorMessage("There is no item in the list.");
					return false;
				}
				DataRow[] array = dataTable.Select("[Emp ID]='" + item.ToString() + "'");
				foreach (DataRow dataRow in array)
				{
					if (byte.Parse(dataRow["Pay Type"].ToString()) == 1)
					{
						d += decimal.Parse(dataRow["Amount"].ToString());
					}
					else
					{
						d -= decimal.Parse(dataRow["Amount"].ToString());
					}
				}
				if (d < 0m)
				{
					ErrorHelper.InformationMessage("Total payments for each employee cannot be negative. Employee:" + item.ToString());
					return false;
				}
			}
			if (formManager.IsFieldDirty(textBoxVoucherNumber) && Factory.SystemDocumentSystem.ExistDocumentNumber("Project_Expense_Allocation", "VoucherID", SystemDocID, textBoxVoucherNumber.Text))
			{
				ErrorHelper.WarningMessage(UIMessages.DocumentNumberInUse);
				textBoxVoucherNumber.Focus();
				return false;
			}
			return true;
		}

		private void buttonNew_Click(object sender, EventArgs e)
		{
			if (IsNewRecord)
			{
				ClearForm();
			}
			else if (SaveData())
			{
				ClearForm();
				IsNewRecord = true;
			}
		}

		private void ClearForm()
		{
			try
			{
				textBoxNote.Clear();
				textBoxRef1.Clear();
				dateTimePickerDate.Value = DateTime.Now;
				IsNewRecord = true;
				textBoxVoucherNumber.Text = GetNextVoucherNumber();
				textBoxSheetName.Clear();
				textBoxMonth.Clear();
				textBoxYear.Clear();
				comboBoxSysDoc.SetDefaultID(Security.DefaultTransactionLocationID);
				DataSet obj = dataGriditem.DataSource as DataSet;
				obj.Tables[1].Rows.Clear();
				obj.Tables[0].Rows.Clear();
				IsVoid = false;
				formManager.ResetDirty();
				dateTimePickerDate.Value = DateTime.Now;
				dateTimePickerDate.Focus();
			}
			catch (Exception e)
			{
				ErrorHelper.ProcessError(e);
			}
		}

		private void JournalLeaveGroupDetailsForm_Validating(object sender, CancelEventArgs e)
		{
		}

		private void JournalLeaveGroupDetailsForm_Validated(object sender, EventArgs e)
		{
		}

		private void buttonDelete_Click(object sender, EventArgs e)
		{
			if (Delete())
			{
				ClearForm();
				IsNewRecord = true;
			}
		}

		private bool Delete()
		{
			try
			{
				if (ErrorHelper.QuestionMessageYesNo(UIMessages.DeleteRecord) == DialogResult.No)
				{
					return false;
				}
				return Factory.ProjectExpenseAllocationSystem.DeleteProjectExpenseAllocation(SystemDocID, textBoxVoucherNumber.Text);
			}
			catch (Exception e)
			{
				ErrorHelper.ProcessError(e);
				return false;
			}
		}

		private void xpButton1_Click(object sender, EventArgs e)
		{
			Close();
		}

		private void toolStripButtonNext_Click(object sender, EventArgs e)
		{
			string nextID = DatabaseHelper.GetNextID("Project_Expense_Allocation", "VoucherID", textBoxVoucherNumber.Text, "SysDocID", SystemDocID, "", 4);
			if (!(nextID == ""))
			{
				LoadData(nextID);
			}
		}

		private void toolStripButtonPrevious_Click(object sender, EventArgs e)
		{
			string previousID = DatabaseHelper.GetPreviousID("Project_Expense_Allocation", "VoucherID", textBoxVoucherNumber.Text, "SysDocID", SystemDocID, "", 4);
			if (!(previousID == ""))
			{
				LoadData(previousID);
			}
		}

		private void toolStripButtonLast_Click(object sender, EventArgs e)
		{
			string lastID = DatabaseHelper.GetLastID("Project_Expense_Allocation", "VoucherID", "SysDocID", SystemDocID, "", 4);
			if (!(lastID == ""))
			{
				LoadData(lastID);
			}
		}

		private void toolStripButtonFirst_Click(object sender, EventArgs e)
		{
			string firstID = DatabaseHelper.GetFirstID("Project_Expense_Allocation", "VoucherID", "SysDocID", SystemDocID, "", 4);
			if (!(firstID == ""))
			{
				LoadData(firstID);
			}
		}

		private void toolStripButtonFind_Click(object sender, EventArgs e)
		{
			try
			{
				if (toolStripTextBoxFind.Text.Trim() == "")
				{
					toolStripTextBoxFind.Focus();
				}
				else
				{
					string text = Factory.DatabaseSystem.FindDocumentByNumber("Project_Expense_Allocation", "VoucherID", SystemDocID, "", 3, toolStripTextBoxFind.Text);
					if (text != "")
					{
						LoadData(text);
					}
					else
					{
						ErrorHelper.InformationMessage(UIMessages.DocumentNotFound);
						toolStripTextBoxFind.SelectAll();
						toolStripTextBoxFind.Focus();
					}
				}
			}
			catch (Exception e2)
			{
				ErrorHelper.ProcessError(e2);
			}
		}

		public void OnActivated()
		{
		}

		private void AccountGroupDetailsForm_FormClosing(object sender, FormClosingEventArgs e)
		{
			if (!CanClose())
			{
				e.Cancel = true;
			}
		}

		private bool CanClose()
		{
			if (IsDirty)
			{
				BringToFront();
				if (IsNewRecord)
				{
					switch (ErrorHelper.QuestionMessageYesNoCancel(UIMessages.DoYouWantToSave))
					{
					case DialogResult.Yes:
						if (!SaveData())
						{
							return false;
						}
						break;
					default:
						return false;
					case DialogResult.No:
						break;
					}
				}
				else if (!SaveData())
				{
					return false;
				}
			}
			return true;
		}

		private void JournalLeavesForm_Load(object sender, EventArgs e)
		{
			try
			{
				dataGriditem.SetupUI();
				SetupGrid();
				SetSecurity();
				if (!base.IsDisposed)
				{
					IsNewRecord = true;
					ClearForm();
					comboBoxSysDoc.FilterByType(SysDocTypes.ProjectExpenseAllocation);
				}
			}
			catch (Exception e2)
			{
				dataGridItems.LoadLayoutFailed = true;
				ErrorHelper.ProcessError(e2);
			}
		}

		private void SetSecurity()
		{
			screenRight = Security.GetScreenAccessRight(base.Name);
			if (!screenRight.View)
			{
				ErrorHelper.ErrorMessage(UIMessages.NoPermissionView);
				Close();
			}
			else if (!Security.IsAllowedSecurityRole(GeneralSecurityRoles.ChangeDocNumber))
			{
				textBoxVoucherNumber.ReadOnly = true;
			}
		}

		private void dataGriditem_AfterCellActivate(object sender, EventArgs e)
		{
			if (dataGriditem.ActiveRow != null)
			{
				_ = dataGriditem.ActiveCell;
			}
		}

		private void ultraFormattedLinkLabel2_LinkClicked(object sender, Infragistics.Win.FormattedLinkLabel.LinkClickedEventArgs e)
		{
			textBoxVoucherNumber.Text = GetNextVoucherNumber();
		}

		private string GetNextVoucherNumber()
		{
			try
			{
				if (!IsNewRecord)
				{
					return textBoxVoucherNumber.Text;
				}
				return Factory.SystemDocumentSystem.GetNextDocumentNumber(SystemDocID);
			}
			catch (Exception e)
			{
				ErrorHelper.ProcessError(e);
				return "";
			}
		}

		private void buttonVoid_Click(object sender, EventArgs e)
		{
			if (Void(!IsVoid))
			{
				IsVoid = !IsVoid;
			}
		}

		private bool Void(bool isVoid)
		{
			try
			{
				DialogResult dialogResult = (!isVoid) ? ErrorHelper.QuestionMessageYesNo(UIMessages.WantToUnvoid) : ErrorHelper.QuestionMessageYesNo(UIMessages.WantToVoid);
				if (dialogResult == DialogResult.No)
				{
					return false;
				}
				return Factory.ProjectExpenseAllocationSystem.VoidProjectExpenseAllocation(SystemDocID, textBoxVoucherNumber.Text, isVoid);
			}
			catch (Exception e)
			{
				ErrorHelper.ProcessError(e);
				return false;
			}
		}

		private void ultraFormattedLinkLabel5_LinkClicked(object sender, Infragistics.Win.FormattedLinkLabel.LinkClickedEventArgs e)
		{
			new FormHelper().EditSysDoc(comboBoxSysDoc.SelectedID, SysDocTypes.ProjectExpenseAllocation);
		}

		private void buttonSelectSalarySheet_Click(object sender, EventArgs e)
		{
			try
			{
				DataSet openSalarySheets = Factory.SalarySheetSystem.GetOpenSalarySheets();
				SelectDocumentDialog selectDocumentDialog = new SelectDocumentDialog();
				selectDocumentDialog.DataSource = openSalarySheets;
				selectDocumentDialog.Grid.DisplayLayout.Bands[0].Columns["SysDocID"].Hidden = true;
				selectDocumentDialog.Grid.DisplayLayout.Bands[0].Columns["StartDate"].Hidden = true;
				selectDocumentDialog.Grid.DisplayLayout.Bands[0].Columns["EndDate"].Hidden = true;
				selectDocumentDialog.Text = "Select Salary Sheet";
				if (selectDocumentDialog.ShowDialog() == DialogResult.OK)
				{
					string text = "";
					string text2 = "";
					text = selectDocumentDialog.SelectedRow.Cells["SysDocID"].Value.ToString();
					text2 = selectDocumentDialog.SelectedRow.Cells["VoucherID"].Value.ToString();
					textBoxMonth.Text = selectDocumentDialog.SelectedRow.Cells["Month"].Value.ToString();
					textBoxYear.Text = selectDocumentDialog.SelectedRow.Cells["Year"].Value.ToString();
					textBoxSheetName.Text = selectDocumentDialog.SelectedRow.Cells["SheetName"].Value.ToString();
					if (!(text == "") && !(text2 == ""))
					{
						openSalarySheets = Factory.SalarySheetSystem.GetSalarySheetEmployees(text, text2, 1);
						try
						{
							CalculateSalaryForm calculateSalaryForm = new CalculateSalaryForm();
							if (calculateSalaryForm.ShowDialog() != DialogResult.OK)
							{
								return;
							}
							openSalarySheets = Factory.SalarySheetSystem.GeProjectExpenseSalarySheets(calculateSalaryForm.FromEmployee, calculateSalaryForm.ToEmployee, calculateSalaryForm.FromDepartment, calculateSalaryForm.ToDepartment, calculateSalaryForm.FromLocation, calculateSalaryForm.ToLocation, calculateSalaryForm.FromType, calculateSalaryForm.ToType, calculateSalaryForm.FromDivision, calculateSalaryForm.ToDivision, calculateSalaryForm.FromSponsor, calculateSalaryForm.ToSponsor, calculateSalaryForm.FromGroup, calculateSalaryForm.ToGroup, calculateSalaryForm.FromGrade, calculateSalaryForm.ToGrade, calculateSalaryForm.FromPosition, calculateSalaryForm.ToPosition, calculateSalaryForm.FromBank, calculateSalaryForm.ToBank, calculateSalaryForm.FromAccount, calculateSalaryForm.ToAccount, text, text2);
							if (openSalarySheets == null || openSalarySheets.Tables.Count == 0 || openSalarySheets.Tables[0].Rows.Count == 0)
							{
								return;
							}
							tempData = openSalarySheets.Tables["SalarySheet_Detail_Item"];
						}
						catch (Exception e2)
						{
							ErrorHelper.ProcessError(e2);
						}
						DataSet dataSet = dataGriditem.DataSource as DataSet;
						dataSet.Tables[1].Rows.Clear();
						dataSet.Tables[0].Rows.Clear();
						DataTable dataTable = dataSet.Tables["ExpenseAllocation"];
						_ = dataSet.Tables["ExpenseAllocationDetails"];
						foreach (DataRow row in openSalarySheets.Tables["SalarySheet_Detail"].Rows)
						{
							string str = row["EmployeeID"].ToString();
							object value = openSalarySheets.Tables["SalarySheet_Detail_Item"].Compute("sum(PayableAmount)", "EmployeeID = '" + str + "' AND PayType=1");
							object value2 = openSalarySheets.Tables["SalarySheet_Detail_Item"].Compute("sum(Amount)", "EmployeeID = '" + str + "'");
							DataRow dataRow2 = dataTable.NewRow();
							dataRow2["SheetSysDocID"] = row["SysDocID"];
							dataRow2["SheetVoucherID"] = row["VoucherID"];
							dataRow2["SheetRowIndex"] = row["RowIndex"];
							dataRow2["EmployeeID"] = row["EmployeeID"];
							dataRow2["Name"] = row["Name"];
							dataRow2["OTAmount"] = row["OTAmount"];
							dataRow2["GrossSalary"] = value;
							dataRow2["Amount"] = value2;
							dataRow2.EndEdit();
							dataTable.Rows.Add(dataRow2);
						}
						DataTable dataTable2 = dataSet.Tables["ExpenseAllocationDetails"];
						dataTable2.Rows.Clear();
						foreach (DataRow row2 in openSalarySheets.Tables["SalarySheet_Detail"].Rows)
						{
							DataRow dataRow4 = dataTable2.NewRow();
							dataRow4["EmployeeID"] = row2["EmployeeID"];
							dataRow4.EndEdit();
							dataTable2.Rows.Add(dataRow4);
						}
						dataTable2.AcceptChanges();
						CalculateTotal();
					}
				}
			}
			catch (Exception e3)
			{
				ErrorHelper.ProcessError(e3);
			}
		}

		private void ultraFormattedLinkLabel6_LinkClicked(object sender, Infragistics.Win.FormattedLinkLabel.LinkClickedEventArgs e)
		{
		}

		private void toolStripButtonOpenList_Click(object sender, EventArgs e)
		{
			FormActivator.BringFormToFront(FormActivator.ProjectExpenseAllocationFormObj);
		}

		public void EditDocument(string sysDocID, string voucherID)
		{
			if (!comboBoxSysDoc.Enabled && sysDocID != comboBoxSysDoc.SelectedID)
			{
				ErrorHelper.ErrorMessage("Cannot edit this document because you do not have access to this document.");
				return;
			}
			comboBoxSysDoc.SelectedID = sysDocID;
			LoadData(voucherID);
		}

		private void toolStripButtonPrint_Click(object sender, EventArgs e)
		{
			Print(isPrint: true, showPrintDialog: true, saveChanges: true);
		}

		private void toolStripButtonPreview_Click(object sender, EventArgs e)
		{
			Print(isPrint: false, showPrintDialog: false, saveChanges: true);
		}

		private void Print(bool isPrint, bool showPrintDialog, bool saveChanges)
		{
			try
			{
				string selectedID = comboBoxSysDoc.SelectedID;
				string text = textBoxVoucherNumber.Text;
				DataSet employeeSalaryToPrint = Factory.ProjectExpenseAllocationSystem.GetEmployeeSalaryToPrint(selectedID, text);
				if (employeeSalaryToPrint == null || employeeSalaryToPrint.Tables.Count == 0)
				{
					ErrorHelper.ErrorMessage("Cannot print the document.", "Document not found.");
				}
				else
				{
					PrintHelper.PrintDocument(employeeSalaryToPrint, selectedID, "Bank Transfer Salary", SysDocTypes.ProjectExpenseAllocation, isPrint, showPrintDialog);
				}
			}
			catch (Exception e)
			{
				ErrorHelper.ProcessError(e);
			}
		}

		public void ShowForApproval(string sysDocID, string voucherID, int approvalTaskID)
		{
			EditDocument(sysDocID, voucherID);
			panelButtons.Visible = false;
			toolStrip1.Enabled = false;
			formManager.ShowApprovalPanel(approvalTaskID, "Project_Expense_Allocation", "VoucherID");
		}

		private void toolStripButtonInformation_Click(object sender, EventArgs e)
		{
			if (!isNewRecord)
			{
				FormHelper.ShowDocumentInfo(textBoxVoucherNumber.Text, comboBoxSysDoc.SelectedID, this);
			}
		}

		private void toolStripButtonDistribution_Click(object sender, EventArgs e)
		{
			JournalDistibutionDialog journalDistibutionDialog = new JournalDistibutionDialog();
			journalDistibutionDialog.VoucherID = textBoxVoucherNumber.Text;
			journalDistibutionDialog.SysDocID = comboBoxSysDoc.SelectedID;
			journalDistibutionDialog.ShowDialog(this);
		}

		private void toolStripTextBoxFind_KeyPress(object sender, KeyPressEventArgs e)
		{
			if (e.KeyChar == Convert.ToChar(Keys.Return))
			{
				toolStripButtonFind_Click(sender, e);
			}
		}

		private void ButtonSelectOverTime_Click(object sender, EventArgs e)
		{
			try
			{
				if (dataGriditem.Rows.Count() > 0)
				{
					int num = (from x in DateTimeFormatInfo.CurrentInfo.AbbreviatedMonthNames.ToList()
						select x.ToUpper()).ToList().IndexOf(textBoxMonth.Text.ToUpper());
					DataSet overTimeByPeriod = Factory.OverTimeEntrySystem.GetOverTimeByPeriod(checked(num + 1), int.Parse(textBoxYear.Text));
					SelectDocumentDialog selectDocumentDialog = new SelectDocumentDialog();
					selectDocumentDialog.IsMultiSelect = true;
					selectDocumentDialog.DataSource = overTimeByPeriod;
					selectDocumentDialog.Text = "Select OverTime Sheet";
					if (selectDocumentDialog.ShowDialog() == DialogResult.OK)
					{
						List<UltraGridRow> selectedRows = selectDocumentDialog.SelectedRows;
						string text = "";
						string text2 = "";
						foreach (UltraGridRow item in selectedRows)
						{
							text = text + "'" + item.Cells["sysDocID"].Value.ToString() + "',";
							text2 = text2 + "'" + item.Cells["voucherID"].Value.ToString() + "',";
						}
						text += text.TrimEnd(',');
						text2 += text2.TrimEnd(',');
						if (!(text == "") && !(text2 == ""))
						{
							overTimeByPeriod = Factory.OverTimeEntrySystem.GetOverTimeEntryGroupByJob(text, text2);
							DataTable dataTable = (dataGriditem.DataSource as DataSet).Tables["ExpenseAllocationDetails"];
							foreach (DataRow row in overTimeByPeriod.Tables[0].Rows)
							{
								string emp = row["Employeeid"].ToString();
								string project = row["JobId"].ToString();
								string cost = row["CostCategoryID"].ToString();
								decimal num2 = decimal.Parse(decimal.Parse(row["TotalHours"].ToString()).ToString("n2"));
								decimal d = Math.Truncate(num2);
								TimeSpan timeSpan = TimeSpan.FromMinutes(double.Parse(((num2 - d) * 100m).ToString()));
								decimal hour = decimal.Parse(TimeSpan.FromHours(double.Parse(d.ToString()) + (double)timeSpan.Hours).Hours + "." + timeSpan.Minutes);
								foreach (DataRow item2 in (from DataRow x in dataTable.Rows
									where x["EmployeeId"].ToString() == emp && x["Project"].ToString() == "" && x["Hours"].ToString() == "" && x["Amount"].ToString() == ""
									select x).ToList())
								{
									dataTable.Rows.Remove(item2);
								}
								if ((from DataRow x in dataTable.Rows
									where x["EmployeeId"].ToString().Equals(emp) && x["Project"].ToString().Equals(project) && x["Hours"].ToString().Equals(hour) && x["CostCategory"].ToString().Equals(cost)
									select x).ToList().Count() <= 0)
								{
									UltraGridRow ultraGridRow = dataGriditem.Rows.FirstOrDefault((UltraGridRow r) => r.Cells["EmployeeID"].Value.ToString() == emp);
									if (ultraGridRow != null)
									{
										decimal d2 = decimal.Parse(ultraGridRow.Cells["Amount"].Value.ToString());
										DataRow dataRow2 = dataTable.NewRow();
										dataRow2["EmployeeID"] = emp;
										dataRow2["Project"] = project;
										dataRow2["CostCategory"] = cost;
										dataRow2["Amount"] = (d2 / (decimal)TotalMonthHours * hour).ToString(Format.TotalAmountFormat);
										dataRow2["Hours"] = hour;
										dataRow2.EndEdit();
										dataTable.Rows.Add(dataRow2);
									}
								}
							}
							dataTable.AcceptChanges();
						}
					}
				}
			}
			catch (Exception ex)
			{
				ErrorHelper.ErrorMessage(ex.Message);
			}
		}

		protected override void Dispose(bool disposing)
		{
			if (disposing && components != null)
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		private void InitializeComponent()
		{
			components = new System.ComponentModel.Container();
			Infragistics.Win.Appearance appearance = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance2 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance3 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance4 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance5 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance6 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance7 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance8 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance9 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance10 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance11 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance12 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance13 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance14 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance15 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance16 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance17 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance18 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance19 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance20 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance21 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance22 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance23 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance24 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance25 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance26 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance27 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance28 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance29 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance30 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance31 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance32 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance33 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance34 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance35 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance36 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance37 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance38 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance39 = new Infragistics.Win.Appearance();
			Infragistics.Win.Appearance appearance40 = new Infragistics.Win.Appearance();
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Micromind.ClientUI.WindowsForms.DataEntries.Employees.ProjectExpenseAllocationForm));
			panelButtons = new System.Windows.Forms.Panel();
			buttonVoid = new Micromind.UISupport.XPButton();
			buttonDelete = new Micromind.UISupport.XPButton();
			buttonNew = new Micromind.UISupport.XPButton();
			linePanelDown = new Micromind.UISupport.Line();
			xpButton1 = new Micromind.UISupport.XPButton();
			buttonSave = new Micromind.UISupport.XPButton();
			dateTimePickerDate = new System.Windows.Forms.DateTimePicker();
			textBoxVoucherNumber = new System.Windows.Forms.TextBox();
			label1 = new System.Windows.Forms.Label();
			textBoxRef1 = new System.Windows.Forms.TextBox();
			textBoxNote = new System.Windows.Forms.TextBox();
			label3 = new System.Windows.Forms.Label();
			ultraFormattedLinkLabel2 = new Infragistics.Win.FormattedLinkLabel.UltraFormattedLinkLabel();
			panelDetails = new System.Windows.Forms.Panel();
			ButtonSelectOverTime = new Micromind.UISupport.XPButton();
			comboBoxSysDoc = new Micromind.DataControls.SysDocComboBox();
			label6 = new System.Windows.Forms.Label();
			label5 = new System.Windows.Forms.Label();
			label4 = new System.Windows.Forms.Label();
			textBoxSheetName = new System.Windows.Forms.TextBox();
			textBoxYear = new System.Windows.Forms.TextBox();
			textBoxMonth = new System.Windows.Forms.TextBox();
			ultraFormattedLinkLabel5 = new Infragistics.Win.FormattedLinkLabel.UltraFormattedLinkLabel();
			mmLabel1 = new Micromind.UISupport.MMLabel();
			labelVoided = new System.Windows.Forms.Label();
			toolStripButtonFirst = new System.Windows.Forms.ToolStripButton();
			toolStripButtonPrevious = new System.Windows.Forms.ToolStripButton();
			toolStripButtonNext = new System.Windows.Forms.ToolStripButton();
			toolStripButtonLast = new System.Windows.Forms.ToolStripButton();
			toolStripTextBoxFind = new System.Windows.Forms.ToolStripTextBox();
			toolStripButtonFind = new System.Windows.Forms.ToolStripButton();
			toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
			toolStrip1 = new System.Windows.Forms.ToolStrip();
			toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
			toolStripButtonOpenList = new System.Windows.Forms.ToolStripButton();
			toolStripButtonPrint = new System.Windows.Forms.ToolStripButton();
			toolStripButtonPreview = new System.Windows.Forms.ToolStripButton();
			toolStripButtonDistribution = new System.Windows.Forms.ToolStripButton();
			toolStripButtonInformation = new System.Windows.Forms.ToolStripButton();
			comboBoxJob = new Micromind.DataControls.JobComboBox();
			buttonSelectSalarySheet = new Micromind.UISupport.XPButton();
			formManager = new Micromind.DataControls.FormManager();
			dataGriditem = new Micromind.DataControls.DataEntryGrid();
			ComboBoxcostCategory = new Micromind.DataControls.CostCategoryComboBox();
			panelButtons.SuspendLayout();
			panelDetails.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)comboBoxSysDoc).BeginInit();
			toolStrip1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)comboBoxJob).BeginInit();
			((System.ComponentModel.ISupportInitialize)dataGriditem).BeginInit();
			((System.ComponentModel.ISupportInitialize)ComboBoxcostCategory).BeginInit();
			SuspendLayout();
			panelButtons.Controls.Add(buttonVoid);
			panelButtons.Controls.Add(buttonDelete);
			panelButtons.Controls.Add(buttonNew);
			panelButtons.Controls.Add(linePanelDown);
			panelButtons.Controls.Add(xpButton1);
			panelButtons.Controls.Add(buttonSave);
			panelButtons.Dock = System.Windows.Forms.DockStyle.Bottom;
			panelButtons.Location = new System.Drawing.Point(0, 496);
			panelButtons.Name = "panelButtons";
			panelButtons.Size = new System.Drawing.Size(792, 40);
			panelButtons.TabIndex = 4;
			buttonVoid.AdjustImageLocation = new System.Drawing.Point(0, 0);
			buttonVoid.BackColor = System.Drawing.Color.DarkGray;
			buttonVoid.BtnShape = Micromind.UISupport.BtnShape.Rectangle;
			buttonVoid.BtnStyle = Micromind.UISupport.XPStyle.Default;
			buttonVoid.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			buttonVoid.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			buttonVoid.Location = new System.Drawing.Point(216, 8);
			buttonVoid.Name = "buttonVoid";
			buttonVoid.Size = new System.Drawing.Size(96, 24);
			buttonVoid.TabIndex = 2;
			buttonVoid.Text = "&Void";
			buttonVoid.UseVisualStyleBackColor = false;
			buttonVoid.Click += new System.EventHandler(buttonVoid_Click);
			buttonDelete.AdjustImageLocation = new System.Drawing.Point(0, 0);
			buttonDelete.BackColor = System.Drawing.Color.DarkGray;
			buttonDelete.BtnShape = Micromind.UISupport.BtnShape.Rectangle;
			buttonDelete.BtnStyle = Micromind.UISupport.XPStyle.Default;
			buttonDelete.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			buttonDelete.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			buttonDelete.Location = new System.Drawing.Point(318, 8);
			buttonDelete.Name = "buttonDelete";
			buttonDelete.Size = new System.Drawing.Size(96, 24);
			buttonDelete.TabIndex = 3;
			buttonDelete.Text = "De&lete";
			buttonDelete.UseVisualStyleBackColor = false;
			buttonDelete.Click += new System.EventHandler(buttonDelete_Click);
			buttonNew.AdjustImageLocation = new System.Drawing.Point(0, 0);
			buttonNew.BackColor = System.Drawing.Color.DarkGray;
			buttonNew.BtnShape = Micromind.UISupport.BtnShape.Rectangle;
			buttonNew.BtnStyle = Micromind.UISupport.XPStyle.Default;
			buttonNew.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			buttonNew.Location = new System.Drawing.Point(114, 8);
			buttonNew.Name = "buttonNew";
			buttonNew.Size = new System.Drawing.Size(96, 24);
			buttonNew.TabIndex = 1;
			buttonNew.Text = "Ne&w...";
			buttonNew.UseVisualStyleBackColor = false;
			buttonNew.Click += new System.EventHandler(buttonNew_Click);
			linePanelDown.BackColor = System.Drawing.Color.White;
			linePanelDown.Dock = System.Windows.Forms.DockStyle.Top;
			linePanelDown.DrawWidth = 1;
			linePanelDown.IsVertical = false;
			linePanelDown.LineBackColor = System.Drawing.Color.Silver;
			linePanelDown.Location = new System.Drawing.Point(0, 0);
			linePanelDown.Name = "linePanelDown";
			linePanelDown.Size = new System.Drawing.Size(792, 1);
			linePanelDown.TabIndex = 14;
			linePanelDown.TabStop = false;
			xpButton1.AdjustImageLocation = new System.Drawing.Point(0, 0);
			xpButton1.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right);
			xpButton1.BackColor = System.Drawing.Color.DarkGray;
			xpButton1.BtnShape = Micromind.UISupport.BtnShape.Rectangle;
			xpButton1.BtnStyle = Micromind.UISupport.XPStyle.Default;
			xpButton1.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			xpButton1.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			xpButton1.Location = new System.Drawing.Point(682, 8);
			xpButton1.Name = "xpButton1";
			xpButton1.Size = new System.Drawing.Size(96, 24);
			xpButton1.TabIndex = 4;
			xpButton1.Text = "&Close";
			xpButton1.UseVisualStyleBackColor = false;
			xpButton1.Click += new System.EventHandler(xpButton1_Click);
			buttonSave.AdjustImageLocation = new System.Drawing.Point(0, 0);
			buttonSave.BackColor = System.Drawing.Color.Silver;
			buttonSave.BtnShape = Micromind.UISupport.BtnShape.Rectangle;
			buttonSave.BtnStyle = Micromind.UISupport.XPStyle.Default;
			buttonSave.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			buttonSave.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			buttonSave.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			buttonSave.Location = new System.Drawing.Point(12, 8);
			buttonSave.Name = "buttonSave";
			buttonSave.Size = new System.Drawing.Size(96, 24);
			buttonSave.TabIndex = 0;
			buttonSave.Text = "&Save";
			buttonSave.UseVisualStyleBackColor = false;
			buttonSave.Click += new System.EventHandler(buttonSave_Click);
			dateTimePickerDate.Format = System.Windows.Forms.DateTimePickerFormat.Short;
			dateTimePickerDate.Location = new System.Drawing.Point(472, 3);
			dateTimePickerDate.Name = "dateTimePickerDate";
			dateTimePickerDate.Size = new System.Drawing.Size(107, 20);
			dateTimePickerDate.TabIndex = 4;
			textBoxVoucherNumber.Location = new System.Drawing.Point(264, 3);
			textBoxVoucherNumber.Name = "textBoxVoucherNumber";
			textBoxVoucherNumber.Size = new System.Drawing.Size(138, 20);
			textBoxVoucherNumber.TabIndex = 3;
			label1.AutoSize = true;
			label1.Location = new System.Drawing.Point(9, 29);
			label1.Name = "label1";
			label1.Size = new System.Drawing.Size(60, 13);
			label1.TabIndex = 20;
			label1.Text = "Reference:";
			textBoxRef1.Location = new System.Drawing.Point(91, 27);
			textBoxRef1.Name = "textBoxRef1";
			textBoxRef1.Size = new System.Drawing.Size(175, 20);
			textBoxRef1.TabIndex = 8;
			textBoxNote.Location = new System.Drawing.Point(91, 96);
			textBoxNote.Name = "textBoxNote";
			textBoxNote.Size = new System.Drawing.Size(536, 20);
			textBoxNote.TabIndex = 14;
			label3.AutoSize = true;
			label3.Location = new System.Drawing.Point(12, 99);
			label3.Name = "label3";
			label3.Size = new System.Drawing.Size(33, 13);
			label3.TabIndex = 20;
			label3.Text = "Note:";
			appearance.FontData.BoldAsString = "True";
			appearance.FontData.Name = "Tahoma";
			ultraFormattedLinkLabel2.Appearance = appearance;
			ultraFormattedLinkLabel2.AutoSize = true;
			ultraFormattedLinkLabel2.Location = new System.Drawing.Point(203, 6);
			ultraFormattedLinkLabel2.Name = "ultraFormattedLinkLabel2";
			ultraFormattedLinkLabel2.Size = new System.Drawing.Size(53, 15);
			ultraFormattedLinkLabel2.TabIndex = 2;
			ultraFormattedLinkLabel2.TabStop = true;
			ultraFormattedLinkLabel2.TreatValueAs = Infragistics.Win.FormattedLinkLabel.TreatValueAs.URL;
			ultraFormattedLinkLabel2.UnderlineLinks = Infragistics.Win.FormattedLinkLabel.UnderlineLink.WhenHovered;
			ultraFormattedLinkLabel2.Value = "Number:";
			appearance2.ForeColor = System.Drawing.Color.Blue;
			ultraFormattedLinkLabel2.VisitedLinkAppearance = appearance2;
			ultraFormattedLinkLabel2.LinkClicked += new Infragistics.Win.FormattedLinkLabel.LinkClickedEventHandler(ultraFormattedLinkLabel2_LinkClicked);
			panelDetails.Controls.Add(ButtonSelectOverTime);
			panelDetails.Controls.Add(comboBoxSysDoc);
			panelDetails.Controls.Add(label6);
			panelDetails.Controls.Add(label5);
			panelDetails.Controls.Add(label4);
			panelDetails.Controls.Add(textBoxSheetName);
			panelDetails.Controls.Add(textBoxYear);
			panelDetails.Controls.Add(textBoxMonth);
			panelDetails.Controls.Add(ultraFormattedLinkLabel5);
			panelDetails.Controls.Add(ultraFormattedLinkLabel2);
			panelDetails.Controls.Add(mmLabel1);
			panelDetails.Controls.Add(label3);
			panelDetails.Controls.Add(textBoxNote);
			panelDetails.Controls.Add(label1);
			panelDetails.Controls.Add(textBoxRef1);
			panelDetails.Controls.Add(textBoxVoucherNumber);
			panelDetails.Controls.Add(dateTimePickerDate);
			panelDetails.Location = new System.Drawing.Point(0, 32);
			panelDetails.Name = "panelDetails";
			panelDetails.Size = new System.Drawing.Size(780, 118);
			panelDetails.TabIndex = 0;
			ButtonSelectOverTime.AdjustImageLocation = new System.Drawing.Point(0, 0);
			ButtonSelectOverTime.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right);
			ButtonSelectOverTime.BackColor = System.Drawing.Color.DarkGray;
			ButtonSelectOverTime.BtnShape = Micromind.UISupport.BtnShape.Rectangle;
			ButtonSelectOverTime.BtnStyle = Micromind.UISupport.XPStyle.Default;
			ButtonSelectOverTime.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			ButtonSelectOverTime.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			ButtonSelectOverTime.Location = new System.Drawing.Point(655, 88);
			ButtonSelectOverTime.Name = "ButtonSelectOverTime";
			ButtonSelectOverTime.Size = new System.Drawing.Size(122, 24);
			ButtonSelectOverTime.TabIndex = 144;
			ButtonSelectOverTime.Text = "Select OverTime";
			ButtonSelectOverTime.UseVisualStyleBackColor = false;
			ButtonSelectOverTime.Click += new System.EventHandler(ButtonSelectOverTime_Click);
			comboBoxSysDoc.Assigned = false;
			comboBoxSysDoc.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
			comboBoxSysDoc.CustomReportFieldName = "";
			comboBoxSysDoc.CustomReportKey = "";
			comboBoxSysDoc.CustomReportValueType = 1;
			comboBoxSysDoc.DescriptionTextBox = null;
			appearance3.BackColor = System.Drawing.SystemColors.Window;
			appearance3.BorderColor = System.Drawing.SystemColors.InactiveCaption;
			comboBoxSysDoc.DisplayLayout.Appearance = appearance3;
			comboBoxSysDoc.DisplayLayout.BorderStyle = Infragistics.Win.UIElementBorderStyle.Solid;
			comboBoxSysDoc.DisplayLayout.CaptionVisible = Infragistics.Win.DefaultableBoolean.False;
			appearance4.BackColor = System.Drawing.SystemColors.ActiveBorder;
			appearance4.BackColor2 = System.Drawing.SystemColors.ControlDark;
			appearance4.BackGradientStyle = Infragistics.Win.GradientStyle.Vertical;
			appearance4.BorderColor = System.Drawing.SystemColors.Window;
			comboBoxSysDoc.DisplayLayout.GroupByBox.Appearance = appearance4;
			appearance5.ForeColor = System.Drawing.SystemColors.GrayText;
			comboBoxSysDoc.DisplayLayout.GroupByBox.BandLabelAppearance = appearance5;
			comboBoxSysDoc.DisplayLayout.GroupByBox.BorderStyle = Infragistics.Win.UIElementBorderStyle.Solid;
			appearance6.BackColor = System.Drawing.SystemColors.ControlLightLight;
			appearance6.BackColor2 = System.Drawing.SystemColors.Control;
			appearance6.BackGradientStyle = Infragistics.Win.GradientStyle.Horizontal;
			appearance6.ForeColor = System.Drawing.SystemColors.GrayText;
			comboBoxSysDoc.DisplayLayout.GroupByBox.PromptAppearance = appearance6;
			comboBoxSysDoc.DisplayLayout.MaxColScrollRegions = 1;
			comboBoxSysDoc.DisplayLayout.MaxRowScrollRegions = 1;
			appearance7.BackColor = System.Drawing.SystemColors.Window;
			appearance7.ForeColor = System.Drawing.SystemColors.ControlText;
			comboBoxSysDoc.DisplayLayout.Override.ActiveCellAppearance = appearance7;
			appearance8.BackColor = System.Drawing.SystemColors.Highlight;
			appearance8.ForeColor = System.Drawing.SystemColors.HighlightText;
			comboBoxSysDoc.DisplayLayout.Override.ActiveRowAppearance = appearance8;
			comboBoxSysDoc.DisplayLayout.Override.BorderStyleCell = Infragistics.Win.UIElementBorderStyle.Dotted;
			comboBoxSysDoc.DisplayLayout.Override.BorderStyleRow = Infragistics.Win.UIElementBorderStyle.Dotted;
			appearance9.BackColor = System.Drawing.SystemColors.Window;
			comboBoxSysDoc.DisplayLayout.Override.CardAreaAppearance = appearance9;
			appearance10.BorderColor = System.Drawing.Color.Silver;
			appearance10.TextTrimming = Infragistics.Win.TextTrimming.EllipsisCharacter;
			comboBoxSysDoc.DisplayLayout.Override.CellAppearance = appearance10;
			comboBoxSysDoc.DisplayLayout.Override.CellClickAction = Infragistics.Win.UltraWinGrid.CellClickAction.EditAndSelectText;
			comboBoxSysDoc.DisplayLayout.Override.CellPadding = 0;
			appearance11.BackColor = System.Drawing.SystemColors.Control;
			appearance11.BackColor2 = System.Drawing.SystemColors.ControlDark;
			appearance11.BackGradientAlignment = Infragistics.Win.GradientAlignment.Element;
			appearance11.BackGradientStyle = Infragistics.Win.GradientStyle.Horizontal;
			appearance11.BorderColor = System.Drawing.SystemColors.Window;
			comboBoxSysDoc.DisplayLayout.Override.GroupByRowAppearance = appearance11;
			appearance12.TextHAlignAsString = "Left";
			comboBoxSysDoc.DisplayLayout.Override.HeaderAppearance = appearance12;
			comboBoxSysDoc.DisplayLayout.Override.HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction.SortMulti;
			comboBoxSysDoc.DisplayLayout.Override.HeaderStyle = Infragistics.Win.HeaderStyle.WindowsXPCommand;
			appearance13.BackColor = System.Drawing.SystemColors.Window;
			appearance13.BorderColor = System.Drawing.Color.Silver;
			comboBoxSysDoc.DisplayLayout.Override.RowAppearance = appearance13;
			comboBoxSysDoc.DisplayLayout.Override.RowSelectors = Infragistics.Win.DefaultableBoolean.False;
			appearance14.BackColor = System.Drawing.SystemColors.ControlLight;
			comboBoxSysDoc.DisplayLayout.Override.TemplateAddRowAppearance = appearance14;
			comboBoxSysDoc.DisplayLayout.ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds.ScrollToFill;
			comboBoxSysDoc.DisplayLayout.ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle.Immediate;
			comboBoxSysDoc.DisplayLayout.ViewStyleBand = Infragistics.Win.UltraWinGrid.ViewStyleBand.OutlookGroupBy;
			comboBoxSysDoc.DivisionID = "";
			comboBoxSysDoc.DropDownSearchMethod = Infragistics.Win.UltraWinGrid.DropDownSearchMethod.Linear;
			comboBoxSysDoc.DropDownStyle = Infragistics.Win.UltraWinGrid.UltraComboStyle.DropDownList;
			comboBoxSysDoc.Editable = true;
			comboBoxSysDoc.ExcludeFromSecurity = false;
			comboBoxSysDoc.FilterString = "";
			comboBoxSysDoc.HasAllAccount = false;
			comboBoxSysDoc.HasCustom = false;
			comboBoxSysDoc.IsDataLoaded = false;
			comboBoxSysDoc.Location = new System.Drawing.Point(91, 3);
			comboBoxSysDoc.MaxDropDownItems = 12;
			comboBoxSysDoc.Name = "comboBoxSysDoc";
			comboBoxSysDoc.ShowAll = false;
			comboBoxSysDoc.ShowInactiveItems = false;
			comboBoxSysDoc.ShowQuickAdd = true;
			comboBoxSysDoc.Size = new System.Drawing.Size(100, 20);
			comboBoxSysDoc.TabIndex = 143;
			comboBoxSysDoc.UseFlatMode = Infragistics.Win.DefaultableBoolean.True;
			label6.AutoSize = true;
			label6.Location = new System.Drawing.Point(8, 77);
			label6.Name = "label6";
			label6.Size = new System.Drawing.Size(69, 13);
			label6.TabIndex = 142;
			label6.Text = "Sheet Name:";
			label5.AutoSize = true;
			label5.Location = new System.Drawing.Point(213, 54);
			label5.Name = "label5";
			label5.Size = new System.Drawing.Size(35, 13);
			label5.TabIndex = 141;
			label5.Text = "Year :";
			label4.AutoSize = true;
			label4.Location = new System.Drawing.Point(10, 54);
			label4.Name = "label4";
			label4.Size = new System.Drawing.Size(40, 13);
			label4.TabIndex = 140;
			label4.Text = "Month:";
			textBoxSheetName.BackColor = System.Drawing.Color.WhiteSmoke;
			textBoxSheetName.ForeColor = System.Drawing.Color.Black;
			textBoxSheetName.Location = new System.Drawing.Point(91, 74);
			textBoxSheetName.Name = "textBoxSheetName";
			textBoxSheetName.ReadOnly = true;
			textBoxSheetName.Size = new System.Drawing.Size(341, 20);
			textBoxSheetName.TabIndex = 139;
			textBoxSheetName.TabStop = false;
			textBoxYear.Location = new System.Drawing.Point(263, 51);
			textBoxYear.Name = "textBoxYear";
			textBoxYear.ReadOnly = true;
			textBoxYear.Size = new System.Drawing.Size(138, 20);
			textBoxYear.TabIndex = 137;
			textBoxYear.TabStop = false;
			textBoxMonth.Location = new System.Drawing.Point(91, 51);
			textBoxMonth.Name = "textBoxMonth";
			textBoxMonth.ReadOnly = true;
			textBoxMonth.Size = new System.Drawing.Size(107, 20);
			textBoxMonth.TabIndex = 135;
			textBoxMonth.TabStop = false;
			appearance15.FontData.BoldAsString = "True";
			appearance15.FontData.Name = "Tahoma";
			ultraFormattedLinkLabel5.Appearance = appearance15;
			ultraFormattedLinkLabel5.AutoSize = true;
			ultraFormattedLinkLabel5.Location = new System.Drawing.Point(9, 6);
			ultraFormattedLinkLabel5.Name = "ultraFormattedLinkLabel5";
			ultraFormattedLinkLabel5.Size = new System.Drawing.Size(45, 15);
			ultraFormattedLinkLabel5.TabIndex = 0;
			ultraFormattedLinkLabel5.TabStop = true;
			ultraFormattedLinkLabel5.TreatValueAs = Infragistics.Win.FormattedLinkLabel.TreatValueAs.URL;
			ultraFormattedLinkLabel5.UnderlineLinks = Infragistics.Win.FormattedLinkLabel.UnderlineLink.WhenHovered;
			ultraFormattedLinkLabel5.Value = "Doc ID:";
			appearance16.ForeColor = System.Drawing.Color.Blue;
			ultraFormattedLinkLabel5.VisitedLinkAppearance = appearance16;
			ultraFormattedLinkLabel5.LinkClicked += new Infragistics.Win.FormattedLinkLabel.LinkClickedEventHandler(ultraFormattedLinkLabel5_LinkClicked);
			mmLabel1.AutoSize = true;
			mmLabel1.BorderColor = System.Drawing.Color.FromArgb(78, 122, 171);
			mmLabel1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25f, System.Drawing.FontStyle.Bold);
			mmLabel1.IsFieldHeader = false;
			mmLabel1.IsRequired = true;
			mmLabel1.Location = new System.Drawing.Point(408, 7);
			mmLabel1.Name = "mmLabel1";
			mmLabel1.PenWidth = 1f;
			mmLabel1.ShowBorder = false;
			mmLabel1.Size = new System.Drawing.Size(38, 13);
			mmLabel1.TabIndex = 2;
			mmLabel1.Text = "Date:";
			labelVoided.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right);
			labelVoided.BackColor = System.Drawing.Color.White;
			labelVoided.Font = new System.Drawing.Font("Microsoft Sans Serif", 14f, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, 0);
			labelVoided.ForeColor = System.Drawing.Color.DarkRed;
			labelVoided.Location = new System.Drawing.Point(13, 385);
			labelVoided.Name = "labelVoided";
			labelVoided.Size = new System.Drawing.Size(764, 81);
			labelVoided.TabIndex = 1;
			labelVoided.Text = "VOIDED";
			labelVoided.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
			labelVoided.Visible = false;
			toolStripButtonFirst.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			toolStripButtonFirst.Image = Micromind.ClientUI.Properties.Resources.first;
			toolStripButtonFirst.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonFirst.Name = "toolStripButtonFirst";
			toolStripButtonFirst.Size = new System.Drawing.Size(28, 28);
			toolStripButtonFirst.Text = "First Record";
			toolStripButtonFirst.Click += new System.EventHandler(toolStripButtonFirst_Click);
			toolStripButtonPrevious.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			toolStripButtonPrevious.Image = Micromind.ClientUI.Properties.Resources.prev;
			toolStripButtonPrevious.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonPrevious.Name = "toolStripButtonPrevious";
			toolStripButtonPrevious.Size = new System.Drawing.Size(28, 28);
			toolStripButtonPrevious.Text = "Previous Record";
			toolStripButtonPrevious.Click += new System.EventHandler(toolStripButtonPrevious_Click);
			toolStripButtonNext.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			toolStripButtonNext.Image = Micromind.ClientUI.Properties.Resources.next;
			toolStripButtonNext.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonNext.Name = "toolStripButtonNext";
			toolStripButtonNext.Size = new System.Drawing.Size(28, 28);
			toolStripButtonNext.Text = "Next Record";
			toolStripButtonNext.Click += new System.EventHandler(toolStripButtonNext_Click);
			toolStripButtonLast.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			toolStripButtonLast.Image = Micromind.ClientUI.Properties.Resources.last;
			toolStripButtonLast.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonLast.Name = "toolStripButtonLast";
			toolStripButtonLast.Size = new System.Drawing.Size(28, 28);
			toolStripButtonLast.Text = "Last Record";
			toolStripButtonLast.Click += new System.EventHandler(toolStripButtonLast_Click);
			toolStripTextBoxFind.Name = "toolStripTextBoxFind";
			toolStripTextBoxFind.Size = new System.Drawing.Size(100, 31);
			toolStripTextBoxFind.KeyPress += new System.Windows.Forms.KeyPressEventHandler(toolStripTextBoxFind_KeyPress);
			toolStripButtonFind.Image = Micromind.ClientUI.Properties.Resources.find;
			toolStripButtonFind.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonFind.Name = "toolStripButtonFind";
			toolStripButtonFind.Size = new System.Drawing.Size(58, 28);
			toolStripButtonFind.Text = "Find";
			toolStripButtonFind.Click += new System.EventHandler(toolStripButtonFind_Click);
			toolStripSeparator2.Name = "toolStripSeparator2";
			toolStripSeparator2.Size = new System.Drawing.Size(6, 31);
			toolStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
			toolStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
			toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[13]
			{
				toolStripButtonFirst,
				toolStripButtonPrevious,
				toolStripButtonNext,
				toolStripButtonLast,
				toolStripSeparator1,
				toolStripButtonOpenList,
				toolStripTextBoxFind,
				toolStripButtonFind,
				toolStripSeparator2,
				toolStripButtonPrint,
				toolStripButtonPreview,
				toolStripButtonDistribution,
				toolStripButtonInformation
			});
			toolStrip1.Location = new System.Drawing.Point(0, 0);
			toolStrip1.Name = "toolStrip1";
			toolStrip1.Size = new System.Drawing.Size(792, 31);
			toolStrip1.TabIndex = 0;
			toolStrip1.Text = "toolStrip1";
			toolStripSeparator1.Name = "toolStripSeparator1";
			toolStripSeparator1.Size = new System.Drawing.Size(6, 31);
			toolStripButtonOpenList.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			toolStripButtonOpenList.Image = Micromind.ClientUI.Properties.Resources.list;
			toolStripButtonOpenList.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonOpenList.Name = "toolStripButtonOpenList";
			toolStripButtonOpenList.Size = new System.Drawing.Size(28, 28);
			toolStripButtonOpenList.Text = "Open List";
			toolStripButtonOpenList.Click += new System.EventHandler(toolStripButtonOpenList_Click);
			toolStripButtonPrint.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			toolStripButtonPrint.Image = Micromind.ClientUI.Properties.Resources.printer;
			toolStripButtonPrint.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonPrint.Name = "toolStripButtonPrint";
			toolStripButtonPrint.Size = new System.Drawing.Size(28, 28);
			toolStripButtonPrint.Text = "&Print";
			toolStripButtonPrint.ToolTipText = "Print (Ctrl+P)";
			toolStripButtonPrint.Click += new System.EventHandler(toolStripButtonPrint_Click);
			toolStripButtonPreview.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			toolStripButtonPreview.Image = Micromind.ClientUI.Properties.Resources.preview;
			toolStripButtonPreview.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonPreview.Name = "toolStripButtonPreview";
			toolStripButtonPreview.Size = new System.Drawing.Size(28, 28);
			toolStripButtonPreview.Text = "Preview";
			toolStripButtonPreview.ToolTipText = "Preview";
			toolStripButtonPreview.Click += new System.EventHandler(toolStripButtonPreview_Click);
			toolStripButtonDistribution.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			toolStripButtonDistribution.Image = Micromind.ClientUI.Properties.Resources.jvdistribution;
			toolStripButtonDistribution.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonDistribution.Name = "toolStripButtonDistribution";
			toolStripButtonDistribution.Size = new System.Drawing.Size(28, 28);
			toolStripButtonDistribution.Text = "Journal Distribution Summary";
			toolStripButtonDistribution.Click += new System.EventHandler(toolStripButtonDistribution_Click);
			toolStripButtonInformation.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			toolStripButtonInformation.Image = Micromind.ClientUI.Properties.Resources.docinfo_24x24;
			toolStripButtonInformation.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonInformation.Name = "toolStripButtonInformation";
			toolStripButtonInformation.Size = new System.Drawing.Size(28, 28);
			toolStripButtonInformation.Text = "Document Information";
			toolStripButtonInformation.Click += new System.EventHandler(toolStripButtonInformation_Click);
			comboBoxJob.Assigned = false;
			comboBoxJob.AutoCompleteMode = Infragistics.Win.AutoCompleteMode.Append;
			comboBoxJob.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
			comboBoxJob.CustomReportFieldName = "";
			comboBoxJob.CustomReportKey = "";
			comboBoxJob.CustomReportValueType = 1;
			comboBoxJob.DescriptionTextBox = null;
			comboBoxJob.DropDownSearchMethod = Infragistics.Win.UltraWinGrid.DropDownSearchMethod.Linear;
			comboBoxJob.Editable = true;
			comboBoxJob.FilterString = "";
			comboBoxJob.HasAllAccount = false;
			comboBoxJob.HasCustom = false;
			comboBoxJob.IsDataLoaded = false;
			comboBoxJob.Location = new System.Drawing.Point(346, 258);
			comboBoxJob.MaxDropDownItems = 12;
			comboBoxJob.Name = "comboBoxJob";
			comboBoxJob.ShowInactiveItems = false;
			comboBoxJob.ShowQuickAdd = true;
			comboBoxJob.Size = new System.Drawing.Size(100, 20);
			comboBoxJob.TabIndex = 125;
			comboBoxJob.UseFlatMode = Infragistics.Win.DefaultableBoolean.True;
			comboBoxJob.Visible = false;
			buttonSelectSalarySheet.AdjustImageLocation = new System.Drawing.Point(0, 0);
			buttonSelectSalarySheet.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right);
			buttonSelectSalarySheet.BackColor = System.Drawing.Color.DarkGray;
			buttonSelectSalarySheet.BtnShape = Micromind.UISupport.BtnShape.Rectangle;
			buttonSelectSalarySheet.BtnStyle = Micromind.UISupport.XPStyle.Default;
			buttonSelectSalarySheet.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			buttonSelectSalarySheet.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			buttonSelectSalarySheet.Location = new System.Drawing.Point(656, 153);
			buttonSelectSalarySheet.Name = "buttonSelectSalarySheet";
			buttonSelectSalarySheet.Size = new System.Drawing.Size(122, 24);
			buttonSelectSalarySheet.TabIndex = 2;
			buttonSelectSalarySheet.Text = "Select Salary Sheet...";
			buttonSelectSalarySheet.UseVisualStyleBackColor = false;
			buttonSelectSalarySheet.Click += new System.EventHandler(buttonSelectSalarySheet_Click);
			formManager.BackColor = System.Drawing.Color.RosyBrown;
			formManager.Dock = System.Windows.Forms.DockStyle.Left;
			formManager.IsForcedDirty = false;
			formManager.Location = new System.Drawing.Point(0, 31);
			formManager.MaximumSize = new System.Drawing.Size(20, 20);
			formManager.MinimumSize = new System.Drawing.Size(20, 20);
			formManager.Name = "formManager";
			formManager.Size = new System.Drawing.Size(20, 20);
			formManager.TabIndex = 16;
			formManager.Text = "formManager1";
			formManager.Visible = false;
			dataGriditem.AllowAddNew = false;
			dataGriditem.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right);
			appearance17.BackColor = System.Drawing.SystemColors.Window;
			appearance17.BorderColor = System.Drawing.SystemColors.InactiveCaption;
			dataGriditem.DisplayLayout.Appearance = appearance17;
			dataGriditem.DisplayLayout.BorderStyle = Infragistics.Win.UIElementBorderStyle.Solid;
			dataGriditem.DisplayLayout.CaptionVisible = Infragistics.Win.DefaultableBoolean.False;
			appearance18.BackColor = System.Drawing.SystemColors.ActiveBorder;
			appearance18.BackColor2 = System.Drawing.SystemColors.ControlDark;
			appearance18.BackGradientStyle = Infragistics.Win.GradientStyle.Vertical;
			appearance18.BorderColor = System.Drawing.SystemColors.Window;
			dataGriditem.DisplayLayout.GroupByBox.Appearance = appearance18;
			appearance19.ForeColor = System.Drawing.SystemColors.GrayText;
			dataGriditem.DisplayLayout.GroupByBox.BandLabelAppearance = appearance19;
			dataGriditem.DisplayLayout.GroupByBox.BorderStyle = Infragistics.Win.UIElementBorderStyle.Solid;
			appearance20.BackColor = System.Drawing.SystemColors.ControlLightLight;
			appearance20.BackColor2 = System.Drawing.SystemColors.Control;
			appearance20.BackGradientStyle = Infragistics.Win.GradientStyle.Horizontal;
			appearance20.ForeColor = System.Drawing.SystemColors.GrayText;
			dataGriditem.DisplayLayout.GroupByBox.PromptAppearance = appearance20;
			dataGriditem.DisplayLayout.MaxColScrollRegions = 1;
			dataGriditem.DisplayLayout.MaxRowScrollRegions = 1;
			appearance21.BackColor = System.Drawing.SystemColors.Window;
			appearance21.ForeColor = System.Drawing.SystemColors.ControlText;
			dataGriditem.DisplayLayout.Override.ActiveCellAppearance = appearance21;
			appearance22.BackColor = System.Drawing.SystemColors.Highlight;
			appearance22.ForeColor = System.Drawing.SystemColors.HighlightText;
			dataGriditem.DisplayLayout.Override.ActiveRowAppearance = appearance22;
			dataGriditem.DisplayLayout.Override.AllowAddNew = Infragistics.Win.UltraWinGrid.AllowAddNew.No;
			dataGriditem.DisplayLayout.Override.BorderStyleCell = Infragistics.Win.UIElementBorderStyle.Dotted;
			dataGriditem.DisplayLayout.Override.BorderStyleRow = Infragistics.Win.UIElementBorderStyle.Dotted;
			appearance23.BackColor = System.Drawing.SystemColors.Window;
			dataGriditem.DisplayLayout.Override.CardAreaAppearance = appearance23;
			appearance24.BorderColor = System.Drawing.Color.Silver;
			appearance24.TextTrimming = Infragistics.Win.TextTrimming.EllipsisCharacter;
			dataGriditem.DisplayLayout.Override.CellAppearance = appearance24;
			dataGriditem.DisplayLayout.Override.CellClickAction = Infragistics.Win.UltraWinGrid.CellClickAction.EditAndSelectText;
			dataGriditem.DisplayLayout.Override.CellPadding = 0;
			appearance25.BackColor = System.Drawing.SystemColors.Control;
			appearance25.BackColor2 = System.Drawing.SystemColors.ControlDark;
			appearance25.BackGradientAlignment = Infragistics.Win.GradientAlignment.Element;
			appearance25.BackGradientStyle = Infragistics.Win.GradientStyle.Horizontal;
			appearance25.BorderColor = System.Drawing.SystemColors.Window;
			dataGriditem.DisplayLayout.Override.GroupByRowAppearance = appearance25;
			appearance26.TextHAlignAsString = "Left";
			dataGriditem.DisplayLayout.Override.HeaderAppearance = appearance26;
			dataGriditem.DisplayLayout.Override.HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction.SortMulti;
			dataGriditem.DisplayLayout.Override.HeaderStyle = Infragistics.Win.HeaderStyle.WindowsXPCommand;
			appearance27.BackColor = System.Drawing.SystemColors.Window;
			appearance27.BorderColor = System.Drawing.Color.Silver;
			dataGriditem.DisplayLayout.Override.RowAppearance = appearance27;
			dataGriditem.DisplayLayout.Override.RowSelectors = Infragistics.Win.DefaultableBoolean.False;
			appearance28.BackColor = System.Drawing.SystemColors.ControlLight;
			dataGriditem.DisplayLayout.Override.TemplateAddRowAppearance = appearance28;
			dataGriditem.DisplayLayout.ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds.ScrollToFill;
			dataGriditem.DisplayLayout.ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle.Immediate;
			dataGriditem.DisplayLayout.ViewStyleBand = Infragistics.Win.UltraWinGrid.ViewStyleBand.OutlookGroupBy;
			dataGriditem.ExitEditModeOnLeave = false;
			dataGriditem.IncludeLotItems = false;
			dataGriditem.LoadLayoutFailed = false;
			dataGriditem.Location = new System.Drawing.Point(11, 178);
			dataGriditem.Name = "dataGriditem";
			dataGriditem.ShowClearMenu = true;
			dataGriditem.ShowDeleteMenu = true;
			dataGriditem.ShowInsertMenu = true;
			dataGriditem.ShowMoveRowsMenu = true;
			dataGriditem.Size = new System.Drawing.Size(768, 283);
			dataGriditem.TabIndex = 19;
			dataGriditem.Text = "dataEntryGrid1";
			ComboBoxcostCategory.Assigned = false;
			ComboBoxcostCategory.AutoCompleteMode = Infragistics.Win.AutoCompleteMode.Append;
			ComboBoxcostCategory.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
			ComboBoxcostCategory.CustomReportFieldName = "";
			ComboBoxcostCategory.CustomReportKey = "";
			ComboBoxcostCategory.CustomReportValueType = 1;
			ComboBoxcostCategory.DescriptionTextBox = null;
			appearance29.BackColor = System.Drawing.SystemColors.Window;
			appearance29.BorderColor = System.Drawing.SystemColors.InactiveCaption;
			ComboBoxcostCategory.DisplayLayout.Appearance = appearance29;
			ComboBoxcostCategory.DisplayLayout.BorderStyle = Infragistics.Win.UIElementBorderStyle.Solid;
			ComboBoxcostCategory.DisplayLayout.CaptionVisible = Infragistics.Win.DefaultableBoolean.False;
			appearance30.BackColor = System.Drawing.SystemColors.ActiveBorder;
			appearance30.BackColor2 = System.Drawing.SystemColors.ControlDark;
			appearance30.BackGradientStyle = Infragistics.Win.GradientStyle.Vertical;
			appearance30.BorderColor = System.Drawing.SystemColors.Window;
			ComboBoxcostCategory.DisplayLayout.GroupByBox.Appearance = appearance30;
			appearance31.ForeColor = System.Drawing.SystemColors.GrayText;
			ComboBoxcostCategory.DisplayLayout.GroupByBox.BandLabelAppearance = appearance31;
			ComboBoxcostCategory.DisplayLayout.GroupByBox.BorderStyle = Infragistics.Win.UIElementBorderStyle.Solid;
			appearance32.BackColor = System.Drawing.SystemColors.ControlLightLight;
			appearance32.BackColor2 = System.Drawing.SystemColors.Control;
			appearance32.BackGradientStyle = Infragistics.Win.GradientStyle.Horizontal;
			appearance32.ForeColor = System.Drawing.SystemColors.GrayText;
			ComboBoxcostCategory.DisplayLayout.GroupByBox.PromptAppearance = appearance32;
			ComboBoxcostCategory.DisplayLayout.MaxColScrollRegions = 1;
			ComboBoxcostCategory.DisplayLayout.MaxRowScrollRegions = 1;
			appearance33.BackColor = System.Drawing.SystemColors.Window;
			appearance33.ForeColor = System.Drawing.SystemColors.ControlText;
			ComboBoxcostCategory.DisplayLayout.Override.ActiveCellAppearance = appearance33;
			appearance34.BackColor = System.Drawing.SystemColors.Highlight;
			appearance34.ForeColor = System.Drawing.SystemColors.HighlightText;
			ComboBoxcostCategory.DisplayLayout.Override.ActiveRowAppearance = appearance34;
			ComboBoxcostCategory.DisplayLayout.Override.BorderStyleCell = Infragistics.Win.UIElementBorderStyle.Dotted;
			ComboBoxcostCategory.DisplayLayout.Override.BorderStyleRow = Infragistics.Win.UIElementBorderStyle.Dotted;
			appearance35.BackColor = System.Drawing.SystemColors.Window;
			ComboBoxcostCategory.DisplayLayout.Override.CardAreaAppearance = appearance35;
			appearance36.BorderColor = System.Drawing.Color.Silver;
			appearance36.TextTrimming = Infragistics.Win.TextTrimming.EllipsisCharacter;
			ComboBoxcostCategory.DisplayLayout.Override.CellAppearance = appearance36;
			ComboBoxcostCategory.DisplayLayout.Override.CellClickAction = Infragistics.Win.UltraWinGrid.CellClickAction.EditAndSelectText;
			ComboBoxcostCategory.DisplayLayout.Override.CellPadding = 0;
			appearance37.BackColor = System.Drawing.SystemColors.Control;
			appearance37.BackColor2 = System.Drawing.SystemColors.ControlDark;
			appearance37.BackGradientAlignment = Infragistics.Win.GradientAlignment.Element;
			appearance37.BackGradientStyle = Infragistics.Win.GradientStyle.Horizontal;
			appearance37.BorderColor = System.Drawing.SystemColors.Window;
			ComboBoxcostCategory.DisplayLayout.Override.GroupByRowAppearance = appearance37;
			appearance38.TextHAlignAsString = "Left";
			ComboBoxcostCategory.DisplayLayout.Override.HeaderAppearance = appearance38;
			ComboBoxcostCategory.DisplayLayout.Override.HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction.SortMulti;
			ComboBoxcostCategory.DisplayLayout.Override.HeaderStyle = Infragistics.Win.HeaderStyle.WindowsXPCommand;
			appearance39.BackColor = System.Drawing.SystemColors.Window;
			appearance39.BorderColor = System.Drawing.Color.Silver;
			ComboBoxcostCategory.DisplayLayout.Override.RowAppearance = appearance39;
			ComboBoxcostCategory.DisplayLayout.Override.RowSelectors = Infragistics.Win.DefaultableBoolean.False;
			appearance40.BackColor = System.Drawing.SystemColors.ControlLight;
			ComboBoxcostCategory.DisplayLayout.Override.TemplateAddRowAppearance = appearance40;
			ComboBoxcostCategory.DisplayLayout.ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds.ScrollToFill;
			ComboBoxcostCategory.DisplayLayout.ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle.Immediate;
			ComboBoxcostCategory.DisplayLayout.ViewStyleBand = Infragistics.Win.UltraWinGrid.ViewStyleBand.OutlookGroupBy;
			ComboBoxcostCategory.DropDownSearchMethod = Infragistics.Win.UltraWinGrid.DropDownSearchMethod.Linear;
			ComboBoxcostCategory.Editable = true;
			ComboBoxcostCategory.FilterString = "";
			ComboBoxcostCategory.HasAllAccount = false;
			ComboBoxcostCategory.HasCustom = false;
			ComboBoxcostCategory.IsDataLoaded = false;
			ComboBoxcostCategory.Location = new System.Drawing.Point(523, 156);
			ComboBoxcostCategory.MaxDropDownItems = 12;
			ComboBoxcostCategory.Name = "ComboBoxcostCategory";
			ComboBoxcostCategory.ShowInactiveItems = false;
			ComboBoxcostCategory.ShowQuickAdd = true;
			ComboBoxcostCategory.Size = new System.Drawing.Size(100, 20);
			ComboBoxcostCategory.TabIndex = 126;
			ComboBoxcostCategory.UseFlatMode = Infragistics.Win.DefaultableBoolean.True;
			ComboBoxcostCategory.Visible = false;
			base.AutoScaleDimensions = new System.Drawing.SizeF(6f, 13f);
			base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			BackColor = System.Drawing.Color.WhiteSmoke;
			base.ClientSize = new System.Drawing.Size(792, 536);
			base.Controls.Add(ComboBoxcostCategory);
			base.Controls.Add(comboBoxJob);
			base.Controls.Add(buttonSelectSalarySheet);
			base.Controls.Add(labelVoided);
			base.Controls.Add(panelDetails);
			base.Controls.Add(formManager);
			base.Controls.Add(panelButtons);
			base.Controls.Add(toolStrip1);
			base.Controls.Add(dataGriditem);
			base.Icon = (System.Drawing.Icon)resources.GetObject("$this.Icon");
			MinimumSize = new System.Drawing.Size(649, 366);
			base.Name = "ProjectExpenseAllocationForm";
			Text = "Project Salary Expense Allocation";
			base.FormClosing += new System.Windows.Forms.FormClosingEventHandler(AccountGroupDetailsForm_FormClosing);
			panelButtons.ResumeLayout(false);
			panelDetails.ResumeLayout(false);
			panelDetails.PerformLayout();
			((System.ComponentModel.ISupportInitialize)comboBoxSysDoc).EndInit();
			toolStrip1.ResumeLayout(false);
			toolStrip1.PerformLayout();
			((System.ComponentModel.ISupportInitialize)comboBoxJob).EndInit();
			((System.ComponentModel.ISupportInitialize)dataGriditem).EndInit();
			((System.ComponentModel.ISupportInitialize)ComboBoxcostCategory).EndInit();
			ResumeLayout(false);
			PerformLayout();
		}
	}
}
