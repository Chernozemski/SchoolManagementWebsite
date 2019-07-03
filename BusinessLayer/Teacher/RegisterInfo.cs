using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace BusinessLayer.Teacher
{
    public class RegisterInfo
    {
        public object[] Register(string firstName,string middleName, string familyName,
            string subjectId, string EGN, string phoneNumber, string adress,
            string positionId,System.Web.UI.WebControls.FileUpload fileUploadPhoto)
        {
            DataAccessLayer.Teacher.RegisterInfo teacher = new DataAccessLayer.Teacher.RegisterInfo();
            byte[] image = SharedMethods.getImage(fileUploadPhoto);
            int result;
            //Check if image is uploaded else send null
            if (image.Length == 0)
            {
                result = teacher.register(firstName, middleName, familyName, subjectId, EGN, phoneNumber, adress, positionId, null);
            }
            else
            {
                result = teacher.register(firstName, middleName, familyName, subjectId, EGN, phoneNumber, adress, positionId, image);
            }

            return Message(result);
        }
        private object[] Message(int result)
        {
            switch (result)
            {
                case 1:
                    return new object[] { "Успешно регистриране.", System.Drawing.Color.Green };
                case -1:
                    return new object[] { "Учителят вече е регистриран.", System.Drawing.Color.DarkRed };
                case 0:
                    return new object[] { "Длъжността директор е заета.", System.Drawing.Color.DarkRed };
                default:
                    return new object[] { "Възникна проблем, който не е разпознат.", System.Drawing.Color.DarkRed };
            }
        }
    }
}
