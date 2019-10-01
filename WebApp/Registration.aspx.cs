using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Cts_User_Master userDetails = new Cts_User_Master
            {
                um_firstName = txtUserFirstName.Text,
                um_lastName = txtUserLastName.Text,
                um_emailId =txtUserEmail.Text,
                um_gender = ddlGender.Text,
                um_contact = txtUserContactNumber.Text,
                um_userId = txtUserId.Text,
                um_password = txtUserPassword.Text,
                um_Designation = txtDesigation.Text,
                um_PerAddress = txtPerAddress.Text,
                um_CorAddress = txtCorAddress.Text,
                um_created_On = DateTime.Now.Date,
                um_created_by = txtUserFirstName.Text + " " + txtUserLastName.Text,
                um_RoleId = int.Parse(ddlRole.SelectedValue)
            };
            if (BAL.Accounts.RegisterUser(userDetails))
            {
                string _msg = string.Format("SuccessFunction('{0}')", "Your Account is Registered Successfully !");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
                txtUserFirstName.Text = txtUserLastName.Text = txtUserEmail.Text = txtUserContactNumber.Text = txtUserId.Text = txtDesigation.Text = txtPerAddress.Text = txtCorAddress.Text = "";
            }
            else
            {
                string _msg = string.Format("ErrFunction('{0}')", "Not Registered!");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
                txtUserFirstName.Text = txtUserLastName.Text = txtUserEmail.Text = txtUserContactNumber.Text = txtUserId.Text = txtDesigation.Text = txtPerAddress.Text = txtCorAddress.Text = "";
            }
        }
    }
}