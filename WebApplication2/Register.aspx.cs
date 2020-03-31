using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegInfo.Visible = false;
        }

        protected void register_Click(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();

            if (Page.IsValid)
            {
                RegInfo.Visible = false;

                users myUser = new users();
                myUser.username = RegLoginBox.Text;
                myUser.password = RegPassBox.Text;
                myUser.email = RegEmailBox.Text;
                myUser.isAdmin = 0; // Simple user
                if (myUser.password == RegRepeatPassBox.Text)
                {
                    RegInfo.Text = "Пользователь " + myUser.username + " успешно создан!"; 
                    db.users.InsertOnSubmit(myUser);
                    db.SubmitChanges();
                } else
                {
                    RegInfo.Text = "Ошибка. Пароли не совпадают!";
                }
                RegInfo.Visible = true;
            }
        }
    }
}