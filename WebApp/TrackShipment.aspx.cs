using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class TrackShipment : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Session["TrackStatus"] = "";
                GetData();
            }
        }
        public void GetData()
        {
            try
            {
                List<DAL.Cts_Package> Packages = BAL.AdminOperations.GetAllPackageDetails();
                if (Packages.Count > 0)
                {
                    if (Session["RoleID"].ToString() == "4")
                    {
                        gdvData.DataSource = Packages.Where(x=>x.pk_Customer_id==int.Parse(Session["umId"].ToString()));
                        gdvData.DataBind();
                    }
                    else
                    {
                        gdvData.DataSource = Packages;
                        gdvData.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void gdvData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "track")
            {
                GridViewRow row = gdvData.Rows[int.Parse(e.CommandArgument.ToString())];
                string status = (row.FindControl("txtstatus") as Label).Text;
                Session["TrackStatus"] = status;
            }
        }
    }
}