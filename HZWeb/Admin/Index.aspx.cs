﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PMSWeb.Admin
{
    public partial class Index : System.Web.UI.Page
    {
        public string SysWeb;
        protected void Page_Load(object sender, EventArgs e)
        {
             SysWeb = System.Configuration.ConfigurationManager.AppSettings["SystemWeb"];
        }
    }
}