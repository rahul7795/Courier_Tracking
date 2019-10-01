using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Session.Clear();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            List<Cts_User_Master> user = BAL.Accounts.ValidateUser(txtUsername.Text, txtPassowrd.Text);
            if(user.Count>0)
            {
                if (user[0].um_isActive != true)
                {
                    string _msg = string.Format("ErrFunction('{0}')", "Your Account is Pending For Admin Approval !");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
                }
                else
                {
                    Session["UserId"] = user[0].um_userId;
                    Session["Name"] = user[0].um_firstName + " " + user[0].um_lastName;
                    Session["RoleID"] = user[0].um_RoleId.ToString();
                    Session["Email"] = user[0].um_emailId;
                    Session["Status"] = user[0].um_isActive;
                    Session["EmpId"] = user[0].um_emp_cid;
                    Session["umId"] = user[0].um_id;
                    Response.Redirect("Dashboard.aspx");
                }
            }
            else
            {
                string _msg = string.Format("ErrFunction('{0}')", "Incorrect UserId/Password");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
            }
        }
    }
}