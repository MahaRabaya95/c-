using DevExpress.XtraReports.UI;
using Infragistics.Win.Misc;
using Micromind.ClientLibraries;
using Micromind.ClientUI.Libraries;
using Micromind.Common.Data;
using Micromind.Common.Interfaces;
using Micromind.DataControls;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace Micromind.ClientUI.Reports.Customers
{
	public class PurchaseByInventoryItemVendorBuyerReport : Form, IForm
	{
		private ScreenAccessRight screenRight;

		private IContainer components;

		private Button buttonOK;

		private Button buttonClose;

		private DateControl dateControl1;

		private UltraGroupBox ultraGroupBox1;

		private UltraGroupBox ultraGroupBox2;

		private UltraGroupBox ultraGroupBox3;

		private UltraGroupBox ultraGroupBox4;

		private LocationSelector locationSelector;

		private VendorSelector vendorSelector;

		private BuyerSelector BuyerSelector;

		private ProductSelector productSelector;

		public ScreenAreas ScreenArea => ScreenAreas.ReportsSales;

		public int ScreenID => 7035;

		public ScreenTypes ScreenType => ScreenTypes.Report;

		public PurchaseByInventoryItemVendorBuyerReport()
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

		private void buttonOK_Click(object sender, EventArgs e)
		{
			try
			{
				ReportHelper reportHelper = new ReportHelper();
				XtraReport xtraReport = null;
				DataSet data = Factory.ProductSystem.GetPurchaseByInventoryItemVendorBuyerReport(dateControl1.FromDate, dateControl1.ToDate, productSelector.FromItem, productSelector.ToItem, productSelector.FromClass, productSelector.ToClass, productSelector.FromCategory, productSelector.ToCategory, vendorSelector.FromVendor, vendorSelector.ToVendor, vendorSelector.FromClass, vendorSelector.ToClass, vendorSelector.FromGroup, vendorSelector.ToGroup, BuyerSelector.FromBuyer, BuyerSelector.ToBuyer, locationSelector.FromLocation, locationSelector.ToLocation, vendorSelector.MultipleVendors, productSelector.FromManufacturer, productSelector.ToManufacturer, productSelector.FromStyle, productSelector.ToStyle, productSelector.FromOrigin, productSelector.ToOrigin);
				xtraReport = reportHelper.GetReport("Purchase By Item Vendor Buyer Inv");
				string reportFilter = "From:" + dateControl1.FromDate.ToShortDateString() + "  To:" + dateControl1.ToDate.ToShortDateString();
				reportHelper.AddGeneralReportData(ref data, reportFilter);
				reportHelper.AddFilterData(ref data, GetAllFormControls(this));
				if (xtraReport == null)
				{
					ErrorHelper.ErrorMessage("Cannot find the report file", "Please make sure you have access to reports path and the files are not corrupted.", "'Purchase By Item Vendor Buyer Inv.repx'");
				}
				else
				{
					xtraReport.DataSource = data;
					reportHelper.ShowReport(xtraReport);
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
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Micromind.ClientUI.Reports.Customers.PurchaseByInventoryItemVendorBuyerReport));
			buttonOK = new System.Windows.Forms.Button();
			buttonClose = new System.Windows.Forms.Button();
			ultraGroupBox1 = new Infragistics.Win.Misc.UltraGroupBox();
			productSelector = new Micromind.DataControls.ProductSelector();
			ultraGroupBox2 = new Infragistics.Win.Misc.UltraGroupBox();
			vendorSelector = new Micromind.DataControls.VendorSelector();
			ultraGroupBox3 = new Infragistics.Win.Misc.UltraGroupBox();
			BuyerSelector = new Micromind.DataControls.BuyerSelector();
			ultraGroupBox4 = new Infragistics.Win.Misc.UltraGroupBox();
			locationSelector = new Micromind.DataControls.LocationSelector();
			dateControl1 = new Micromind.DataControls.DateControl();
			((System.ComponentModel.ISupportInitialize)ultraGroupBox1).BeginInit();
			ultraGroupBox1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)ultraGroupBox2).BeginInit();
			ultraGroupBox2.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)ultraGroupBox3).BeginInit();
			ultraGroupBox3.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)ultraGroupBox4).BeginInit();
			ultraGroupBox4.SuspendLayout();
			SuspendLayout();
			buttonOK.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right);
			buttonOK.Location = new System.Drawing.Point(283, 595);
			buttonOK.Name = "buttonOK";
			buttonOK.Size = new System.Drawing.Size(98, 24);
			buttonOK.TabIndex = 4;
			buttonOK.Text = "&Display";
			buttonOK.UseVisualStyleBackColor = true;
			buttonOK.Click += new System.EventHandler(buttonOK_Click);
			buttonClose.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right);
			buttonClose.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			buttonClose.Location = new System.Drawing.Point(387, 595);
			buttonClose.Name = "buttonClose";
			buttonClose.Size = new System.Drawing.Size(98, 24);
			buttonClose.TabIndex = 5;
			buttonClose.Text = "&Close";
			buttonClose.UseVisualStyleBackColor = true;
			buttonClose.Click += new System.EventHandler(buttonClose_Click);
			ultraGroupBox1.Controls.Add(productSelector);
			ultraGroupBox1.Location = new System.Drawing.Point(12, 12);
			ultraGroupBox1.Name = "ultraGroupBox1";
			ultraGroupBox1.Size = new System.Drawing.Size(476, 206);
			ultraGroupBox1.TabIndex = 0;
			ultraGroupBox1.Text = "Items";
			productSelector.BackColor = System.Drawing.Color.Transparent;
			productSelector.CustomReportFieldName = "";
			productSelector.CustomReportKey = "";
			productSelector.CustomReportValueType = 1;
			productSelector.Location = new System.Drawing.Point(15, 18);
			productSelector.Name = "productSelector";
			productSelector.ShowOnlyAssemlbyItems = false;
			productSelector.Size = new System.Drawing.Size(446, 186);
			productSelector.TabIndex = 1;
			ultraGroupBox2.Controls.Add(vendorSelector);
			ultraGroupBox2.Location = new System.Drawing.Point(12, 221);
			ultraGroupBox2.Name = "ultraGroupBox2";
			ultraGroupBox2.Size = new System.Drawing.Size(476, 147);
			ultraGroupBox2.TabIndex = 6;
			ultraGroupBox2.Text = "Vendors";
			vendorSelector.BackColor = System.Drawing.Color.Transparent;
			vendorSelector.CustomReportFieldName = "";
			vendorSelector.CustomReportKey = "";
			vendorSelector.CustomReportValueType = 1;
			vendorSelector.Location = new System.Drawing.Point(11, 19);
			vendorSelector.Name = "vendorSelector";
			vendorSelector.Size = new System.Drawing.Size(432, 122);
			vendorSelector.TabIndex = 9;
			ultraGroupBox3.Controls.Add(BuyerSelector);
			ultraGroupBox3.Location = new System.Drawing.Point(12, 374);
			ultraGroupBox3.Name = "ultraGroupBox3";
			ultraGroupBox3.Size = new System.Drawing.Size(476, 76);
			ultraGroupBox3.TabIndex = 7;
			ultraGroupBox3.Text = "Buyers";
			BuyerSelector.BackColor = System.Drawing.Color.Transparent;
			BuyerSelector.Location = new System.Drawing.Point(9, 19);
			BuyerSelector.Name = "BuyerSelector";
			BuyerSelector.Size = new System.Drawing.Size(433, 49);
			BuyerSelector.TabIndex = 9;
			ultraGroupBox4.Controls.Add(locationSelector);
			ultraGroupBox4.Location = new System.Drawing.Point(12, 449);
			ultraGroupBox4.Name = "ultraGroupBox4";
			ultraGroupBox4.Size = new System.Drawing.Size(476, 76);
			ultraGroupBox4.TabIndex = 8;
			ultraGroupBox4.Text = "Locations";
			locationSelector.BackColor = System.Drawing.Color.Transparent;
			locationSelector.CustomReportFieldName = "";
			locationSelector.CustomReportKey = "";
			locationSelector.CustomReportValueType = 1;
			locationSelector.Location = new System.Drawing.Point(6, 19);
			locationSelector.Name = "locationSelector";
			locationSelector.Size = new System.Drawing.Size(436, 55);
			locationSelector.TabIndex = 0;
			dateControl1.CustomReportFieldName = "";
			dateControl1.CustomReportKey = "";
			dateControl1.CustomReportValueType = 1;
			dateControl1.FromDate = new System.DateTime(2017, 10, 1, 0, 0, 0, 0);
			dateControl1.Location = new System.Drawing.Point(12, 528);
			dateControl1.Name = "dateControl1";
			dateControl1.SelectedPeriod = Micromind.DataControls.DatePeriods.ThisMonthToDate;
			dateControl1.Size = new System.Drawing.Size(476, 57);
			dateControl1.TabIndex = 1;
			dateControl1.ToDate = new System.DateTime(2017, 10, 16, 23, 59, 59, 59);
			base.AcceptButton = buttonOK;
			base.AutoScaleDimensions = new System.Drawing.SizeF(6f, 13f);
			base.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			BackColor = System.Drawing.Color.WhiteSmoke;
			base.CancelButton = buttonClose;
			base.ClientSize = new System.Drawing.Size(502, 631);
			base.Controls.Add(ultraGroupBox4);
			base.Controls.Add(ultraGroupBox3);
			base.Controls.Add(ultraGroupBox2);
			base.Controls.Add(ultraGroupBox1);
			base.Controls.Add(dateControl1);
			base.Controls.Add(buttonClose);
			base.Controls.Add(buttonOK);
			base.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			base.Icon = (System.Drawing.Icon)resources.GetObject("$this.Icon");
			base.MaximizeBox = false;
			base.Name = "PurchaseByInventoryItemVendorBuyerReport";
			Text = "Purchase by Inv Item, Vendor, Buyer,Location Report";
			((System.ComponentModel.ISupportInitialize)ultraGroupBox1).EndInit();
			ultraGroupBox1.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)ultraGroupBox2).EndInit();
			ultraGroupBox2.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)ultraGroupBox3).EndInit();
			ultraGroupBox3.ResumeLayout(false);
			((System.ComponentModel.ISupportInitialize)ultraGroupBox4).EndInit();
			ultraGroupBox4.ResumeLayout(false);
			ResumeLayout(false);
		}
	}
}
