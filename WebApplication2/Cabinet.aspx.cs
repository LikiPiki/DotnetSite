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
            CabinetAddTrackInfo.Visible = false;
            this.updateCabinetTracksTable();
        }

        protected void updateCabinetTracksTable()
        {

            DataClasses1DataContext db = new DataClasses1DataContext();

            long iduser = Convert.ToInt64(Session["IDP"]);
            string myuser = Convert.ToString(Session["idU"]);
            if (iduser != 0)
            {
                cabinetUsernameLabel.Text = myuser;
                var result = db.tracks.Where(x => x.индификатор_пользователя == iduser).Select(x => x.индификатор_почтового_отправления);
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

        protected void CabinetAddTrackBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                int iduser = Convert.ToInt32(Session["IDP"]);
                // добавление трек номера в базу
                try
                {
                    DataClasses1DataContext db = new DataClasses1DataContext();
                    tracks myTrack = new tracks
                    {
                        индификатор_пользователя = iduser,
                        индификатор_почтового_отправления = Convert.ToInt32(CabinetAddTrackBox.Text)
                    };
                    db.tracks.InsertOnSubmit(myTrack);
                    db.SubmitChanges();
                    CabinetAddTrackInfo.Text = "Трек номер добавлен успешно" + myTrack.индификатор_пользователя + " " + myTrack.индификатор_почтового_отправления;

                    this.updateCabinetTracksTable();
                } catch (Exception ex)
                {
                    CabinetAddTrackInfo.Text = ex.Message;
                }
                CabinetAddTrackInfo.Visible = true;
            }
        }
    }
}