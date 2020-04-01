using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            const int SALARY_INDEX = 4;
            decimal salary = 0;

            foreach (GridViewRow row in GridView1.Rows)
            {
                salary += Decimal.Parse(row.Cells[SALARY_INDEX].Text);
            }

            GridViewRow footer = GridView1.FooterRow;
            footer.Cells[0].ColumnSpan = 4;
            footer.Cells[0].HorizontalAlign = HorizontalAlign.Center;

            footer.Cells.RemoveAt(1);
            footer.Cells.RemoveAt(2);
            footer.Cells.RemoveAt(3);

            footer.Cells[0].Text = "В один месяц выплат сотрудникам на сумму - " + Convert.ToString(salary) + " Рублей";

        }
    }
}