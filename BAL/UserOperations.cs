using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BAL
{
   public class UserOperations
    {
        public static bool AddPackage(Cts_Package _package)
        {
            return DAL.UserFunctions.AddPackage(_package);
        }

        public static List<Cts_Package> GetPackageId()
        {
            return DAL.UserFunctions.GetPackageId();
        }

        public static List<Cts_Package> GetPackage(int cid)
        {
            return DAL.UserFunctions.GetPackage(cid);
        }

        public static List<Cts_Package> UserPackageUpdateStatus()
        {
            return DAL.AdminOperations.UserPackageUpdateStatus();
        }

        public static List<Cts_Package> PackageStatus()
        {
            return DAL.AdminOperations.PackageStatus();
        }

        public static List<Cts_Package> UserPackageStatus()
        {
            return DAL.AdminOperations.UserPackageStatus();
        }

        public static bool ApprovePackage(int pk_id, bool status, int role, string empId, int cost, string location)
        {
            return DAL.UserFunctions.ApprovePackage(pk_id, status, role, empId, cost, location);
        }

        public static bool ApproveStatusPackage(int cid, string location, string status, int cost, bool active)
        {
            return DAL.UserFunctions.ApproveStatusPackage(cid, location, status, cost, active);
        }

        public static bool UpdateStatusPackage(int cid, string location, string status, bool active)
        {
            return DAL.UserFunctions.UpdateStatusPackage(cid, location, status, active);
        }
    }
}
