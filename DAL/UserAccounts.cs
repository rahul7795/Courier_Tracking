using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
   public class UserAccounts
    {
        public static List<Cts_User_Master> ValidateUser(string userid,string password)
        {
            using (DBContextDataContext db= new DBContextDataContext())
            {
                return db.Cts_User_Masters.Where(x => x.um_userId == userid && x.um_password == password).ToList();
            }
        }

        public static List<Cts_User_Master> UserProfile(int userid)
        {
            using (DBContextDataContext db = new DBContextDataContext())
            {
                return db.Cts_User_Masters.Where(x => x.um_id == userid).ToList();
            }
        }

        public static bool UpdateProfile(int umId,Cts_User_Master update)
        {
            try
            {
                if (umId > 0)
                {
                    using (DBContextDataContext db = new DBContextDataContext())
                    {                        
                        List<Cts_User_Master> profile = db.Cts_User_Masters.Where(x => x.um_id == umId).ToList();
                        foreach (Cts_User_Master row in profile)
                        {
                            row.um_firstName = update.um_firstName;
                            row.um_lastName = update.um_lastName;
                            row.um_contact = update.um_contact;
                            row.um_PerAddress = update.um_PerAddress;
                            row.um_CorAddress = update.um_CorAddress;
                            row.um_emailId = update.um_emailId;
                        }
                        db.SubmitChanges();
                        return true;
                    }
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            { return false; }
        }

        public static bool RegisterUser (Cts_User_Master userDetails)
        {
            using (DBContextDataContext db = new DBContextDataContext())
            {
                try
                {
                    var check = db.Cts_User_Masters.Where(x => x.um_userId == userDetails.um_userId).ToList();
                    if (check.Count == 0)
                        {
                            db.Cts_User_Masters.InsertOnSubmit(userDetails);
                            db.SubmitChanges();
                            if (userDetails.um_id > 0)
                            {
                                return true;
                            }
                            else
                            {
                                return false;
                            }
                        }
                    else
                    {
                        return false;
                    }
                    
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }
    }
}
