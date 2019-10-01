using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Warehouses : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        public void LoadData()
        {
            gdvWarehouse.DataSource = BAL.AdminOperations.GetWarehouse();
            gdvWarehouse.DataBind();
        }

        protected void btnAddRow_Click(object sender, EventArgs e)
        {
            Cts_BranchMaster warehouse = new Cts_BranchMaster
            {
                bm_branchName = txtWname.Text,
                bm_IsActive = true
            };            
            BAL.AdminOperations.AddWarehouse(warehouse);
            LoadData();
        }
    }
}