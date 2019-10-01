using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class UpdateStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) LoadData();
        }

        public void LoadData()
        {
            try
            {
                List<Cts_Package> package = BAL.UserOperations.UserPackageUpdateStatus();
                gdvApprovalData.DataSource = package;
                gdvApprovalData.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void gdvApprovalData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                GridViewRow row = gdvApprovalData.Rows[int.Parse(e.CommandArgument.ToString())];
                int cid = int.Parse((row.FindControl("lblcnsngId") as Label).Text);
                string location = (row.FindControl("ddlLocation") as DropDownList).Text;
                string status = (row.FindControl("ddlStatus") as DropDownList).Text;
                if (status == "Pending")
                {
                    string _msg = string.Format("ErrFunction('{0}')", "Update the status");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
                }
                else
                {
                    if (e.CommandName == "change")
                    {
                        if (BAL.UserOperations.UpdateStatusPackage(cid, location, status, true))
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
                    else if (e.CommandName == "reject")
                    {
                        if (BAL.UserOperations.UpdateStatusPackage(cid, location, status, false))
                        {
                            string _msg = string.Format("ErrFunction('{0}')", "Package Rejected");
                            Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
                        }
                    }
                    LoadData();
                }
            }
            catch (Exception ex) { }
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