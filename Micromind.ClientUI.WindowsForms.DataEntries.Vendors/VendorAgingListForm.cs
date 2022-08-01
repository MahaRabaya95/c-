using Infragistics.Win;
using Infragistics.Win.UltraWinGrid;
using Micromind.ClientLibraries;
using Micromind.ClientUI.Libraries;
using Micromind.ClientUI.Properties;
using Micromind.Common.Data;
using Micromind.Common.Interfaces;
using Micromind.UISupport;
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Windows.Forms;

namespace Micromind.ClientUI.WindowsForms.DataEntries.Vendors
{
	public class VendorAgingListForm : Form, IDataForm, IDataList, IExternalReport
	{
		private bool isFirstTimeActivating = true;

		private Hashtable listViewKeys = new Hashtable();

		private bool isReadOnly;

		private DateTime dateTimeStamp = DateTime.MinValue;

		private DataSet vendorData;

		private bool showInactiveItems;

		private XPButton buttonDone;

		private XPButton buttonNew;

		private XPButton buttonDelete;

		private Panel panelButtons;

		private Line linePanelDown;

		private IContainer components;

		private XPButton buttonOpen;

		private DataGridList dataGridList;

		private ToolStripButton toolStripButtonPrint;

		private ToolStripButton toolStripButtonRefresh;

		private UltraGridPrintDocument ultraGridPrintDocument1;

		private ToolStripDropDownButton toolStripDropDownButton1;

		private ToolStripMenuItem microsoftExcelToolStripMenuItem;

		private ToolStripSeparator toolStripSeparator1;

		private ToolStripSeparator toolStripSeparator2;

		private ToolStripButton toolStripButtonAllowGrouping;

		private ToolStripSeparator toolStripSeparator3;

		private ToolStripButton toolStripButtonColumnChooser;

		private ToolStripButton toolStripButtonAutoFit;

		private ToolStripButton toolStripButtonAutoAllocate;

		private CheckBox checkBoxShowZero;

		private ContextMenuStrip contextMenuStripList;

		private ToolStripMenuItem flagsToolStripMenuItem;

		private ToolStripMenuItem toolStripItemFlagGreen;

		private ToolStripMenuItem toolStripItemFlagYellow;

		private ToolStripMenuItem toolStripItemFlagBlue;

		private ToolStripMenuItem toolStripItemFlagPurple;

		private ToolStripMenuItem toolStripItemFlagOrange;

		private ToolStripMenuItem toolStripItemFlagRed;

		private ToolStripSeparator toolStripSeparator4;

		private ToolStripMenuItem toolStripItemFlagComplete;

		private ToolStripMenuItem toolStripItemClearFlag;

		private ImageList imageList1;

		private ToolStripMenuItem toolStripItemFlagImportant;

		private ToolStripSeparator toolStripSeparator5;

		private ToolStripButton toolStripButtonMerge;

		private ToolStripButton toolStripButtonFitText;

		private ToolStripButton toolStripButtonClearFilter;

		private CheckBox checkBoxFC;

		private ToolStrip toolStrip1;

		private ScreenAccessRight screenRight;

		private bool allowflagvendors;

		public ScreenAreas ScreenArea => ScreenAreas.Sales;

		public int ScreenID => 1016;

		public ScreenTypes ScreenType => ScreenTypes.List;

		private bool ShowInactiveItems
		{
			get
			{
				return showInactiveItems;
			}
			set
			{
				showInactiveItems = value;
			}
		}

		public VendorAgingListForm()
		{
			InitializeComponent();
			base.Activated += VendorBalanceListForm_Activated;
			dataGridList.DoubleClickRow += dataGridList_DoubleClickRow;
			dataGridList.NewMenuClicked += dataGridList_NewMenuClicked;
			dataGridList.OpenMenuClicked += dataGridList_OpenMenuClicked;
			dataGridList.DeleteMenuClicked += dataGridList_DeleteMenuClicked;
			base.FormClosing += VendorBalanceListForm_FormClosing;
			dataGridList.DropDownMenu.Opening += contextMenuStripList_Opening;
			dataGridList.DropDownMenu.Items.AddRange(contextMenuStripList.Items);
			dataGridList.InitializeLayout += dataGridList_InitializeLayout;
			dataGridList.InitializeRow += dataGridList_InitializeRow;
			dataGridList.AfterCellUpdate += dataGridList_AfterCellUpdate;
			toolStripItemFlagGreen.Text = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.VenFlagGreen, "Green");
			toolStripItemFlagRed.Text = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.VenFlagRed, "Red");
			toolStripItemFlagYellow.Text = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.VenFlagYellow, "Yellow");
			toolStripItemFlagPurple.Text = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.VenFlagPurple, "Purple");
			toolStripItemFlagBlue.Text = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.VenFlagBlue, "Blue");
			toolStripItemFlagOrange.Text = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.VenFlagOrange, "Orange");
		}

		private void dataGridList_AfterCellUpdate(object sender, CellEventArgs e)
		{
			if (e.Cell.Column.Key == "CollectionRemarks")
			{
				Factory.DatabaseSystem.UpdateFieldValue("Vendor", "CollectionRemarks", Global.CurrentUser + ":" + e.Cell.Value, typeof(string), "VendorID", e.Cell.Row.Cells["VendorID"].Value.ToString());
			}
		}

		private void dataGridList_InitializeLayout(object sender, InitializeLayoutEventArgs e)
		{
		}

		private void dataGridList_InitializeRow(object sender, InitializeRowEventArgs e)
		{
		}

		private void VendorBalanceListForm_FormClosing(object sender, FormClosingEventArgs e)
		{
			try
			{
				Global.GlobalSettings.SaveFormProperties(this);
				UserPreferences.SaveCurrentUserSetting(base.Name + "MergeCell", toolStripButtonMerge.Checked);
				dataGridList.SaveLayout();
			}
			catch (Exception e2)
			{
				ErrorHelper.ProcessError(e2);
			}
		}

		private void dataGridList_DeleteMenuClicked(object sender, EventArgs e)
		{
			Delete();
		}

		private void dataGridList_OpenMenuClicked(object sender, EventArgs e)
		{
			OpenForEdit();
		}

		private void dataGridList_NewMenuClicked(object sender, EventArgs e)
		{
			New();
		}

		private void dataGridList_DoubleClickRow(object sender, DoubleClickRowEventArgs e)
		{
			if (e.Row.IsDataRow)
			{
				string selectedID = GetSelectedID();
				VendorLedgerForm vendorLedgerForm = new VendorLedgerForm();
				vendorLedgerForm.SelectedID = selectedID;
				vendorLedgerForm.Show();
			}
		}

		private void VendorBalanceListForm_Activated(object sender, EventArgs e)
		{
			if (isFirstTimeActivating)
			{
				isFirstTimeActivating = false;
			}
		}

		protected override void Dispose(bool disposing)
		{
			if (disposing && vendorData != null)
			{
				vendorData.Dispose();
				vendorData = null;
			}
			base.Dispose(disposing);
		}

		private void InitializeComponent()
		{
			components = new System.ComponentModel.Container();
			System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Micromind.ClientUI.WindowsForms.DataEntries.Vendors.VendorAgingListForm));
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
			panelButtons = new System.Windows.Forms.Panel();
			checkBoxShowZero = new System.Windows.Forms.CheckBox();
			linePanelDown = new Micromind.UISupport.Line();
			buttonDelete = new Micromind.UISupport.XPButton();
			buttonDone = new Micromind.UISupport.XPButton();
			buttonOpen = new Micromind.UISupport.XPButton();
			buttonNew = new Micromind.UISupport.XPButton();
			toolStrip1 = new System.Windows.Forms.ToolStrip();
			toolStripButtonRefresh = new System.Windows.Forms.ToolStripButton();
			toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
			toolStripButtonPrint = new System.Windows.Forms.ToolStripButton();
			toolStripDropDownButton1 = new System.Windows.Forms.ToolStripDropDownButton();
			microsoftExcelToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
			toolStripButtonAllowGrouping = new System.Windows.Forms.ToolStripButton();
			toolStripButtonAutoFit = new System.Windows.Forms.ToolStripButton();
			toolStripButtonFitText = new System.Windows.Forms.ToolStripButton();
			toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
			toolStripButtonColumnChooser = new System.Windows.Forms.ToolStripButton();
			toolStripButtonMerge = new System.Windows.Forms.ToolStripButton();
			toolStripButtonAutoAllocate = new System.Windows.Forms.ToolStripButton();
			toolStripButtonClearFilter = new System.Windows.Forms.ToolStripButton();
			dataGridList = new Micromind.UISupport.DataGridList(components);
			ultraGridPrintDocument1 = new Infragistics.Win.UltraWinGrid.UltraGridPrintDocument(components);
			contextMenuStripList = new System.Windows.Forms.ContextMenuStrip(components);
			flagsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			toolStripItemFlagGreen = new System.Windows.Forms.ToolStripMenuItem();
			toolStripItemFlagYellow = new System.Windows.Forms.ToolStripMenuItem();
			toolStripItemFlagBlue = new System.Windows.Forms.ToolStripMenuItem();
			toolStripItemFlagPurple = new System.Windows.Forms.ToolStripMenuItem();
			toolStripItemFlagOrange = new System.Windows.Forms.ToolStripMenuItem();
			toolStripItemFlagRed = new System.Windows.Forms.ToolStripMenuItem();
			toolStripSeparator5 = new System.Windows.Forms.ToolStripSeparator();
			toolStripItemFlagImportant = new System.Windows.Forms.ToolStripMenuItem();
			toolStripSeparator4 = new System.Windows.Forms.ToolStripSeparator();
			toolStripItemFlagComplete = new System.Windows.Forms.ToolStripMenuItem();
			toolStripItemClearFlag = new System.Windows.Forms.ToolStripMenuItem();
			imageList1 = new System.Windows.Forms.ImageList(components);
			checkBoxFC = new System.Windows.Forms.CheckBox();
			panelButtons.SuspendLayout();
			toolStrip1.SuspendLayout();
			((System.ComponentModel.ISupportInitialize)dataGridList).BeginInit();
			contextMenuStripList.SuspendLayout();
			SuspendLayout();
			panelButtons.Controls.Add(checkBoxFC);
			panelButtons.Controls.Add(checkBoxShowZero);
			panelButtons.Controls.Add(linePanelDown);
			panelButtons.Controls.Add(buttonDelete);
			panelButtons.Controls.Add(buttonDone);
			panelButtons.Controls.Add(buttonOpen);
			panelButtons.Controls.Add(buttonNew);
			panelButtons.Dock = System.Windows.Forms.DockStyle.Bottom;
			panelButtons.Location = new System.Drawing.Point(0, 450);
			panelButtons.Name = "panelButtons";
			panelButtons.Size = new System.Drawing.Size(831, 40);
			panelButtons.TabIndex = 1;
			checkBoxShowZero.AutoSize = true;
			checkBoxShowZero.Location = new System.Drawing.Point(335, 11);
			checkBoxShowZero.Name = "checkBoxShowZero";
			checkBoxShowZero.Size = new System.Drawing.Size(188, 17);
			checkBoxShowZero.TabIndex = 3;
			checkBoxShowZero.Text = "Include vendors with zero balance";
			checkBoxShowZero.UseVisualStyleBackColor = true;
			linePanelDown.BackColor = System.Drawing.Color.White;
			linePanelDown.Dock = System.Windows.Forms.DockStyle.Top;
			linePanelDown.DrawWidth = 1;
			linePanelDown.IsVertical = false;
			linePanelDown.LineBackColor = System.Drawing.Color.Silver;
			linePanelDown.Location = new System.Drawing.Point(0, 0);
			linePanelDown.Name = "linePanelDown";
			linePanelDown.Size = new System.Drawing.Size(831, 1);
			linePanelDown.TabIndex = 14;
			linePanelDown.TabStop = false;
			buttonDelete.AdjustImageLocation = new System.Drawing.Point(0, 0);
			buttonDelete.BackColor = System.Drawing.Color.DarkGray;
			buttonDelete.BtnShape = Micromind.UISupport.BtnShape.Rectangle;
			buttonDelete.BtnStyle = Micromind.UISupport.XPStyle.Default;
			buttonDelete.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			buttonDelete.Location = new System.Drawing.Point(216, 8);
			buttonDelete.Name = "buttonDelete";
			buttonDelete.Size = new System.Drawing.Size(96, 22);
			buttonDelete.TabIndex = 2;
			buttonDelete.Text = "De&lete";
			buttonDelete.UseVisualStyleBackColor = false;
			buttonDelete.Click += new System.EventHandler(buttonDelete_Click);
			buttonDone.AdjustImageLocation = new System.Drawing.Point(0, 0);
			buttonDone.Anchor = (System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right);
			buttonDone.BackColor = System.Drawing.Color.DarkGray;
			buttonDone.BtnShape = Micromind.UISupport.BtnShape.Rectangle;
			buttonDone.BtnStyle = Micromind.UISupport.XPStyle.Default;
			buttonDone.DialogResult = System.Windows.Forms.DialogResult.Cancel;
			buttonDone.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			buttonDone.Location = new System.Drawing.Point(723, 8);
			buttonDone.Name = "buttonDone";
			buttonDone.Size = new System.Drawing.Size(96, 22);
			buttonDone.TabIndex = 5;
			buttonDone.Text = "&Close";
			buttonDone.UseVisualStyleBackColor = false;
			buttonDone.Click += new System.EventHandler(buttonDone_Click);
			buttonOpen.AdjustImageLocation = new System.Drawing.Point(0, 0);
			buttonOpen.BackColor = System.Drawing.Color.DarkGray;
			buttonOpen.BtnShape = Micromind.UISupport.BtnShape.Rectangle;
			buttonOpen.BtnStyle = Micromind.UISupport.XPStyle.Default;
			buttonOpen.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			buttonOpen.Location = new System.Drawing.Point(12, 8);
			buttonOpen.Name = "buttonOpen";
			buttonOpen.Size = new System.Drawing.Size(96, 22);
			buttonOpen.TabIndex = 0;
			buttonOpen.Text = "&Open";
			buttonOpen.UseVisualStyleBackColor = false;
			buttonOpen.Click += new System.EventHandler(buttonGotoItem_Click);
			buttonNew.AdjustImageLocation = new System.Drawing.Point(0, 0);
			buttonNew.BackColor = System.Drawing.Color.DarkGray;
			buttonNew.BtnShape = Micromind.UISupport.BtnShape.Rectangle;
			buttonNew.BtnStyle = Micromind.UISupport.XPStyle.Default;
			buttonNew.ImeMode = System.Windows.Forms.ImeMode.NoControl;
			buttonNew.Location = new System.Drawing.Point(114, 8);
			buttonNew.Name = "buttonNew";
			buttonNew.Size = new System.Drawing.Size(96, 22);
			buttonNew.TabIndex = 1;
			buttonNew.Text = "Ne&w...";
			buttonNew.UseVisualStyleBackColor = false;
			buttonNew.Click += new System.EventHandler(buttonNew_Click);
			toolStrip1.GripStyle = System.Windows.Forms.ToolStripGripStyle.Hidden;
			toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[13]
			{
				toolStripButtonRefresh,
				toolStripSeparator1,
				toolStripButtonPrint,
				toolStripDropDownButton1,
				toolStripSeparator2,
				toolStripButtonAllowGrouping,
				toolStripButtonAutoFit,
				toolStripButtonFitText,
				toolStripSeparator3,
				toolStripButtonColumnChooser,
				toolStripButtonMerge,
				toolStripButtonAutoAllocate,
				toolStripButtonClearFilter
			});
			toolStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
			toolStrip1.Location = new System.Drawing.Point(0, 0);
			toolStrip1.Name = "toolStrip1";
			toolStrip1.Size = new System.Drawing.Size(831, 25);
			toolStrip1.TabIndex = 289;
			toolStrip1.Text = "toolStrip1";
			toolStripButtonRefresh.Image = Micromind.ClientUI.Properties.Resources.Refresh;
			toolStripButtonRefresh.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonRefresh.Name = "toolStripButtonRefresh";
			toolStripButtonRefresh.Size = new System.Drawing.Size(66, 22);
			toolStripButtonRefresh.Text = "Refresh";
			toolStripButtonRefresh.Click += new System.EventHandler(toolStripButtonRefresh_Click);
			toolStripSeparator1.Name = "toolStripSeparator1";
			toolStripSeparator1.Size = new System.Drawing.Size(6, 25);
			toolStripButtonPrint.Image = Micromind.ClientUI.Properties.Resources.printer;
			toolStripButtonPrint.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonPrint.Name = "toolStripButtonPrint";
			toolStripButtonPrint.Size = new System.Drawing.Size(52, 22);
			toolStripButtonPrint.Text = "&Print";
			toolStripButtonPrint.Click += new System.EventHandler(toolStripButtonPrint_Click);
			toolStripDropDownButton1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[1]
			{
				microsoftExcelToolStripMenuItem
			});
			toolStripDropDownButton1.Image = (System.Drawing.Image)resources.GetObject("toolStripDropDownButton1.Image");
			toolStripDropDownButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripDropDownButton1.Name = "toolStripDropDownButton1";
			toolStripDropDownButton1.Size = new System.Drawing.Size(69, 22);
			toolStripDropDownButton1.Text = "Export";
			microsoftExcelToolStripMenuItem.Image = Micromind.ClientUI.Properties.Resources.Excel;
			microsoftExcelToolStripMenuItem.Name = "microsoftExcelToolStripMenuItem";
			microsoftExcelToolStripMenuItem.Size = new System.Drawing.Size(154, 22);
			microsoftExcelToolStripMenuItem.Text = "Microsoft Excel";
			microsoftExcelToolStripMenuItem.Click += new System.EventHandler(microsoftExcelToolStripMenuItem_Click);
			toolStripSeparator2.Name = "toolStripSeparator2";
			toolStripSeparator2.Size = new System.Drawing.Size(6, 25);
			toolStripButtonAllowGrouping.CheckOnClick = true;
			toolStripButtonAllowGrouping.Image = Micromind.ClientUI.Properties.Resources.Groupby;
			toolStripButtonAllowGrouping.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonAllowGrouping.Name = "toolStripButtonAllowGrouping";
			toolStripButtonAllowGrouping.Size = new System.Drawing.Size(110, 22);
			toolStripButtonAllowGrouping.Text = "Allow Grouping";
			toolStripButtonAllowGrouping.Click += new System.EventHandler(toolStripButtonAllowGrouping_Click);
			toolStripButtonAutoFit.Image = Micromind.ClientUI.Properties.Resources.autofit;
			toolStripButtonAutoFit.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonAutoFit.Name = "toolStripButtonAutoFit";
			toolStripButtonAutoFit.Size = new System.Drawing.Size(92, 22);
			toolStripButtonAutoFit.Text = "Fit to Screen";
			toolStripButtonAutoFit.Click += new System.EventHandler(toolStripButtonAutoFit_Click);
			toolStripButtonFitText.Image = Micromind.ClientUI.Properties.Resources.colbestsize;
			toolStripButtonFitText.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonFitText.Name = "toolStripButtonFitText";
			toolStripButtonFitText.Size = new System.Drawing.Size(79, 22);
			toolStripButtonFitText.Text = "Fit to Text";
			toolStripButtonFitText.Click += new System.EventHandler(toolStripButtonFitText_Click);
			toolStripSeparator3.Name = "toolStripSeparator3";
			toolStripSeparator3.Size = new System.Drawing.Size(6, 25);
			toolStripButtonColumnChooser.Image = Micromind.ClientUI.Properties.Resources.ColumnChooser;
			toolStripButtonColumnChooser.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonColumnChooser.Name = "toolStripButtonColumnChooser";
			toolStripButtonColumnChooser.Size = new System.Drawing.Size(75, 22);
			toolStripButtonColumnChooser.Text = "Columns";
			toolStripButtonColumnChooser.Click += new System.EventHandler(toolStripButtonColumnChooser_Click);
			toolStripButtonMerge.CheckOnClick = true;
			toolStripButtonMerge.Image = Micromind.ClientUI.Properties.Resources.merge;
			toolStripButtonMerge.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonMerge.Name = "toolStripButtonMerge";
			toolStripButtonMerge.Size = new System.Drawing.Size(89, 22);
			toolStripButtonMerge.Text = "Merge Cells";
			toolStripButtonMerge.Click += new System.EventHandler(toolStripButtonMerge_Click);
			toolStripButtonAutoAllocate.Image = (System.Drawing.Image)resources.GetObject("toolStripButtonAutoAllocate.Image");
			toolStripButtonAutoAllocate.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonAutoAllocate.Name = "toolStripButtonAutoAllocate";
			toolStripButtonAutoAllocate.Size = new System.Drawing.Size(99, 22);
			toolStripButtonAutoAllocate.Text = "Auto Allocate";
			toolStripButtonAutoAllocate.ToolTipText = "Auto allocate unallocated amounts";
			toolStripButtonAutoAllocate.Click += new System.EventHandler(toolStripButtonAutoAllocate_Click);
			toolStripButtonClearFilter.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
			toolStripButtonClearFilter.Image = Micromind.ClientUI.Properties.Resources.clearfilter;
			toolStripButtonClearFilter.ImageTransparentColor = System.Drawing.Color.Magenta;
			toolStripButtonClearFilter.Name = "toolStripButtonClearFilter";
			toolStripButtonClearFilter.Size = new System.Drawing.Size(23, 22);
			toolStripButtonClearFilter.Text = "Clear All Filters";
			toolStripButtonClearFilter.Click += new System.EventHandler(toolStripButtonClearFilter_Click);
			dataGridList.AllowUnfittedView = false;
			dataGridList.Anchor = (System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left | System.Windows.Forms.AnchorStyles.Right);
			appearance.BackColor = System.Drawing.SystemColors.Window;
			appearance.BorderColor = System.Drawing.SystemColors.InactiveCaption;
			dataGridList.DisplayLayout.Appearance = appearance;
			dataGridList.DisplayLayout.BorderStyle = Infragistics.Win.UIElementBorderStyle.Solid;
			dataGridList.DisplayLayout.CaptionVisible = Infragistics.Win.DefaultableBoolean.False;
			appearance2.BackColor = System.Drawing.SystemColors.ActiveBorder;
			appearance2.BackColor2 = System.Drawing.SystemColors.ControlDark;
			appearance2.BackGradientStyle = Infragistics.Win.GradientStyle.Vertical;
			appearance2.BorderColor = System.Drawing.SystemColors.Window;
			dataGridList.DisplayLayout.GroupByBox.Appearance = appearance2;
			appearance3.ForeColor = System.Drawing.SystemColors.GrayText;
			dataGridList.DisplayLayout.GroupByBox.BandLabelAppearance = appearance3;
			dataGridList.DisplayLayout.GroupByBox.BorderStyle = Infragistics.Win.UIElementBorderStyle.Solid;
			appearance4.BackColor = System.Drawing.SystemColors.ControlLightLight;
			appearance4.BackColor2 = System.Drawing.SystemColors.Control;
			appearance4.BackGradientStyle = Infragistics.Win.GradientStyle.Horizontal;
			appearance4.ForeColor = System.Drawing.SystemColors.GrayText;
			dataGridList.DisplayLayout.GroupByBox.PromptAppearance = appearance4;
			dataGridList.DisplayLayout.MaxColScrollRegions = 1;
			dataGridList.DisplayLayout.MaxRowScrollRegions = 1;
			appearance5.BackColor = System.Drawing.SystemColors.Window;
			appearance5.ForeColor = System.Drawing.SystemColors.ControlText;
			dataGridList.DisplayLayout.Override.ActiveCellAppearance = appearance5;
			appearance6.BackColor = System.Drawing.SystemColors.Highlight;
			appearance6.ForeColor = System.Drawing.SystemColors.HighlightText;
			dataGridList.DisplayLayout.Override.ActiveRowAppearance = appearance6;
			dataGridList.DisplayLayout.Override.BorderStyleCell = Infragistics.Win.UIElementBorderStyle.Dotted;
			dataGridList.DisplayLayout.Override.BorderStyleRow = Infragistics.Win.UIElementBorderStyle.Dotted;
			appearance7.BackColor = System.Drawing.SystemColors.Window;
			dataGridList.DisplayLayout.Override.CardAreaAppearance = appearance7;
			appearance8.BorderColor = System.Drawing.Color.Silver;
			appearance8.TextTrimming = Infragistics.Win.TextTrimming.EllipsisCharacter;
			dataGridList.DisplayLayout.Override.CellAppearance = appearance8;
			dataGridList.DisplayLayout.Override.CellClickAction = Infragistics.Win.UltraWinGrid.CellClickAction.EditAndSelectText;
			dataGridList.DisplayLayout.Override.CellPadding = 0;
			appearance9.BackColor = System.Drawing.SystemColors.Control;
			appearance9.BackColor2 = System.Drawing.SystemColors.ControlDark;
			appearance9.BackGradientAlignment = Infragistics.Win.GradientAlignment.Element;
			appearance9.BackGradientStyle = Infragistics.Win.GradientStyle.Horizontal;
			appearance9.BorderColor = System.Drawing.SystemColors.Window;
			dataGridList.DisplayLayout.Override.GroupByRowAppearance = appearance9;
			appearance10.TextHAlignAsString = "Left";
			dataGridList.DisplayLayout.Override.HeaderAppearance = appearance10;
			dataGridList.DisplayLayout.Override.HeaderClickAction = Infragistics.Win.UltraWinGrid.HeaderClickAction.SortMulti;
			dataGridList.DisplayLayout.Override.HeaderStyle = Infragistics.Win.HeaderStyle.WindowsXPCommand;
			appearance11.BackColor = System.Drawing.SystemColors.Window;
			appearance11.BorderColor = System.Drawing.Color.Silver;
			dataGridList.DisplayLayout.Override.RowAppearance = appearance11;
			dataGridList.DisplayLayout.Override.RowSelectors = Infragistics.Win.DefaultableBoolean.False;
			appearance12.BackColor = System.Drawing.SystemColors.ControlLight;
			dataGridList.DisplayLayout.Override.TemplateAddRowAppearance = appearance12;
			dataGridList.DisplayLayout.ScrollBounds = Infragistics.Win.UltraWinGrid.ScrollBounds.ScrollToFill;
			dataGridList.DisplayLayout.ScrollStyle = Infragistics.Win.UltraWinGrid.ScrollStyle.Immediate;
			dataGridList.DisplayLayout.ViewStyleBand = Infragistics.Win.UltraWinGrid.ViewStyleBand.OutlookGroupBy;
			dataGridList.Location = new System.Drawing.Point(12, 37);
			dataGridList.Name = "dataGridList";
			dataGridList.ShowDeleteMenu = false;
			dataGridList.ShowMinusInRed = true;
			dataGridList.ShowNewMenu = false;
			dataGridList.Size = new System.Drawing.Size(807, 402);
			dataGridList.TabIndex = 290;
			dataGridList.Text = "dataGridList1";
			ultraGridPrintDocument1.Grid = dataGridList;
			contextMenuStripList.Items.AddRange(new System.Windows.Forms.ToolStripItem[1]
			{
				flagsToolStripMenuItem
			});
			contextMenuStripList.Name = "contextMenuStripList";
			contextMenuStripList.Size = new System.Drawing.Size(102, 26);
			contextMenuStripList.Opening += new System.ComponentModel.CancelEventHandler(contextMenuStripList_Opening);
			flagsToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[11]
			{
				toolStripItemFlagGreen,
				toolStripItemFlagYellow,
				toolStripItemFlagBlue,
				toolStripItemFlagPurple,
				toolStripItemFlagOrange,
				toolStripItemFlagRed,
				toolStripSeparator5,
				toolStripItemFlagImportant,
				toolStripSeparator4,
				toolStripItemFlagComplete,
				toolStripItemClearFlag
			});
			flagsToolStripMenuItem.Name = "flagsToolStripMenuItem";
			flagsToolStripMenuItem.Size = new System.Drawing.Size(101, 22);
			flagsToolStripMenuItem.Text = "Flags";
			toolStripItemFlagGreen.Image = Micromind.ClientUI.Properties.Resources.flaggreen;
			toolStripItemFlagGreen.Name = "toolStripItemFlagGreen";
			toolStripItemFlagGreen.Size = new System.Drawing.Size(163, 22);
			toolStripItemFlagGreen.Tag = "1";
			toolStripItemFlagGreen.Text = "Green";
			toolStripItemFlagGreen.Click += new System.EventHandler(toolStripItemFlag_Click);
			toolStripItemFlagYellow.Image = Micromind.ClientUI.Properties.Resources.flaghyellow;
			toolStripItemFlagYellow.Name = "toolStripItemFlagYellow";
			toolStripItemFlagYellow.Size = new System.Drawing.Size(163, 22);
			toolStripItemFlagYellow.Tag = "2";
			toolStripItemFlagYellow.Text = "Yellow";
			toolStripItemFlagYellow.Click += new System.EventHandler(toolStripItemFlag_Click);
			toolStripItemFlagBlue.Image = Micromind.ClientUI.Properties.Resources.flagblue;
			toolStripItemFlagBlue.Name = "toolStripItemFlagBlue";
			toolStripItemFlagBlue.Size = new System.Drawing.Size(163, 22);
			toolStripItemFlagBlue.Tag = "3";
			toolStripItemFlagBlue.Text = "Blue";
			toolStripItemFlagBlue.Click += new System.EventHandler(toolStripItemFlag_Click);
			toolStripItemFlagPurple.Image = Micromind.ClientUI.Properties.Resources.flagpurple;
			toolStripItemFlagPurple.Name = "toolStripItemFlagPurple";
			toolStripItemFlagPurple.Size = new System.Drawing.Size(163, 22);
			toolStripItemFlagPurple.Tag = "4";
			toolStripItemFlagPurple.Text = "Purple";
			toolStripItemFlagPurple.Click += new System.EventHandler(toolStripItemFlag_Click);
			toolStripItemFlagOrange.Image = Micromind.ClientUI.Properties.Resources.flagorange;
			toolStripItemFlagOrange.Name = "toolStripItemFlagOrange";
			toolStripItemFlagOrange.Size = new System.Drawing.Size(163, 22);
			toolStripItemFlagOrange.Tag = "5";
			toolStripItemFlagOrange.Text = "Orange";
			toolStripItemFlagOrange.Click += new System.EventHandler(toolStripItemFlag_Click);
			toolStripItemFlagRed.Image = Micromind.ClientUI.Properties.Resources.flagred;
			toolStripItemFlagRed.Name = "toolStripItemFlagRed";
			toolStripItemFlagRed.Size = new System.Drawing.Size(163, 22);
			toolStripItemFlagRed.Tag = "6";
			toolStripItemFlagRed.Text = "Red";
			toolStripItemFlagRed.Click += new System.EventHandler(toolStripItemFlag_Click);
			toolStripSeparator5.Name = "toolStripSeparator5";
			toolStripSeparator5.Size = new System.Drawing.Size(160, 6);
			toolStripItemFlagImportant.Image = Micromind.ClientUI.Properties.Resources.important;
			toolStripItemFlagImportant.ImageTransparentColor = System.Drawing.Color.White;
			toolStripItemFlagImportant.Name = "toolStripItemFlagImportant";
			toolStripItemFlagImportant.Size = new System.Drawing.Size(163, 22);
			toolStripItemFlagImportant.Tag = "20";
			toolStripItemFlagImportant.Text = "Important";
			toolStripItemFlagImportant.Click += new System.EventHandler(toolStripItemFlag_Click);
			toolStripSeparator4.Name = "toolStripSeparator4";
			toolStripSeparator4.Size = new System.Drawing.Size(160, 6);
			toolStripItemFlagComplete.Image = Micromind.ClientUI.Properties.Resources.completed;
			toolStripItemFlagComplete.Name = "toolStripItemFlagComplete";
			toolStripItemFlagComplete.Size = new System.Drawing.Size(163, 22);
			toolStripItemFlagComplete.Tag = "100";
			toolStripItemFlagComplete.Text = "Mark Completed";
			toolStripItemFlagComplete.Click += new System.EventHandler(toolStripItemFlag_Click);
			toolStripItemClearFlag.Name = "toolStripItemClearFlag";
			toolStripItemClearFlag.Size = new System.Drawing.Size(163, 22);
			toolStripItemClearFlag.Tag = "0";
			toolStripItemClearFlag.Text = "Clear Flag";
			toolStripItemClearFlag.Click += new System.EventHandler(toolStripItemFlag_Click);
			imageList1.ImageStream = (System.Windows.Forms.ImageListStreamer)resources.GetObject("imageList1.ImageStream");
			imageList1.TransparentColor = System.Drawing.Color.Transparent;
			imageList1.Images.SetKeyName(0, "flaggreen.png");
			imageList1.Images.SetKeyName(1, "flaghyellow.png");
			imageList1.Images.SetKeyName(2, "flagblue.png");
			imageList1.Images.SetKeyName(3, "flagpurple.png");
			imageList1.Images.SetKeyName(4, "flagorange.png");
			imageList1.Images.SetKeyName(5, "flagred.png");
			imageList1.Images.SetKeyName(6, "important.png");
			imageList1.Images.SetKeyName(7, "completed.png");
			checkBoxFC.AutoSize = true;
			checkBoxFC.Location = new System.Drawing.Point(529, 11);
			checkBoxFC.Name = "checkBoxFC";
			checkBoxFC.Size = new System.Drawing.Size(106, 17);
			checkBoxFC.TabIndex = 4;
			checkBoxFC.Text = "Foreign Currency";
			checkBoxFC.UseVisualStyleBackColor = true;
			base.AcceptButton = buttonOpen;
			AutoScaleBaseSize = new System.Drawing.Size(5, 13);
			BackColor = System.Drawing.Color.WhiteSmoke;
			base.CancelButton = buttonDone;
			base.ClientSize = new System.Drawing.Size(831, 490);
			base.Controls.Add(dataGridList);
			base.Controls.Add(toolStrip1);
			base.Controls.Add(panelButtons);
			DoubleBuffered = true;
			base.Icon = (System.Drawing.Icon)resources.GetObject("$this.Icon");
			base.KeyPreview = true;
			base.Name = "VendorAgingListForm";
			Text = "Vendor Aging List";
			base.Load += new System.EventHandler(VendorBalanceListForm_Load);
			panelButtons.ResumeLayout(false);
			panelButtons.PerformLayout();
			toolStrip1.ResumeLayout(false);
			toolStrip1.PerformLayout();
			((System.ComponentModel.ISupportInitialize)dataGridList).EndInit();
			contextMenuStripList.ResumeLayout(false);
			ResumeLayout(false);
			PerformLayout();
		}

		private void Init()
		{
			Global.GlobalSettings.LoadFormProperties(this);
			toolStripButtonMerge.Checked = UserPreferences.GetCurrentUserSetting(base.Name + "MergeCell", defaultValue: false);
		}

		private void LoadData()
		{
			if (Factory.IsDBConnected)
			{
				try
				{
					PublicFunctions.StartWaiting(this);
					vendorData = Factory.VendorSystem.GetVendorAgingBalanceList(checkBoxShowZero.Checked, checkBoxFC.Checked);
					dataGridList.DataSource = vendorData.Tables[0];
					dataGridList.ApplyFormat();
				}
				catch (SqlException ex)
				{
					ErrorHelper.ProcessError(ex);
				}
				catch (Exception e)
				{
					ErrorHelper.ProcessError(e);
				}
				finally
				{
					PublicFunctions.EndWaiting(this);
				}
			}
		}

		private void HighlightOverdueRows()
		{
		}

		private void HideShowColumns()
		{
			if (dataGridList.DisplayLayout.Bands.Count != 0)
			{
				UltraGridColumn ultraGridColumn = dataGridList.DisplayLayout.Bands[0].Columns["PaymentTermID"];
				UltraGridColumn ultraGridColumn2 = dataGridList.DisplayLayout.Bands[0].Columns["ContactName"];
				UltraGridColumn ultraGridColumn3 = dataGridList.DisplayLayout.Bands[0].Columns["ContactTitle"];
				bool flag2 = dataGridList.DisplayLayout.Bands[0].Columns["PostalCode"].Hidden = true;
				bool flag4 = ultraGridColumn3.Hidden = flag2;
				bool hidden = ultraGridColumn2.Hidden = flag4;
				ultraGridColumn.Hidden = hidden;
				dataGridList.DisplayLayout.Bands[0].Columns["Email"].Hidden = true;
				dataGridList.DisplayLayout.Bands[0].Columns["Mobile"].Hidden = true;
				dataGridList.DisplayLayout.Bands[0].Columns["Phone1"].Hidden = true;
				dataGridList.DisplayLayout.Bands[0].Columns["Phone2"].Hidden = true;
				dataGridList.DisplayLayout.Bands[0].Columns["Fax"].Hidden = true;
				dataGridList.DisplayLayout.Bands[0].Columns["LastPaymentDate"].Hidden = true;
				dataGridList.DisplayLayout.Bands[0].Columns["LastPurchaseDate"].Hidden = true;
			}
		}

		private void buttonDone_Click(object sender, EventArgs e)
		{
			Close();
		}

		private void OpenForEdit()
		{
			string selectedID = GetSelectedID();
			if (!(selectedID == ""))
			{
				FormActivator.VendorDetailsFormObj.LoadData(selectedID);
				FormActivator.BringFormToFront(FormActivator.VendorDetailsFormObj);
			}
		}

		private void listViewItems_DoubleClick(object sender, EventArgs e)
		{
			OpenForEdit();
		}

		private void buttonNew_Click(object sender, EventArgs e)
		{
			New();
		}

		private void New()
		{
			FormActivator.BringFormToFront(FormActivator.VendorDetailsFormObj);
		}

		private void buttonGotoItem_Click(object sender, EventArgs e)
		{
			OpenForEdit();
		}

		private void VendorBalanceListForm_Load(object sender, EventArgs e)
		{
			try
			{
				SetSecurity();
				Init();
				LoadData();
				SetupGrid();
			}
			catch (Exception e2)
			{
				dataGridList.LoadLayoutFailed = true;
				ErrorHelper.ProcessError(e2);
			}
		}

		private void SetupGrid()
		{
			try
			{
				HideShowColumns();
				dataGridList.LoadLayout();
				dataGridList.ApplyUIDesign();
				new DataHelper();
				CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingByDueDate, defaultValue: true);
				bool companyOption = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.ShowAging1, defaultValue: true);
				bool companyOption2 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.ShowAging2, defaultValue: true);
				bool companyOption3 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.ShowAging3, defaultValue: true);
				bool companyOption4 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.ShowAging4, defaultValue: true);
				bool companyOption5 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.ShowAging5, defaultValue: true);
				bool companyOption6 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.ShowAging6, defaultValue: true);
				CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingFrom0, 0);
				CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingFrom1, 1);
				CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingFrom2, 31);
				CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingFrom3, 61);
				CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingFrom4, 91);
				CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingFrom5, 121);
				CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingFrom6, 151);
				CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingFrom7, 181);
				int companyOption7 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingTo0, 0);
				int companyOption8 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingTo1, 30);
				int companyOption9 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingTo2, 60);
				int companyOption10 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingTo3, 90);
				int companyOption11 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingTo4, 120);
				int companyOption12 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingTo5, 150);
				int companyOption13 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingTo6, 180);
				CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingTo7, 999);
				string companyOption14 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingName0, "Current");
				string companyOption15 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingName1, "1 - 30 Days");
				string companyOption16 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingName2, "31 - 60 Days");
				string companyOption17 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingName3, "61 - 90 Days");
				string companyOption18 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingName4, "91 - 120 Days");
				string companyOption19 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingName5, "121 - 150 Days");
				string companyOption20 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingName6, "151 - 180 Days");
				string companyOption21 = CompanyOptions.GetCompanyOption(CompanyOptionsEnum.AgingName7, "Over 180 Days");
				int num = 0;
				num = (companyOption6 ? companyOption13 : (companyOption5 ? companyOption12 : (companyOption4 ? companyOption11 : (companyOption3 ? companyOption10 : (companyOption2 ? companyOption9 : ((!companyOption) ? companyOption7 : companyOption8))))));
				companyOption21 = "Over " + num + " Days";
				dataGridList.DisplayLayout.Bands[0].Columns["VendorID"].Header.Caption = "Vendor Code";
				dataGridList.DisplayLayout.Bands[0].Columns["VendorName"].Header.Caption = "Vendor Name";
				dataGridList.DisplayLayout.Bands[0].Columns["TotalDue"].Header.Caption = "Total Due";
				dataGridList.DisplayLayout.Bands[0].Columns["CurrentBalance"].Header.Caption = companyOption14;
				if (dataGridList.DisplayLayout.Bands[0].Columns.Exists("Month1"))
				{
					dataGridList.DisplayLayout.Bands[0].Columns["Month1"].Header.Caption = companyOption15;
				}
				if (dataGridList.DisplayLayout.Bands[0].Columns.Exists("Month2"))
				{
					dataGridList.DisplayLayout.Bands[0].Columns["Month2"].Header.Caption = companyOption16;
				}
				if (dataGridList.DisplayLayout.Bands[0].Columns.Exists("Month3"))
				{
					dataGridList.DisplayLayout.Bands[0].Columns["Month3"].Header.Caption = companyOption17;
				}
				if (dataGridList.DisplayLayout.Bands[0].Columns.Exists("Month4"))
				{
					dataGridList.DisplayLayout.Bands[0].Columns["Month4"].Header.Caption = companyOption18;
				}
				if (dataGridList.DisplayLayout.Bands[0].Columns.Exists("Month5"))
				{
					dataGridList.DisplayLayout.Bands[0].Columns["Month5"].Header.Caption = companyOption19;
				}
				if (dataGridList.DisplayLayout.Bands[0].Columns.Exists("Month6"))
				{
					dataGridList.DisplayLayout.Bands[0].Columns["Month6"].Header.Caption = companyOption20;
				}
				dataGridList.DisplayLayout.Bands[0].Columns["Over"].Header.Caption = companyOption21;
				dataGridList.DisplayLayout.Bands[0].Columns["PaymentTermID"].Header.Caption = "Payment Term";
				dataGridList.DisplayLayout.Bands[0].Columns["NetOffPDC"].Header.Caption = "Net Balance";
				dataGridList.DisplayLayout.Bands[0].Columns["ContactName"].Header.Caption = "Contact Name";
				dataGridList.DisplayLayout.Bands[0].Columns["ContactTitle"].Header.Caption = "Contact Title";
				dataGridList.DisplayLayout.Bands[0].Columns["PostalCode"].Header.Caption = "Postal Code";
				dataGridList.DisplayLayout.Bands[0].Columns["F"].CellDisplayStyle = CellDisplayStyle.FullEditorDisplay;
				dataGridList.DisplayLayout.Bands[0].Columns["F"].Width = 18;
				dataGridList.DisplayLayout.Bands[0].Columns["F"].MaxWidth = 18;
				dataGridList.DisplayLayout.Bands[0].Columns["F"].MinWidth = 18;
				dataGridList.DisplayLayout.Bands[0].Columns["F"].LockedWidth = true;
				dataGridList.DisplayLayout.Bands[0].Columns["F"].AllowRowFiltering = DefaultableBoolean.False;
				dataGridList.SetInactiveColumn("F");
				ValueList valueList = new ValueList();
				valueList.ValueListItems.Add(null, "").Appearance.Image = null;
				valueList.ValueListItems.Add(1, CompanyOptions.GetCompanyOption(CompanyOptionsEnum.VenFlagGreen, "Green")).Appearance.Image = imageList1.Images[0];
				valueList.ValueListItems.Add(2, CompanyOptions.GetCompanyOption(CompanyOptionsEnum.VenFlagYellow, "Yellow")).Appearance.Image = imageList1.Images[1];
				valueList.ValueListItems.Add(3, CompanyOptions.GetCompanyOption(CompanyOptionsEnum.VenFlagBlue, "Blue")).Appearance.Image = imageList1.Images[2];
				valueList.ValueListItems.Add(4, CompanyOptions.GetCompanyOption(CompanyOptionsEnum.VenFlagPurple, "Purple")).Appearance.Image = imageList1.Images[3];
				valueList.ValueListItems.Add(5, CompanyOptions.GetCompanyOption(CompanyOptionsEnum.VenFlagOrange, "Orange")).Appearance.Image = imageList1.Images[4];
				valueList.ValueListItems.Add(6, CompanyOptions.GetCompanyOption(CompanyOptionsEnum.VenFlagRed, "Red")).Appearance.Image = imageList1.Images[5];
				valueList.ValueListItems.Add(20, "Important").Appearance.Image = imageList1.Images[6];
				valueList.ValueListItems.Add(100, "Completed").Appearance.Image = imageList1.Images[7];
				dataGridList.DisplayLayout.Bands[0].Columns["F"].ValueList = valueList;
				dataGridList.DisplayLayout.AutoFitStyle = AutoFitStyle.None;
				dataGridList.DisplayLayout.Bands[0].Override.FixedHeaderIndicator = FixedHeaderIndicator.Button;
				dataGridList.DisplayLayout.UseFixedHeaders = true;
				dataGridList.FormatAllNumericColumns(null);
				dataGridList.AddNumericColumnsSummary(null, SummaryType.Sum);
				dataGridList.DisplayLayout.Bands[0].Columns["F"].AllowRowFiltering = DefaultableBoolean.True;
				dataGridList.DisplayLayout.Bands[0].Columns["F"].FilterComparisonStyle = FilterComparisonStyle.ValueOrDisplayText;
				dataGridList.DisplayLayout.Bands[0].Columns["F"].FilterOperatorLocation = FilterOperatorLocation.Hidden;
				dataGridList.DisplayLayout.Bands[0].Columns["F"].FilterClearButtonVisible = DefaultableBoolean.False;
				dataGridList.DisplayLayout.Bands[0].Columns["F"].AllowRowSummaries = AllowRowSummaries.False;
				dataGridList.DisplayLayout.Bands[0].Columns["I"].CellDisplayStyle = CellDisplayStyle.FormattedText;
				dataGridList.DisplayLayout.Bands[0].Columns["I"].Width = 18;
				dataGridList.DisplayLayout.Bands[0].Columns["I"].MaxWidth = 18;
				dataGridList.DisplayLayout.Bands[0].Columns["I"].MinWidth = 18;
				dataGridList.DisplayLayout.Bands[0].Columns["I"].LockedWidth = true;
				dataGridList.DisplayLayout.Bands[0].Columns["I"].AllowRowFiltering = DefaultableBoolean.False;
				dataGridList.SetInactiveColumn("I");
				dataGridList.AddColumnRowCount(dataGridList.DisplayLayout.Bands[0].Columns["VendorID"]);
				if (!allowflagvendors)
				{
					flagsToolStripMenuItem.Visible = false;
				}
				else
				{
					flagsToolStripMenuItem.Visible = true;
				}
			}
			catch (Exception e)
			{
				dataGridList.LoadLayoutFailed = true;
				ErrorHelper.ProcessError(e);
			}
		}

		public void OnActivated()
		{
		}

		private void SetSecurity()
		{
			screenRight = Security.GetScreenAccessRight(base.Name);
			if (!screenRight.View)
			{
				ErrorHelper.ErrorMessage(UIMessages.NoPermissionView);
				Close();
			}
			else if (!Security.IsAllowedSecurityRole(GeneralSecurityRoles.Allowflagvendors))
			{
				allowflagvendors = false;
			}
			else
			{
				allowflagvendors = true;
			}
		}

		private string GetSelectedID()
		{
			if (dataGridList.ActiveRow == null)
			{
				return "";
			}
			if (dataGridList.ActiveRow.GetType() != typeof(UltraGridRow))
			{
				return "";
			}
			return dataGridList.ActiveRow.Cells["VendorID"].Text.ToString();
		}

		private UltraGridRow GetSelectedItem()
		{
			if (dataGridList.ActiveRow != null)
			{
				return dataGridList.ActiveRow;
			}
			return null;
		}

		private void buttonDelete_Click(object sender, EventArgs e)
		{
			Delete();
		}

		private void Delete()
		{
			if (!isReadOnly)
			{
				string selectedID = GetSelectedID();
				if (selectedID != "")
				{
					try
					{
						if (ErrorHelper.QuestionMessageYesNo("Are you sure you want to delete this record?") == DialogResult.Yes)
						{
							PublicFunctions.StartWaiting(this);
							if (Factory.VendorSystem.DeleteVendor(selectedID))
							{
								try
								{
									GetSelectedItem().Delete(displayPrompt: false);
								}
								catch
								{
								}
							}
						}
					}
					catch (SqlException ex)
					{
						if (ex.Number == 547)
						{
							ErrorHelper.ErrorMessage("Cannot delete this item because it is in use or referenced by other records.");
						}
						else
						{
							ErrorHelper.ProcessError(ex);
						}
					}
					catch (Exception e)
					{
						ErrorHelper.ProcessError(e);
					}
					finally
					{
						PublicFunctions.EndWaiting(this);
					}
				}
			}
		}

		public void RefreshData()
		{
		}

		private string GetDocumentTitle()
		{
			return "Vendor List";
		}

		private void Print()
		{
			try
			{
				PrintHelper.PreviewDocument(ultraGridPrintDocument1, Text);
			}
			catch (Exception e)
			{
				ErrorHelper.ProcessError(e);
			}
		}

		public bool SaveReport(ExternalReportTypes reportType)
		{
			return true;
		}

		public void ClearView()
		{
		}

		private void toolStripButtonRefresh_Click(object sender, EventArgs e)
		{
			LoadData();
		}

		private void toolStripButtonPrint_Click(object sender, EventArgs e)
		{
			Print();
		}

		private void microsoftExcelToolStripMenuItem_Click(object sender, EventArgs e)
		{
			new DataExportHelper().ExportToExcel(dataGridList);
		}

		private void toolStripButtonAllowGrouping_Click(object sender, EventArgs e)
		{
			dataGridList.DisplayLayout.GroupByBox.Hidden = !toolStripButtonAllowGrouping.Checked;
		}

		private void toolStripButtonColumnChooser_Click(object sender, EventArgs e)
		{
			dataGridList.ShowColumnChooser();
		}

		private void toolStripButtonAutoFit_Click(object sender, EventArgs e)
		{
			dataGridList.AutoFitColumns();
		}

		private void toolStripButtonShowInactive_Click(object sender, EventArgs e)
		{
			LoadData();
		}

		private void toolStripButtonAutoAllocate_Click(object sender, EventArgs e)
		{
			AutoAllocate();
		}

		private void AutoAllocate()
		{
			foreach (UltraGridRow row in dataGridList.Rows)
			{
				decimal result = default(decimal);
				decimal result2 = default(decimal);
				decimal result3 = default(decimal);
				decimal result4 = default(decimal);
				decimal result5 = default(decimal);
				decimal result6 = default(decimal);
				decimal result7 = default(decimal);
				decimal result8 = default(decimal);
				decimal result9 = default(decimal);
				decimal.TryParse(row.Cells["Unallocated"].Value.ToString(), out result);
				if (!(result == 0m))
				{
					decimal.TryParse(row.Cells["Over"].Value.ToString(), out result2);
					if (result > 0m && result2 > 0m)
					{
						if (result2 > result)
						{
							result2 -= result;
							result = default(decimal);
						}
						else
						{
							result -= result2;
							result2 = default(decimal);
						}
						row.Cells["Over"].Value = result2;
					}
					if (dataGridList.DisplayLayout.Bands[0].Columns.Exists("Month6"))
					{
						decimal.TryParse(row.Cells["Month6"].Value.ToString(), out result3);
						if (result > 0m && result3 > 0m)
						{
							if (result3 > result)
							{
								result3 -= result;
								result = default(decimal);
							}
							else
							{
								result -= result3;
								result3 = default(decimal);
							}
						}
						row.Cells["Month6"].Value = result3;
					}
					if (dataGridList.DisplayLayout.Bands[0].Columns.Exists("Month5"))
					{
						decimal.TryParse(row.Cells["Month5"].Value.ToString(), out result4);
						if (result > 0m && result4 > 0m)
						{
							if (result4 > result)
							{
								result4 -= result;
								result = default(decimal);
							}
							else
							{
								result -= result4;
								result4 = default(decimal);
							}
						}
						row.Cells["Month5"].Value = result4;
					}
					if (dataGridList.DisplayLayout.Bands[0].Columns.Exists("Month4"))
					{
						decimal.TryParse(row.Cells["Month4"].Value.ToString(), out result5);
						if (result > 0m && result5 > 0m)
						{
							if (result5 > result)
							{
								result5 -= result;
								result = default(decimal);
							}
							else
							{
								result -= result5;
								result5 = default(decimal);
							}
						}
						row.Cells["Month4"].Value = result5;
					}
					if (dataGridList.DisplayLayout.Bands[0].Columns.Exists("Month3"))
					{
						decimal.TryParse(row.Cells["Month3"].Value.ToString(), out result6);
						if (result > 0m && result6 > 0m)
						{
							if (result6 > result)
							{
								result6 -= result;
								result = default(decimal);
							}
							else
							{
								result -= result6;
								result6 = default(decimal);
							}
						}
						row.Cells["Month3"].Value = result6;
					}
					if (dataGridList.DisplayLayout.Bands[0].Columns.Exists("Month2"))
					{
						decimal.TryParse(row.Cells["Month2"].Value.ToString(), out result7);
						if (result > 0m && result7 > 0m)
						{
							if (result7 > result)
							{
								result7 -= result;
								result = default(decimal);
							}
							else
							{
								result -= result7;
								result7 = default(decimal);
							}
						}
						row.Cells["Month2"].Value = result7;
					}
					if (dataGridList.DisplayLayout.Bands[0].Columns.Exists("Month1"))
					{
						decimal.TryParse(row.Cells["Month1"].Value.ToString(), out result8);
						if (result > 0m && result8 > 0m)
						{
							if (result8 > result)
							{
								result8 -= result;
								result = default(decimal);
							}
							else
							{
								result -= result8;
								result8 = default(decimal);
							}
						}
						row.Cells["Month1"].Value = result8;
					}
					decimal.TryParse(row.Cells["CurrentBalance"].Value.ToString(), out result9);
					if (result > 0m && result9 > 0m)
					{
						if (result9 > result)
						{
							result9 -= result;
							result = default(decimal);
						}
						else
						{
							result -= result9;
							result9 = default(decimal);
						}
						row.Cells["CurrentBalance"].Value = result9;
					}
					row.Cells["Unallocated"].Value = result;
				}
			}
		}

		private void toolStripItemFlag_Click(object sender, EventArgs e)
		{
			try
			{
				byte b = byte.Parse(((ToolStripMenuItem)sender).Tag.ToString());
				string selectedID = GetSelectedID();
				if (Factory.VendorSystem.SetFlag(selectedID, b))
				{
					if (b > 0)
					{
						GetSelectedItem().Cells["F"].Value = b;
					}
					else
					{
						GetSelectedItem().Cells["F"].Value = DBNull.Value;
					}
				}
			}
			catch (Exception e2)
			{
				ErrorHelper.ProcessError(e2);
			}
		}

		private void contextMenuStripList_Opening(object sender, CancelEventArgs e)
		{
			UltraGridRow selectedItem = GetSelectedItem();
			if (selectedItem != null)
			{
				byte b = 0;
				if (selectedItem.Cells["F"].Value != null && selectedItem.Cells["F"].Value.ToString() != "")
				{
					b = byte.Parse(selectedItem.Cells["F"].Value.ToString());
				}
				foreach (object dropDownItem in flagsToolStripMenuItem.DropDownItems)
				{
					if (!(dropDownItem.GetType() == typeof(ToolStripSeparator)))
					{
						ToolStripMenuItem toolStripMenuItem = dropDownItem as ToolStripMenuItem;
						if (b == 0)
						{
							toolStripMenuItem.Checked = false;
						}
						else if (toolStripMenuItem.Tag.ToString() == b.ToString())
						{
							toolStripMenuItem.Checked = true;
						}
						else
						{
							toolStripMenuItem.Checked = false;
						}
					}
				}
			}
		}

		private void toolStripButtonMerge_Click(object sender, EventArgs e)
		{
			if (toolStripButtonMerge.Checked)
			{
				dataGridList.DisplayLayout.Override.MergedCellStyle = MergedCellStyle.OnlyWhenSorted;
			}
			else
			{
				dataGridList.DisplayLayout.Override.MergedCellStyle = MergedCellStyle.Never;
			}
		}

		private void toolStripButtonFitText_Click(object sender, EventArgs e)
		{
			dataGridList.AutoSizeColumns();
		}

		private void toolStripButtonClearFilter_Click(object sender, EventArgs e)
		{
			if (dataGridList.DisplayLayout != null && dataGridList.DisplayLayout.Bands.Count > 0)
			{
				dataGridList.DisplayLayout.Bands[0].ColumnFilters.ClearAllFilters();
			}
		}
	}
}
