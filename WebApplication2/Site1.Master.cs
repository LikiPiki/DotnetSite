using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            long iduser = Convert.ToInt64(Session["IDP"]);
            string myuser = Convert.ToString(Session["idU"]);
            if (iduser != 0)
            {
                loginBox.Visible = false;
                passBox.Visible = false;
                logoutBtn.Visible = true;
                loginBtn.Visible = false;
                registerBtn.Visible = false;
                labelError.Visible = false;
                loginLabel.Visible = false;
                passLabel.Visible = false;
                Label1.Text = "Привет " + myuser + "!";
            } else
            {
                Label1.Visible = false;
                passBox.Visible = true;
                loginBox.Visible = true;
                logoutBtn.Visible = false;
                loginBtn.Visible = true;
                registerBtn.Visible = true;
                labelError.Visible = false;
            }
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            long iduser;
            int userRole = 0;
            string myuser;
            string pass, login;
            login = loginBox.Text;
            pass = passBox.Text;
            Label1.Visible = true;

            DataClasses1DataContext db = new DataClasses1DataContext();
            try
            {
                var selectedUser = (from item in db.users where item.username == login && item.password == pass select item).Single();
                myuser = selectedUser.username;
                iduser = selectedUser.id;
                // if 0 - default simple user
                //    1 - admin
                //    2 - Employee
                userRole = selectedUser.isAdmin; 

                loginBox.Visible = false;
                passBox.Visible = false;
                logoutBtn.Visible = true;
                loginBtn.Visible = false;
                registerBtn.Visible = false;
                labelError.Visible = false;
                loginLabel.Visible = false;
                passLabel.Visible = false;
                Label1.Text = "Привет " + myuser + "!";

                Session["IDP"] = iduser;
                Session["idU"] = myuser;
                Session["ROLE"] = userRole;
            } catch (Exception ex)
            {
                Label1.Text = "";
                labelError.Text = ex.Message;
                labelError.Visible = true;
            }
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Label1.Visible = false;
            passBox.Visible = true;
            loginLabel.Visible = true;
            passLabel.Visible = true;
            loginBox.Visible = true;
            logoutBtn.Visible = false;
            loginBtn.Visible = true;
            registerBtn.Visible = true;
        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cabinet.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Packages.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Employees.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Users.aspx");
        }
    }

}