using DevExpress.XtraReports.UI;
using Infragistics.Win.Misc;
using Micromind.ClientLibraries;
using Micromind.ClientUI.Libraries;
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

namespace Micromind.ClientUI.Reports.Accounts
{
	public class ProfitAndLossComparionReportForm : Form, IForm
	{
		private ScreenAccessRight screenRight;

		private IContainer components;

		private DateControl dateControl1;

		private Button buttonOK;

		private Panel panelButtons;

		private Line linePanelDown;

		private XPButton xpButton1;

		private DateControl dateControl2;

		private Label label1;

		private Label label2;

		private UltraGroupBox ultraGroupBox1;

		private LocationSelector locationSelector;

		private UltraGroupBox ultraGroupBox2;

		private DivisionSelector divisionSelector;

		private PrintTemplateSelector printTemplateSelector;

		public ScreenAreas ScreenArea => ScreenAreas.ReportsAccounts;

		public int ScreenID => 7007;

		public ScreenTypes ScreenType => ScreenTypes.Report;

		public ProfitAndLossComparionReportForm()
		{
			InitializeComponent();
			base.Load += Form_Load;
		}

		private void Form_Load(object sender, EventArgs e)
		{
			try
			{
				SetSecurity();
				_ = base.IsDisposed;
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

		public IEnumerable<Control> GetAllFormControls(Control control)
		{
			IEnumerable<Control> controls = control.Controls.Cast<Control>();
			return controls.SelectMany((Control ctrl) => GetAllFormControls(ctrl).Concat(controls));
		}

		private void buttonOK_Click(object sender, EventArgs e)
		{
			DataSet dataSet = null;
			dataSet = Factory.JournalSystem.GetProfitAndLossComparisonReport(dateControl1.FromDate, dateControl1.ToDate, dateControl2.FromDate, dateControl2.ToDate, locationSelector.FromLocation, locationSelector.ToLocation, divisionSelector.FromDivision, divisionSelector.ToDivision);
			ReportHelper reportHelper = new ReportHelper();
			string str = "From1:" + dateControl1.FromDate.ToShortDateString() + "  To1:" + dateControl1.ToDate.ToShortDateString();
			string str2 = "From2:" + dateControl2.FromDate.ToShortDateString() + "  To2:" + dateControl2.ToDate.ToShortDateString();
			string reportFilter = str + "  " + str2;
			reportHelper.AddGeneralReportData(ref dataSet, reportFilter);
			reportHelper.AddFilterData(ref dataSet, GetAllFormControls(this));
			string text = "";
			text = ((!(printTemplateSelector.SelectedTemplate != "")) ? printTemplateSelector.DefaultTemplate : printTemplateSelector.SelectedTemplate);
			XtraReport report = reportHelper.GetReport(text);
			if (report == null)
			{
				ErrorHelper.ErrorMessage("Cannot find the report file", "'" + text + ".repx'", "Please make sure you have access to reports path and the files are not corrupted.");
				return;
			}
			report.DataSource = dataSet;
			reportHelper.ShowReport(report);
		}

		private void xpButton1_Click(object sender, EventArgs e)
		{
			Close();
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
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Micromind.ClientUI.Reports.Accounts.ProfitAndLossComparionReportForm));
			buttonOK = new System.Windows.Forms.Button();
			panelButtons = new System.Windows.Forms.Panel();
			linePanelDown = new Micromind.UISupport.Line();
			xpButton1 = new Micromind.UISupport.XPButton();
			label1 = new System.Windows.Forms.Label();
			label2 = new System.Windows.Forms.Label();
			ultraGroupBox1 = new Infragistics.Win.Misc.UltraGroupBox();
			locationSelector = new Micromind.DataControls.LocationSelector();
			ultraGroupBox2 = new Infragistics.Win.Misc.UltraGroupBox();
			divisionSelector = new Micromind.DataControls.DivisionSelector();
			dateControl2 = new Micromind.DataControls.DateControl();
			dateControl1 = new Micromind.DataControls.DateControl();
			printTemplateSelector = new Micromind.DataControls.PrintTemplateSelector();
			panelButtons.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)ultraGroupBox1).BeginInit();
			ultraGroupBox1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)ultraGroupBox2).BeginInit();
			ultraGroupBox2.SuspendLayout();
			SuspendLayout();
			buttonOK.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right);
			buttonOK.Location = new System.Drawing.Point(312, 8);
			buttonOK.Name = "buttonOK";
			buttonOK.Size = new System.Drawing.Size(96, 24);
			buttonOK.TabIndex = 1;
			buttonOK.Text = "Display";
			buttonOK.UseVisualStyleBackColor = true;
			buttonOK.Click += new System.EventHandler(buttonOK_Click);
			panelButtons.Controls.Add(linePanelDown);
			panelButtons.Controls.Add(xpButton1);
			panelButtons.Controls.Add(buttonOK);
			panelButtons.Dock = System.Windows.Forms.DockStyle.Bottom;
			panelButtons.Location = new System.Drawing.Point(0, 250);
			panelButtons.Name = "panelButtons";
			panelButtons.Size = new System.Drawing.Size(522, 40);
			panelButtons.TabIndex = 3;
			linePanelDown.BackColor = System.Drawing.Color.White;
			linePanelDown.Dock = System.Windows.Forms.DockStyle.Top;
			linePanelDown.DrawWidth = 1;
			linePanelDown.IsVertical = false;
			linePanelDown.LineBackColor = System.Drawing.Color.Silver;
			linePanelDown.Location = new System.Drawing.Point(0, 0);
			linePanelDown.Name = "linePanelDown";
			linePanelDown.Size = new System.Drawing.Size(522, 1);
			linePanelDown.TabIndex = 14;
			linePanelDown.TabStop = false;
			xpButton1.AdjustImageLocation = new System.Drawing.Point(0, 0);
			xpButton1.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right);
			xpButton1.BackColor = System.Drawing.Color.DarkGray;
			xpButton1.BtnShape = Micromind.UISupport.BtnShape.Rectangle;
			xpButton1.BtnStyle = Micromind.UISupport.XPStyle.Default;
			xpButton1.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			xpButton1.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			xpButton1.Location = new System.Drawing.Point(412, 8);
			xpButton1.Name = "xpButton1";
			xpButton1.Size = new System.Drawing.Size(96, 24);
			xpButton1.TabIndex = 1;
			xpButton1.Text = "&Close";
			xpButton1.UseVisualStyleBackColor = false;
			xpButton1.Click += new System.EventHandler(xpButton1_Click);
			label1.AutoSize = true;
			label1.Location = new System.Drawing.Point(24, 24);
			label1.Name = "label1";
			label1.Size = new System.Drawing.Size(52, 13);
			label1.TabIndex = 5;
			label1.Text = "Period 1 :";
			label2.AutoSize = true;
			label2.Location = new System.Drawing.Point(24, 79);
			label2.Name = "label2";
			label2.Size = new System.Drawing.Size(52, 13);
			label2.TabIndex = 6;
			label2.Text = "Period 2 :";
			ultraGroupBox1.Controls.Add(locationSelector);
			ultraGroupBox1.Location = new System.Drawing.Point(27, 122);
			ultraGroupBox1.Name = "ultraGroupBox1";
			ultraGroupBox1.Size = new System.Drawing.Size(481, 81);
			ultraGroupBox1.TabIndex = 16;
			ultraGroupBox1.Text = "Location";
			ultraGroupBox1.Visible = false;
			locationSelector.BackColor = System.Drawing.Color.Transparent;
			locationSelector.CustomReportFieldName = "";
			locationSelector.CustomReportKey = "";
			locationSelector.CustomReportValueType = 1;
			locationSelector.Location = new System.Drawing.Point(16, 19);
			locationSelector.Name = "locationSelector";
			locationSelector.Size = new System.Drawing.Size(412, 59);
			locationSelector.TabIndex = 7;
			ultraGroupBox2.Controls.Add(divisionSelector);
			ultraGroupBox2.Location = new System.Drawing.Point(25, 122);
			ultraGroupBox2.Name = "ultraGroupBox2";
			ultraGroupBox2.Size = new System.Drawing.Size(477, 81);
			ultraGroupBox2.TabIndex = 19;
			ultraGroupBox2.Text = "Division";
			divisionSelector.BackColor = System.Drawing.Color.Transparent;
			divisionSelector.CustomReportFieldName = "";
			divisionSelector.CustomReportKey = "";
			divisionSelector.CustomReportValueType = 1;
			divisionSelector.Location = new System.Drawing.Point(6, 19);
			divisionSelector.Name = "divisionSelector";
			divisionSelector.Size = new System.Drawing.Size(414, 54);
			divisionSelector.TabIndex = 0;
			dateControl2.CustomReportFieldName = "";
			dateControl2.CustomReportKey = "";
			dateControl2.CustomReportValueType = 1;
			dateControl2.FromDate = new System.DateTime(2017, 11, 1, 0, 0, 0, 0);
			dateControl2.Location = new System.Drawing.Point(94, 67);
			dateControl2.Name = "dateControl2";
			dateControl2.SelectedPeriod = Micromind.DataControls.DatePeriods.ThisMonthToDate;
			dateControl2.Size = new System.Drawing.Size(296, 49);
			dateControl2.TabIndex = 4;
			dateControl2.Tag = "Period 2 Date";
			dateControl2.ToDate = new System.DateTime(2017, 11, 19, 23, 59, 59, 59);
			dateControl1.CustomReportFieldName = "";
			dateControl1.CustomReportKey = "";
			dateControl1.CustomReportValueType = 1;
			dateControl1.FromDate = new System.DateTime(2017, 11, 1, 0, 0, 0, 0);
			dateControl1.Location = new System.Drawing.Point(94, 12);
			dateControl1.Name = "dateControl1";
			dateControl1.SelectedPeriod = Micromind.DataControls.DatePeriods.ThisMonthToDate;
			dateControl1.Size = new System.Drawing.Size(296, 49);
			dateControl1.TabIndex = 0;
			dateControl1.Tag = "Period 1 Date";
			dateControl1.ToDate = new System.DateTime(2017, 11, 19, 23, 59, 59, 59);
			printTemplateSelector.BackColor = System.Drawing.Color.Transparent;
			printTemplateSelector.CustomReportFieldName = "";
			printTemplateSelector.CustomReportKey = "";
			printTemplateSelector.CustomReportValueType = 1;
			printTemplateSelector.DefaultTemplate = "Profit and Loss Comparison";
			printTemplateSelector.FormID = "ProfitAndLossComparionReportForm";
			printTemplateSelector.Location = new System.Drawing.Point(25, 209);
			printTemplateSelector.Name = "printTemplateSelector";
			printTemplateSelector.Size = new System.Drawing.Size(366, 28);
			printTemplateSelector.TabIndex = 23;
			base.AcceptButton = buttonOK;
			base.AutoScaleDimensions = new System.Drawing.SizeF(6f, 13f);
			base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			BackColor = System.Drawing.Color.WhiteSmoke;
			base.ClientSize = new System.Drawing.Size(522, 290);
			base.Controls.Add(printTemplateSelector);
			base.Controls.Add(ultraGroupBox2);
			base.Controls.Add(ultraGroupBox1);
			base.Controls.Add(label2);
			base.Controls.Add(label1);
			base.Controls.Add(dateControl2);
			base.Controls.Add(panelButtons);
			base.Controls.Add(dateControl1);
			base.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			base.Icon = (System.Drawing.Icon)resources.GetObject("$this.Icon");
			base.MaximizeBox = false;
			base.Name = "ProfitAndLossComparionReportForm";
			Text = "Profit and Loss Report Comparison";
			panelButtons.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)ultraGroupBox1).EndInit();
			ultraGroupBox1.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)ultraGroupBox2).EndInit();
			ultraGroupBox2.ResumeLayout(false);
			ResumeLayout(false);
			PerformLayout();
		}
	}
}
