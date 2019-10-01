using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class ApproveUsers : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) LoadData();
        }
        public void LoadData()
        {
            List<Cts_User_Master> user = BAL.AdminOperations.GetPendingList(int.Parse(Session["RoleID"].ToString()));
            gdvApprovalData.DataSource = user;
            gdvApprovalData.DataBind();
        }

        protected void gdvApprovalData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GridViewRow row = gdvApprovalData.Rows[int.Parse(e.CommandArgument.ToString())];
            int um_Id = int.Parse((row.FindControl("lblId") as Label).Text);
            long salary = long.Parse((row.FindControl("txtSalary") as TextBox).Text);
            string empId = Session["EmpId"].ToString();
            string name = Session["Name"].ToString();

            if (e.CommandName == "approve")
            {
               if (BAL.AdminOperations.ApprovalUsers(um_Id, true, empId, name, salary))
                {
                    string _msg = string.Format("SuccessFunction('{0}')", "User Approved Successfully");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);

                }
                else
                {
                    string _msg = string.Format("ErrFunction('{0}')", "User Rejected");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);

                }
            }
            else if(e.CommandName == "reject")
            {
                if (BAL.AdminOperations.ApprovalUsers(um_Id, false, empId, name, salary))
                {
                    string _msg = string.Format("ErrFunction('{0}')", "User Rejected");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
                }
                else
                {
                    string _msg = string.Format("SuccessFunction('{0}')", "User Approved Successfully");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
                }                
            }
            LoadData();
        }
    }
}