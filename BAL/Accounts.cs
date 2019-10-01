using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;


namespace BAL
{
    public class Accounts
    {
        public static List<Cts_User_Master> ValidateUser(string userid, string password)
        {
            return DAL.UserAccounts.ValidateUser(userid, password);
        }

        public static List<Cts_User_Master> UserProfile(int userid)
        {
            return DAL.UserAccounts.UserProfile(userid);
        }

        public static bool RegisterUser(Cts_User_Master userDetails)
        {
            if (userDetails.um_userId.Length > 0 && userDetails.um_firstName.Length > 0 && userDetails.um_lastName.Length > 0 && userDetails.um_gender.Length > 0 && userDetails.um_contact.Length>0 && userDetails.um_emailId.Length>0 )
            {
                return DAL.UserAccounts.RegisterUser(userDetails);
            }
            else
            {
                return false;
            }            
        }
        public static bool UpdateProfile(int umId, Cts_User_Master update)
        {
            return DAL.UserAccounts.UpdateProfile(umId, update);
        }
    }
}
