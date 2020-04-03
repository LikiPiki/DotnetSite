using System;
using System.Collections.Generic;
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

    }
}