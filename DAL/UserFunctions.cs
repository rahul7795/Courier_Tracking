using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class UserFunctions
    {
        public static bool AddPackage(Cts_Package _package)
        {
            try
            {
                using (DBContextDataContext db = new DBContextDataContext())
                {
                    db.Cts_Packages.InsertOnSubmit(_package);
                    db.SubmitChanges();
                    if (_package.pk_consignment_id > 0)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            catch(Exception Ex)
            {
                return false;
            }
        }

        public static List<Cts_Package> GetPackage(int cid)
        {
            try
            {
                using (DBContextDataContext db = new DBContextDataContext())
                {
                    return db.Cts_Packages.Where(x => x.pk_consignment_id == cid).ToList();
                }
            }
            catch (Exception ex)
            {
                return new List<Cts_Package>();
            }
        }

        public static List<Cts_Package> GetPackageId()
        {
            try
            {
                using (DBContextDataContext db = new DBContextDataContext())
                {
                    return db.Cts_Packages.Where(x => x.pk_isActive == null).ToList();
                }
            }
            catch (Exception ex)
            {
                return new List<Cts_Package>();
            }
        }

        public static bool ApprovePackage(int pk_id, bool status, int role, string empId, int cost, string location)
        {
            using (DBContextDataContext db = new DBContextDataContext())
            {
                try
                {
                    var user = db.Cts_Packages.Where(x => x.pk_consignment_id == pk_id).FirstOrDefault();
                    user.pk_isActive = status;
                    user.pk_Employee_id = empId;
                    user.pk_Accept_Date = DateTime.Now.Date;
                    user.pk_cost = cost;
                    user.pk_Current_location = location;
                    db.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public static bool ApproveStatusPackage(int cid, string location, string status)
        {
            using (DBContextDataContext db = new DBContextDataContext())
            {
                try
                {
                    var package = db.Cts_Packages.Where(x => x.pk_consignment_id == cid).FirstOrDefault();
                    package.pk_isActive = true;
                    package.pk_Current_location = location;
                    package.pk_Package_Status = status;
                    db.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

    }
}
