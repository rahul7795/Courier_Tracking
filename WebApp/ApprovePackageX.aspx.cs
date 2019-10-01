using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class ApprovePackageX : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) LoadData();
        }

        public void LoadData()
        {
            try
            {
                List<Cts_Package> package = BAL.UserOperations.UserPackageStatus();
                gdvApprovalData.DataSource = package;
                gdvApprovalData.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void gdvApprovalData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = gdvApprovalData.Rows[int.Parse(e.CommandArgument.ToString())];
            int cid = int.Parse((row.FindControl("lblcnsngId") as Label).Text);
            string location = (row.FindControl("ddlLocation") as DropDownList).Text;
            string status = (row.FindControl("ddlStatus") as DropDownList).Text;
            if (e.CommandName == "approve")
            {
                if (BAL.UserOperations.ApproveStatusPackage(cid, location, status))
                {
                    string _msg = string.Format("SuccessFunction('{0}')", "Package Approved Successfully");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
                }
                else
                {
                    string _msg = string.Format("SuccessFunction('{0}')", "Package Rejected");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
                }
            }
            else
            {
                string _msg = string.Format("ErrFunction('{0}')", "Package Rejected");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
            }
            LoadData();
        }

        protected void gdvApprovalData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl = (e.Row.FindControl("ddlLocation") as DropDownList);
                List<Cts_BranchMaster> warehouses = BAL.AdminOperations.GetWarehouse();
                ddl.DataSource = warehouses;
                ddl.DataTextField = "bm_branchName";
                ddl.DataValueField = "bm_branchName";
                ddl.DataBind();
                ddl.Items.Insert(0, new ListItem("--Select Location--", "0"));
            }
        }
    }
}