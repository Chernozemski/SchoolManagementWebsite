using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing; 

namespace BusinessLayer.Author
{
    public class Register
    {
        public object[] register(string publisherName)
        {
            DataAccessLayer.Author.Register author = new DataAccessLayer.Author.Register();
            int result = author.register(publisherName);

            return Message(result);
        }
        private object[] Message(int result)
        {
            switch (result)
            {
                case 0 :
                    return new object[] { "Този издател вече е регистриран.", Color.DarkRed };
                case 1 :
                    return new object[] { "Успешно вписване в базата данни.", Color.Green };
                default :
                    return new object[] { "Възникна проблем, който не е разпознат от системата.", Color.DarkRed };
            }
        }
    }
}
