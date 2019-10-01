using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class AdminOperations
    {
        public static List<Cts_User_Master> GetPendingList(int roleId)
        {
            using (DBContextDataContext db =new DBContextDataContext())
            {
                if (roleId == 1)
                {
                    return db.Cts_User_Masters.Where(x => x.um_isActive == null && x.um_RoleId == 2).ToList();
                }
                else if (roleId == 2)
                {
                    return db.Cts_User_Masters.Where(x => x.um_isActive == null && x.um_RoleId != 2).ToList();
                }
                else
                {
                    return db.Cts_User_Masters.Where(x => x.um_isActive == null && x.um_RoleId == 4).ToList();
                }
               
            }
        }

        public static bool ApproveUsers(int um_id, bool status, string empId, string name, long salary)
        {
            using (DBContextDataContext db = new DBContextDataContext())
            {
                try
                {
                    var user = db.Cts_User_Masters.Where(x => x.um_id == um_id).FirstOrDefault();
                    user.um_isActive = status;
                    user.um_IsApprovedOn = DateTime.Now.Date;
                    user.um_IsApprovedBy = name;
                    user.um_Salary = salary;
                    db.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public static List<Cts_Package> UserPackageStatus()
        {
            using (DBContextDataContext db = new DBContextDataContext())
            {
                return db.Cts_Packages.Where(x => x.pk_isActive == null).ToList();
            }
        }

        public static List<Cts_Package> PackageStatus()
        {
            using (DBContextDataContext db = new DBContextDataContext())
            {
                return db.Cts_Packages.Where(x => x.pk_Package_Status != "Delivered").ToList();
            }
        }

        public static List<Cts_BranchMaster> GetWarehouse()
        {
            using (DBContextDataContext db = new DBContextDataContext())
            {
                return db.Cts_BranchMasters.Where(x => x.bm_branchName != null).ToList();
            }
        }

        public static bool AddWarehouse(Cts_BranchMaster warehouse)
        {
            using (DBContextDataContext db = new DBContextDataContext())
            {
                try
                {
                    db.Cts_BranchMasters.InsertOnSubmit(warehouse);
                    db.SubmitChanges();
                    if (warehouse.bm_branchCode > 0) return true;
                    else return false;
                }
                catch
                {
                    return false;
                }
            }
        }

        public static List<Cts_Package> GetAllPackageDetails()
        {
            using (DBContextDataContext db=new DBContextDataContext())
            {
                return db.Cts_Packages.ToList();
            }
        }
        
    }
}
