﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Data;
using BankProject.DataProvider;
namespace BankProject.Views.TellerApplication
{
    public partial class ChequeWithrawalDrawOnUs_PL : DotNetNuke.Entities.Modules.PortalModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
        }
        protected void RadGridPreview_OnNeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            RadGridPreview.DataSource = TriTT.CHEQUE_WITHDRAWAL_LoadPreviewList();
        }
        public string getUrlPreview(string id)
        {
            return "Default.aspx?tabid=" + this.TabId.ToString() + "&ID=" + id + "&IsAuthorize=1";
        }
    }
}