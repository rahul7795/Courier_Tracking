using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace WebApp
{
    public partial class AddPackage : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                Cts_Package _package = new Cts_Package
                {
                    pk_Accept_Date = DateTime.Now.Date,
                    pk_Package_weight = double.Parse(txtPackageWeight.Text),
                    pk_Sender_address = txtSenderAddress.Text + ", " + ddlSendCity.Text,
                    pk_Receiver_address = txtReceiverAddress.Text + ", " + ddlReceiveCity.Text,
                    pk_package_type = ddlPackageType.SelectedItem.Text,
                    pk_Customer_id = int.Parse(Session["umId"].ToString()),
                    pk_Current_location = "Not Updated",
                    pk_Package_Status = "Pending",
                    pk_Add_Date = DateTime.Now.Date
                };
                if (BAL.UserOperations.AddPackage(_package))
                {
                    string _msg = string.Format("SuccessFunction('{0}')", "Package Added Successfully");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
                    txtSenderAddress.Text = txtReceiverAddress.Text = "";
                }
                else
                {
                    string _msg = string.Format("ErrFunction('{0}')", "Package Cannot Be Added ");
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", _msg, true);
                    txtSenderAddress.Text = txtReceiverAddress.Text = "";
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void ddlPackageType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPackageType.SelectedItem.Value == "1") lblDetail.Text = "Standard courier services involve collecting the parcels, sorting the parcels, and transferring the parcels to the closest depot to the delivery location. The parcel is then loaded on a van and delivered to the desired destination. This service takes a few days, and it is generally the cheapest of all courier services.";
            else if (ddlPackageType.SelectedItem.Value == "2") lblDetail.Text = "Overnight service is the same as standard service, but slightly more expensive, and the parcel is guaranteed to be delivered by the next day.";
            else if (ddlPackageType.SelectedItem.Value == "3") lblDetail.Text = "Same-day express courier is the most expensive of all courier services and used for deliveries that are of an urgent nature.";
            else if (ddlPackageType.SelectedItem.Value == "4") lblDetail.Text = "International courier service is used for transfer of goods overseas. The price varies greatly depending on the size of the package and speed required.";
            else if (ddlPackageType.SelectedItem.Value == "5") lblDetail.Text = "Pallet courier services are used for delivering goods on pallets. This service offers strict delivery schedules at affordable rates.";
            else lblDetail.Text = "";
        }
    }
}