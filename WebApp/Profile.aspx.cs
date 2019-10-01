using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Profile : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) LoadData(int.Parse(Session["umId"].ToString()));
        }

        public void LoadData(int userId)
        {
            List<Cts_User_Master> profile =  BAL.Accounts.UserProfile(userId);
            txtFname.Text = profile[0].um_firstName;
            txtLname.Text = profile[0].um_lastName;
            txtEmail.Text = profile[0].um_emailId;
            txtContact.Text = profile[0].um_contact;
            txtPerAddress.Text = profile[0].um_PerAddress;
            txtCorAddress.Text = profile[0].um_CorAddress;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Cts_User_Master update = new Cts_User_Master
            {
                um_firstName = txtFname.Text,
                um_lastName = txtLname.Text,
                um_contact = txtContact.Text,
                um_PerAddress = txtPerAddress.Text,
                um_CorAddress = txtCorAddress.Text,
                um_emailId = txtEmail.Text
            };
            int id = int.Parse(Session["umId"].ToString());
            if (BAL.Accounts.UpdateProfile(id, update))
            {
                string _msg = string.Format("SuccessFunction('{0}')", "Your Update is Successfully !");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);                
            }
            else
            {
                string _msg = string.Format("ErrFunction('{0}')", "Oops Something went Wrong");
                Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
            }
        }

        //protected void gdvProfile_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    gdvProfile.EditIndex = e.NewEditIndex;
        //    LoadData(int.Parse(Session["umId"].ToString()));
        //}

        //protected void gdvProfile_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        //{
        //    gdvProfile.EditIndex = -1;
        //    LoadData(int.Parse(Session["umId"].ToString()));
        //}

        //protected void gdvProfile_RowUpdating(object sender, GridViewUpdateEventArgs e)
        //{
        //    try { 
        //    GridViewRow row = gdvProfile.Rows[e.RowIndex];            
        //    Cts_User_Master update = new Cts_User_Master
        //    {
        //        um_firstName = (row.FindControl("txtFname") as TextBox).Text,
        //        um_lastName = (row.FindControl("txtLname") as TextBox).Text,
        //        um_password = (row.FindControl("txtPwd") as TextBox).Text,
        //        um_contact = (row.FindControl("txtContact") as TextBox).Text,
        //        um_PerAddress = (row.FindControl("txtPerAddress") as TextBox).Text,
        //        um_CorAddress = (row.FindControl("txtCorrAddress") as TextBox).Text,
        //        um_emailId = (row.FindControl("txtEmail") as TextBox).Text                
        //   };
        //    int id = int.Parse(Session["umId"].ToString());
        //    if (BAL.Accounts.UpdateProfile(id, update))
        //    {                
        //        string _msg = string.Format("SuccessFunction('{0}')", "Your Update is Successfully !");
        //        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
        //        Response.Redirect("~/Dashboard.aspx");
        //    }
        //    else
        //    {
        //        string _msg = string.Format("ErrFunction('{0}')", "Oops Something went Wrong");
        //        Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
        //    }
        //    }
        //    catch(Exception ex) { }
        //}
    }
}