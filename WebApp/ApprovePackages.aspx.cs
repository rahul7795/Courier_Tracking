using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp
{
    public partial class ApprovePackages : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) GetData();
        }

        public void GetData()
        {
            List<DAL.Cts_Package> Packages = BAL.AdminOperations.GetAllPackageDetails();
            if (Packages.Count > 0)
            {
                if (Session["RoleID"].ToString() == "2" || Session["RoleID"].ToString() == "3")
                {
                    if (Session["ShipClick"].ToString() == "Total")
                    {
                        gdvApprovalData.DataSource = Packages;
                        gdvApprovalData.DataBind();
                    }
                    else if (Session["ShipClick"].ToString() == "Pending")
                    {
                        gdvApprovalData.DataSource = Packages.Where(x => x.pk_isActive == null);
                        gdvApprovalData.DataBind();
                    }
                    else if (Session["ShipClick"].ToString() == "Accepted")
                    {
                        gdvApprovalData.DataSource = Packages.Where(x => x.pk_isActive == true);
                        gdvApprovalData.DataBind();
                    }
                    else if (Session["ShipClick"].ToString() == "Rejected")
                    {
                        gdvApprovalData.DataSource = Packages.Where(x => x.pk_isActive == false);
                        gdvApprovalData.DataBind();
                    }
                }
                else if (Session["RoleID"].ToString() == "4")
                {
                    if (Session["ShipClick"].ToString() == "Total")
                    {
                        gdvApprovalData.DataSource = Packages.Where(x => x.pk_Customer_id == int.Parse(Session["umId"].ToString()));
                        gdvApprovalData.DataBind();
                    }
                    else if (Session["ShipClick"].ToString() == "Pending")
                    {
                        gdvApprovalData.DataSource = Packages.Where(x => x.pk_isActive == null && x.pk_Customer_id == int.Parse(Session["umId"].ToString()));
                        gdvApprovalData.DataBind();
                    }
                    else if (Session["ShipClick"].ToString() == "Accepted")
                    {
                        gdvApprovalData.DataSource = Packages.Where(x => x.pk_isActive == true && x.pk_Customer_id == int.Parse(Session["umId"].ToString()));
                        gdvApprovalData.DataBind();
                    }
                    else if (Session["ShipClick"].ToString() == "Rejected")
                    {
                        gdvApprovalData.DataSource = Packages.Where(x => x.pk_isActive == false && x.pk_Customer_id == int.Parse(Session["umId"].ToString()));
                        gdvApprovalData.DataBind();
                    }
                }
            }            
        }
    }
}