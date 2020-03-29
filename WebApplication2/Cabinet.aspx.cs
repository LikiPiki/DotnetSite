using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();

            long iduser = Convert.ToInt64(Session["IDP"]);
            string myuser = Convert.ToString(Session["idU"]);
            if (iduser != 0)
            {
                cabinetUsernameLabel.Text = myuser;
                var result = db.tracks.Where(x => x.id == iduser).Select(x => x.индификатор_почтового_отправления);
                var resultArray = result.ToArray();

                var dd = from Почтовые_отправления in db.Почтовые_отправления where resultArray.Contains(Почтовые_отправления.номер_почтового_отправления) select Почтовые_отправления;
                GridView1.DataSource = dd;
                GridView1.DataSourceID = "";
                GridView1.DataBind();
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}