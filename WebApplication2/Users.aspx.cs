using System;
using System.Collections.Generic;
using System.Data.Linq.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UsersFindInfoLabel.Visible = false;
        }

        protected void Users_DataBound(object sender, EventArgs e)
        {
            decimal count = 0;

            foreach (GridViewRow row in GridView1.Rows)
            {
                count++;
            }

            GridViewRow footer = GridView1.FooterRow;
            footer.Cells[0].ColumnSpan = 4;
            footer.Cells[0].HorizontalAlign = HorizontalAlign.Center;

            footer.Cells.RemoveAt(1);
            footer.Cells.RemoveAt(2);

            footer.Cells[0].Text = "Всего пользователей сервиса: " + Convert.ToString(count) + " человек";
        }

        protected void UsersFindUsersBtn_Click(object sender, EventArgs e)      
        {
            DataClasses1DataContext db = new DataClasses1DataContext();

            string loginTofind = UsersFindUsersBox.Text;
            if (loginTofind != "")
            {
                var dd = (from u in db.users where SqlMethods.Like(u.username, loginTofind) select u);
                GridView1.DataSource = dd;
                GridView1.DataSourceID = "";
                GridView1.DataBind();
            } else
            {
                UsersFindInfoLabel.Text = "Задан поисковой запрос!";
                UsersFindInfoLabel.Visible = true;
            }
        }
    }
}