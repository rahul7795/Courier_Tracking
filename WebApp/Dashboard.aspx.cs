using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class Dashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) GetData();
        }

        public void GetData()
        {
            List<DAL.Cts_Package> Packages = BAL.AdminOperations.GetAllPackageDetails();
            if(Packages.Count>0)
            {
                if (Session["RoleID"].ToString() == "2" || Session["RoleID"].ToString() == "3")
                {                    
                    lblTotal.Text = Packages.Count.ToString();
                    lblAccepted.Text = Packages.Where(x => x.pk_isActive == true).Count().ToString();
                    lblRejected.Text = Packages.Where(x => x.pk_isActive == false).Count().ToString();
                    lblPending.Text = Packages.Where(x => x.pk_isActive == null).Count().ToString();
                }
                else if (Session["RoleID"].ToString() == "4")
                {
                    lblTotal.Text = Packages.Where(x => x.pk_Customer_id == int.Parse(Session["umId"].ToString())).Count().ToString();
                    lblAccepted.Text = Packages.Where(x => x.pk_isActive == true && x.pk_Customer_id == int.Parse(Session["umId"].ToString())).Count().ToString();
                    lblRejected.Text = Packages.Where(x => x.pk_isActive == false && x.pk_Customer_id == int.Parse(Session["umId"].ToString())).Count().ToString();
                    lblPending.Text = Packages.Where(x => x.pk_isActive == null && x.pk_Customer_id == int.Parse(Session["umId"].ToString())).Count().ToString();
                }                
            }
        }

        protected void pending_ServerClick(object sender, EventArgs e)
        {
            Session["ShipClick"] = "Pending";
            Response.Redirect("~/ApprovePackages.aspx");
        }

        protected void total_ServerClick(object sender, EventArgs e)
        {
            Session["ShipClick"] = "Total";
            Response.Redirect("~/ApprovePackages.aspx");
        }

        protected void accepted_ServerClick(object sender, EventArgs e)
        {
            Session["ShipClick"] = "Accepted";
            Response.Redirect("~/ApprovePackages.aspx");
        }

        protected void rejected_ServerClick(object sender, EventArgs e)
        {
            Session["ShipClick"] = "Rejected";
            Response.Redirect("~/ApprovePackages.aspx");
        }
    }
}
