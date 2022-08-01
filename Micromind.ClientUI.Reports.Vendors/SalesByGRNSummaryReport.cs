using DevExpress.XtraReports.UI;
using Infragistics.Win;
using Infragistics.Win.Misc;
using Infragistics.Win.UltraWinGrid;
using Micromind.ClientLibraries;
using Micromind.ClientUI.Libraries;
using Micromind.ClientUI.WindowsForms.DataEntries.Others;
using Micromind.Common.Data;
using Micromind.Common.Interfaces;
using Micromind.DataControls;
using Micromind.UISupport;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace Micromind.ClientUI.Reports.Vendors
{
	public class SalesByGRNSummaryReport : Form, IForm
	{
		private ScreenAccessRight screenRight;

		private IContainer components;

		private Button buttonOK;

		private Button buttonClose;

		private SysDocComboBox comboBoxSysDoc;

		private Label label5;

		private Label label1;

		private TextBox textBoxVoucherNumber;

		private XPButton buttonGRN;

		private Line line1;

		private GroupBox groupBox1;

		private Panel panel1;

		private RadioButton radioButtonImport;

		private RadioButton radioButtonLocal;

		private DateControl dateControl1;

		private UltraGroupBox ultraGroupBox2;

		private VendorSelector vendorSelector;

		private TextBox textBoxContainerNumber;

		private Label label2;

		private UltraGroupBox ultraGroupBox1;

		private ProductCategorySelector productCategorySelector;

		public ScreenAreas ScreenArea => ScreenAreas.ReportsVendor;

		public int ScreenID => 7039;

		public ScreenTypes ScreenType => ScreenTypes.Report;

		public string SysDocID
		{
			get
			{
				return comboBoxSysDoc.SelectedID;
			}
			set
			{
				comboBoxSysDoc.SelectedID = value;
			}
		}

		public string VoucherID
		{
			get
			{
				return textBoxVoucherNumber.Text;
			}
			set
			{
				textBoxVoucherNumber.Text = value;
			}
		}

		public SalesByGRNSummaryReport()
		{
			InitializeComponent();
			base.Load += Form_Load;
		}

		private void Form_Load(object sender, EventArgs e)
		{
			try
			{
				radioButtonImport.Checked = true;
				comboBoxSysDoc.FilterByType(SysDocTypes.ImportGoodsReceivedNote);
				comboBoxSysDoc.SelectedIndex = 0;
				SetSecurity();
				if (!base.IsDisposed)
				{
					textBoxVoucherNumber.Enabled = true;
				}
			}
			catch (Exception e2)
			{
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
		}

		private void buttonOK_Click(object sender, EventArgs e)
		{
			try
			{
				DataSet data = Factory.PurchaseReceiptSystem.GetSalesByGRNSummaryReport(dateControl1.FromDate, dateControl1.ToDate, productCategorySelector.FromProductCategory, productCategorySelector.ToProductCategory, vendorSelector.FromVendor, vendorSelector.ToVendor, vendorSelector.FromClass, vendorSelector.ToClass, vendorSelector.FromGroup, vendorSelector.ToGroup, comboBoxSysDoc.SelectedID, textBoxVoucherNumber.Text, textBoxContainerNumber.Text, vendorSelector.MultipleVendors);
				ReportHelper reportHelper = new ReportHelper();
				string empty = string.Empty;
				reportHelper.AddGeneralReportData(ref data, empty);
				reportHelper.AddFilterData(ref data, GetAllFormControls(this));
				XtraReport report = reportHelper.GetReport("Sales by GRN Summary");
				if (report == null)
				{
					ErrorHelper.ErrorMessage("Cannot find the report file", "Please make sure you have access to reports path and the files are not corrupted.", "'Sales by GRN Summary.repx'");
				}
				else
				{
					report.DataSource = data;
					reportHelper.ShowReport(report);
				}
			}
			catch (Exception e2)
			{
				ErrorHelper.ProcessError(e2);
			}
		}

		public IEnumerable<Control> GetAllFormControls(Control control)
		{
			IEnumerable<Control> controls = control.Controls.Cast<Control>();
			return controls.SelectMany((Control ctrl) => GetAllFormControls(ctrl).Concat(controls));
		}

		private void buttonClose_Click(object sender, EventArgs e)
		{
			Close();
		}

		private void buttonGRN_Click(object sender, EventArgs e)
		{
			try
			{
				SelectDocumentDialog selectDocumentDialog = new SelectDocumentDialog();
				selectDocumentDialog.Text = "Select GRN";
				selectDocumentDialog.IsMultiSelect = false;
				selectDocumentDialog.AllowDateFilter = true;
				selectDocumentDialog.RequireDataRefresh += form_RequireDataRefresh;
				if (selectDocumentDialog.ShowDialog(this) == DialogResult.OK)
				{
					foreach (UltraGridRow selectedRow in selectDocumentDialog.SelectedRows)
					{
						SysDocID = selectedRow.Cells["Doc ID"].Value.ToString();
						VoucherID = selectedRow.Cells["Number"].Value.ToString();
						textBoxContainerNumber.Text = selectedRow.Cells["Container#"].Value.ToString();
					}
				}
			}
			catch (Exception e2)
			{
				ErrorHelper.ProcessError(e2);
			}
		}

		private void form_RequireDataRefresh(object sender, DateRangeStruct e)
		{
			try
			{
				DataSet dataSet = (sender as SelectDocumentDialog).DataSource = Factory.PurchaseReceiptSystem.GetGRNList(comboBoxSysDoc.SelectedID, e.From, e.To);
			}
			catch (Exception e2)
			{
				ErrorHelper.ProcessError(e2);
			}
		}

		private void form_ValidateSelection(object sender, EventArgs e)
		{
			SelectDocumentDialog selectDocumentDialog = sender as SelectDocumentDialog;
			int num = 0;
			foreach (UltraGridRow row in selectDocumentDialog.Grid.Rows)
			{
				if (row.Cells["C"].Value != null && row.Cells["C"].Value.ToString() != "" && bool.Parse(row.Cells["C"].Value.ToString()) && bool.Parse(row.Cells["C"].Value.ToString()))
				{
					num = checked(num + 1);
					if (num > 1)
					{
						ErrorHelper.WarningMessage("Cannot select more than one Consignment Number!");
						selectDocumentDialog.CanClose = false;
						break;
					}
				}
			}
		}

		private void radioButtonImport_CheckedChanged(object sender, EventArgs e)
		{
			if (radioButtonImport.Checked)
			{
				comboBoxSysDoc.FilterByType(SysDocTypes.ImportGoodsReceivedNote);
				comboBoxSysDoc.SelectedIndex = 0;
				textBoxVoucherNumber.Clear();
				textBoxContainerNumber.Clear();
			}
		}

		private void radioButtonLocal_CheckedChanged(object sender, EventArgs e)
		{
			if (radioButtonLocal.Checked)
			{
				comboBoxSysDoc.FilterByType(SysDocTypes.GoodsReceivedNote);
				comboBoxSysDoc.SelectedIndex = 0;
				textBoxVoucherNumber.Clear();
				textBoxContainerNumber.Clear();
			}
		}

		private void SalesByGRNSummaryReport_Load(object sender, EventArgs e)
		{
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
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Micromind.ClientUI.Reports.Vendors.SalesByGRNSummaryReport));
			buttonOK = new System.Windows.Forms.Button();
			buttonClose = new System.Windows.Forms.Button();
			comboBoxSysDoc = new Micromind.DataControls.SysDocComboBox();
			label5 = new System.Windows.Forms.Label();
			label1 = new System.Windows.Forms.Label();
			textBoxVoucherNumber = new System.Windows.Forms.TextBox();
			buttonGRN = new Micromind.UISupport.XPButton();
			line1 = new Micromind.UISupport.Line();
			groupBox1 = new System.Windows.Forms.GroupBox();
			panel1 = new System.Windows.Forms.Panel();
			radioButtonImport = new System.Windows.Forms.RadioButton();
			radioButtonLocal = new System.Windows.Forms.RadioButton();
			dateControl1 = new Micromind.DataControls.DateControl();
			ultraGroupBox2 = new Infragistics.Win.Misc.UltraGroupBox();
			vendorSelector = new Micromind.DataControls.VendorSelector();
			textBoxContainerNumber = new System.Windows.Forms.TextBox();
			label2 = new System.Windows.Forms.Label();
			ultraGroupBox1 = new Infragistics.Win.Misc.UltraGroupBox();
			productCategorySelector = new Micromind.DataControls.ProductCategorySelector();
			((System.ComponentModel.ISupportInitialize)comboBoxSysDoc).BeginInit();
			groupBox1.SuspendLayout();
			panel1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)ultraGroupBox2).BeginInit();
			ultraGroupBox2.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)ultraGroupBox1).BeginInit();
			ultraGroupBox1.SuspendLayout();
			SuspendLayout();
			buttonOK.Location = new System.Drawing.Point(238, 367);
			buttonOK.Name = "buttonOK";
			buttonOK.Size = new System.Drawing.Size(98, 24);
			buttonOK.TabIndex = 4;
			buttonOK.Text = "&Display";
			buttonOK.UseVisualStyleBackColor = true;
			buttonOK.Click += new System.EventHandler(buttonOK_Click);
			buttonClose.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			buttonClose.Location = new System.Drawing.Point(342, 367);
			buttonClose.Name = "buttonClose";
			buttonClose.Size = new System.Drawing.Size(98, 24);
			buttonClose.TabIndex = 5;
			buttonClose.Text = "&Close";
			buttonClose.UseVisualStyleBackColor = true;
			buttonClose.Click += new System.EventHandler(buttonClose_Click);
			comboBoxSysDoc.Assigned = false;
			comboBoxSysDoc.CharacterCasing = System.Windows.Forms.CharacterCasing.Upper;
			comboBoxSysDoc.CustomReportFieldName = "";
			comboBoxSysDoc.CustomReportKey = "";
			comboBoxSysDoc.CustomReportValueType = 1;
			comboBoxSysDoc.DescriptionTextBox = null;
			appearance.BackColor = System.Drawing.SystemColors.Window;
			appearance.BorderColor = System.Drawing.SystemColors.InactiveCaption;
			comboBoxSysDoc.DisplayLayout.Appearance = appearance;
			comboBoxSysDoc.DisplayLayout.BorderStyle = Infragistics.Win.UIElementBorderStyle.Solid;
			comboBoxSysDoc.DisplayLayout.CaptionVisible = Infragistics.Win.DefaultableBoolean.False;
			appearance2.BackColor = System.Drawing.SystemColors.ActiveBorder;
			appearance2.BackColor2 = System.Drawing.SystemColors.ControlDark;
			appearance2.BackGradientStyle = Infragistics.Win.GradientStyle.Vertical;
			appearance2.BorderColor = System.Drawing.SystemColors.Window;
			comboBoxSysDoc.DisplayLayout.GroupByBox.Appearance = appearance2;
			appearance3.ForeColor = System.Drawing.SystemColors.GrayText;
			comboBoxSysDoc.DisplayLayout.GroupByBox.BandLabelAppearance = appearance3;
			comboBoxSysDoc.DisplayLayout.GroupByBox.BorderStyle = Infragistics.Win.UIElementBorderStyle.Solid;
			appearance4.BackColor = System.Drawing.SystemColors.ControlLightLight;
			appearance4.BackColor2 = System.Drawing.SystemColors.Control;
			appearance4.BackGradientStyle = Infragistics.Win.GradientStyle.Horizontal;
			appearance4.ForeColor = System.Drawing.SystemColors.GrayText;
			comboBoxSysDoc.DisplayLayout.GroupByBox.PromptAppearance = appearance4;
			comboBoxSysDoc.DisplayLayout.MaxColScrollRegions = 1;
			comboBoxSysDoc.DisplayLayout.MaxRowScrollRegions = 1;
			appearance5.BackColor = System.Drawing.SystemColors.Window;
			appearance5.ForeColor = System.Drawing.SystemColors.ControlText;
			comboBoxSysDoc.DisplayLayout.Override.ActiveCellAppearance = appearance5;
			appearance6.BackColor = System.Drawing.SystemColors.Highlight;
			appearance6.ForeColor = System.Drawing.SystemColors.HighlightText;
			comboBoxSysDoc.DisplayLayout.Override.ActiveRowAppearance = appearance6;
			comboBoxSysDoc.DisplayLayout.Override.BorderStyleCell = Infragistics.Win.UIElementBorderStyle.Dotted;
			comboBoxSysDoc.DisplayLayout.Override.BorderStyleRow = Infragistics.Win.UIElementBorderStyle.Dotted;
			appearance7.BackColor = System.Drawing.SystemColors.Window;
			comboBoxSysDoc.DisplayLayout.Override.CardAreaAppearance = appearance7;
			appearance8.BorderColor = System.Drawing.Color.Silver;
			appearance8.TextTrimming = Infragistics.Win.TextTrimming.EllipsisCharacter;
			comboBoxSysDoc.DisplayLayout.Override.CellAppearance = appearance8;
			comboBoxSysDoc.DisplayLayout.Override.CellClickAction = Infragistics.Win.UltraWinGrid.CellClickAction.EditAndSelectText;
			comboBoxSysDoc.DisplayLayout.Override.CellPadding = 0;
			appearance9.BackColor = System.Drawing.SystemColors.Control;
			appearance9.BackColor2 = System.Drawing.SystemColors.ControlDark;
			appearance9.BackGradientAlignment = Infragistics.Win.GradientAlignment.Element;
			appearance9.BackGradientStyle = Infragistics.Win.GradientStyle.Horizontal;
			appearance9.BorderColor = System.Drawing.SystemColors.Window;
			comboBoxSysDoc.DisplayLayout.Override.GroupByRowAppearance = appearance9;
			appearance10.TextHAlignAsString = "Left";
			comboBoxSysDoc.DisplayLayout.Override.HeaderAppearance = appearance10;
			comboBoxSysDoc.DisplayLayout.Override.HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction.SortMulti;
			comboBoxSysDoc.DisplayLayout.Override.HeaderStyle = Infragistics.Win.HeaderStyle.WindowsXPCommand;
			appearance11.BackColor = System.Drawing.SystemColors.Window;
			appearance11.BorderColor = System.Drawing.Color.Silver;
			comboBoxSysDoc.DisplayLayout.Override.RowAppearance = appearance11;
			comboBoxSysDoc.DisplayLayout.Override.RowSelectors = Infragistics.Win.DefaultableBoolean.False;
			appearance12.BackColor = System.Drawing.SystemColors.ControlLight;
			comboBoxSysDoc.DisplayLayout.Override.TemplateAddRowAppearance = appearance12;
			comboBoxSysDoc.DisplayLayout.ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds.ScrollToFill;
			comboBoxSysDoc.DisplayLayout.ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle.Immediate;
			comboBoxSysDoc.DisplayLayout.ViewStyleBand = Infragistics.Win.UltraWinGrid.ViewStyleBand.OutlookGroupBy;
			comboBoxSysDoc.DropDownSearchMethod = Infragistics.Win.UltraWinGrid.DropDownSearchMethod.Linear;
			comboBoxSysDoc.DropDownStyle = Infragistics.Win.UltraWinGrid.UltraComboStyle.DropDownList;
			comboBoxSysDoc.Editable = true;
			comboBoxSysDoc.ExcludeFromSecurity = false;
			comboBoxSysDoc.FilterString = "";
			comboBoxSysDoc.HasAllAccount = false;
			comboBoxSysDoc.HasCustom = false;
			comboBoxSysDoc.IsDataLoaded = false;
			comboBoxSysDoc.Location = new System.Drawing.Point(76, 295);
			comboBoxSysDoc.MaxDropDownItems = 12;
			comboBoxSysDoc.Name = "comboBoxSysDoc";
			comboBoxSysDoc.ShowAll = false;
			comboBoxSysDoc.ShowInactiveItems = false;
			comboBoxSysDoc.ShowQuickAdd = true;
			comboBoxSysDoc.Size = new System.Drawing.Size(129, 20);
			comboBoxSysDoc.TabIndex = 6;
			comboBoxSysDoc.UseFlatMode = Infragistics.Win.DefaultableBoolean.True;
			label5.AutoSize = true;
			label5.Location = new System.Drawing.Point(19, 298);
			label5.Name = "label5";
			label5.Size = new System.Drawing.Size(44, 13);
			label5.TabIndex = 152;
			label5.Text = "Doc ID:";
			label1.AutoSize = true;
			label1.Location = new System.Drawing.Point(240, 297);
			label1.Name = "label1";
			label1.Size = new System.Drawing.Size(70, 13);
			label1.TabIndex = 153;
			label1.Text = "Doc Number:";
			textBoxVoucherNumber.Location = new System.Drawing.Point(309, 295);
			textBoxVoucherNumber.MaxLength = 15;
			textBoxVoucherNumber.Name = "textBoxVoucherNumber";
			textBoxVoucherNumber.Size = new System.Drawing.Size(132, 20);
			textBoxVoucherNumber.TabIndex = 154;
			buttonGRN.AdjustImageLocation = new System.Drawing.Point(0, 0);
			buttonGRN.BackColor = System.Drawing.Color.DarkGray;
			buttonGRN.BtnShape = Micromind.UISupport.BtnShape.Rectangle;
			buttonGRN.BtnStyle = Micromind.UISupport.XPStyle.Default;
			buttonGRN.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
			buttonGRN.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			buttonGRN.Location = new System.Drawing.Point(447, 292);
			buttonGRN.Name = "buttonGRN";
			buttonGRN.Size = new System.Drawing.Size(34, 24);
			buttonGRN.TabIndex = 161;
			buttonGRN.Text = "...";
			buttonGRN.UseVisualStyleBackColor = false;
			buttonGRN.Click += new System.EventHandler(buttonGRN_Click);
			line1.BackColor = System.Drawing.Color.White;
			line1.DrawWidth = 1;
			line1.IsVertical = false;
			line1.LineBackColor = System.Drawing.Color.Black;
			line1.Location = new System.Drawing.Point(6, 347);
			line1.Name = "line1";
			line1.Size = new System.Drawing.Size(484, 1);
			line1.TabIndex = 162;
			line1.TabStop = false;
			groupBox1.Controls.Add(panel1);
			groupBox1.Location = new System.Drawing.Point(13, 350);
			groupBox1.Name = "groupBox1";
			groupBox1.Size = new System.Drawing.Size(189, 42);
			groupBox1.TabIndex = 163;
			groupBox1.TabStop = false;
			panel1.Controls.Add(radioButtonImport);
			panel1.Controls.Add(radioButtonLocal);
			panel1.Location = new System.Drawing.Point(6, 11);
			panel1.Name = "panel1";
			panel1.Size = new System.Drawing.Size(157, 27);
			panel1.TabIndex = 161;
			radioButtonImport.AutoSize = true;
			radioButtonImport.Checked = true;
			radioButtonImport.Location = new System.Drawing.Point(3, 6);
			radioButtonImport.Name = "radioButtonImport";
			radioButtonImport.Size = new System.Drawing.Size(54, 17);
			radioButtonImport.TabIndex = 1;
			radioButtonImport.TabStop = true;
			radioButtonImport.Text = "Import";
			radioButtonImport.UseVisualStyleBackColor = true;
			radioButtonImport.CheckedChanged += new System.EventHandler(radioButtonImport_CheckedChanged);
			radioButtonLocal.AutoSize = true;
			radioButtonLocal.Location = new System.Drawing.Point(77, 6);
			radioButtonLocal.Name = "radioButtonLocal";
			radioButtonLocal.Size = new System.Drawing.Size(51, 17);
			radioButtonLocal.TabIndex = 0;
			radioButtonLocal.Text = "Local";
			radioButtonLocal.UseVisualStyleBackColor = true;
			radioButtonLocal.CheckedChanged += new System.EventHandler(radioButtonLocal_CheckedChanged);
			dateControl1.CustomReportFieldName = "";
			dateControl1.CustomReportKey = "";
			dateControl1.CustomReportValueType = 1;
			dateControl1.FromDate = new System.DateTime(2017, 10, 1, 0, 0, 0, 0);
			dateControl1.Location = new System.Drawing.Point(23, 236);
			dateControl1.Name = "dateControl1";
			dateControl1.SelectedPeriod = Micromind.DataControls.DatePeriods.ThisMonthToDate;
			dateControl1.Size = new System.Drawing.Size(448, 53);
			dateControl1.TabIndex = 166;
			dateControl1.ToDate = new System.DateTime(2017, 10, 18, 23, 59, 59, 59);
			ultraGroupBox2.Controls.Add(vendorSelector);
			ultraGroupBox2.Location = new System.Drawing.Point(18, 89);
			ultraGroupBox2.Name = "ultraGroupBox2";
			ultraGroupBox2.Size = new System.Drawing.Size(453, 141);
			ultraGroupBox2.TabIndex = 165;
			ultraGroupBox2.Text = "Vendors";
			vendorSelector.BackColor = System.Drawing.Color.Transparent;
			vendorSelector.CustomReportFieldName = "";
			vendorSelector.CustomReportKey = "";
			vendorSelector.CustomReportValueType = 1;
			vendorSelector.Location = new System.Drawing.Point(6, 19);
			vendorSelector.Name = "vendorSelector";
			vendorSelector.Size = new System.Drawing.Size(441, 116);
			vendorSelector.TabIndex = 0;
			textBoxContainerNumber.Location = new System.Drawing.Point(76, 324);
			textBoxContainerNumber.MaxLength = 15;
			textBoxContainerNumber.Name = "textBoxContainerNumber";
			textBoxContainerNumber.Size = new System.Drawing.Size(132, 20);
			textBoxContainerNumber.TabIndex = 167;
			label2.AutoSize = true;
			label2.Location = new System.Drawing.Point(4, 327);
			label2.Name = "label2";
			label2.Size = new System.Drawing.Size(72, 13);
			label2.TabIndex = 168;
			label2.Text = "Container No:";
			ultraGroupBox1.Controls.Add(productCategorySelector);
			ultraGroupBox1.Location = new System.Drawing.Point(14, 12);
			ultraGroupBox1.Name = "ultraGroupBox1";
			ultraGroupBox1.Size = new System.Drawing.Size(457, 76);
			ultraGroupBox1.TabIndex = 169;
			ultraGroupBox1.Text = "Product Categories";
			productCategorySelector.BackColor = System.Drawing.Color.Transparent;
			productCategorySelector.Location = new System.Drawing.Point(6, 19);
			productCategorySelector.Name = "productCategorySelector";
			productCategorySelector.Size = new System.Drawing.Size(436, 55);
			productCategorySelector.TabIndex = 0;
			base.AcceptButton = buttonOK;
			base.AutoScaleDimensions = new System.Drawing.SizeF(6f, 13f);
			base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			BackColor = System.Drawing.Color.WhiteSmoke;
			base.CancelButton = buttonClose;
			base.ClientSize = new System.Drawing.Size(493, 405);
			base.Controls.Add(ultraGroupBox1);
			base.Controls.Add(label2);
			base.Controls.Add(textBoxContainerNumber);
			base.Controls.Add(dateControl1);
			base.Controls.Add(ultraGroupBox2);
			base.Controls.Add(groupBox1);
			base.Controls.Add(line1);
			base.Controls.Add(buttonGRN);
			base.Controls.Add(textBoxVoucherNumber);
			base.Controls.Add(label1);
			base.Controls.Add(label5);
			base.Controls.Add(comboBoxSysDoc);
			base.Controls.Add(buttonClose);
			base.Controls.Add(buttonOK);
			base.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			base.Icon = (System.Drawing.Icon)resources.GetObject("$this.Icon");
			base.MaximizeBox = false;
			base.MinimizeBox = false;
			MinimumSize = new System.Drawing.Size(475, 165);
			base.Name = "SalesByGRNSummaryReport";
			Text = "Sales by GRN Report";
			base.Load += new System.EventHandler(SalesByGRNSummaryReport_Load);
			((System.ComponentModel.ISupportInitialize)comboBoxSysDoc).EndInit();
			groupBox1.ResumeLayout(false);
			panel1.ResumeLayout(false);
			panel1.PerformLayout();
			((System.ComponentModel.ISupportInitialize)ultraGroupBox2).EndInit();
			ultraGroupBox2.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)ultraGroupBox1).EndInit();
			ultraGroupBox1.ResumeLayout(false);
			ResumeLayout(false);
			PerformLayout();
		}
	}
}
