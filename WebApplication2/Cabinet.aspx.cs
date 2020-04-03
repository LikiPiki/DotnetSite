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
            CabinetRemoveSuccessLabel.Visible = false;
            CabinetPackageGeolocPanel.Visible = false;

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

                    var count = db.tracks.Where(x => ((x.индификатор_пользователя == myTrack.индификатор_пользователя) && (x.индификатор_почтового_отправления == myTrack.индификатор_почтового_отправления)))
                        .Select(x => x).Count();

                    if (count == 0)
                    {
                        db.tracks.InsertOnSubmit(myTrack);
                        db.SubmitChanges();
                        CabinetAddTrackInfo.Text = "Трек номер добавлен успешно";
                    } else
                    {
                        CabinetAddTrackInfo.Text = "Данное отправление уже было добавлено!";
                    }

                    this.updateCabinetTracksTable();
                } catch (Exception ex)
                {
                    CabinetAddTrackInfo.Text = ex.Message;
                }
                CabinetAddTrackInfo.Visible = true;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["IDG"] = this.GridView1.SelectedValue;
        }

        protected void CabinetRemoveTrackBtn_Click(object sender, EventArgs e)
        {
            int selectedItem = Convert.ToInt32(Session["IDG"]);
            int userid = Convert.ToInt32(Session["IDP"]);
            try
            {
                DataClasses1DataContext db = new DataClasses1DataContext();
                var selectedRow = (from tracks in db.tracks
                                   where tracks.индификатор_пользователя == userid
                                    && tracks.индификатор_почтового_отправления == selectedItem
                                   select tracks).SingleOrDefault();

                db.tracks.DeleteOnSubmit(selectedRow);
                db.SubmitChanges();
                CabinetRemoveSuccessLabel.Text = "Успешно удалено!";
            } catch(Exception ex)
            {
                CabinetRemoveSuccessLabel.Text = ex.Message;
            }
            CabinetRemoveSuccessLabel.Visible = true;
            this.updateCabinetTracksTable();
        }

        protected void CabitShowGeolocBtn_Click(object sender, EventArgs e)
        {
            int idPackage = Convert.ToInt32(Session["IDG"]);
            if (idPackage != 0) {
                CabinetPackageGeolocPanel.Visible = true;
                CabitPackageAboutPackage.Text = "Информация по отслеживанию посылки с треком " + idPackage;
                DataClasses1DataContext db = new DataClasses1DataContext();
                var dd = (from g in db.Геолокации where g.почтовое_отправление == idPackage select g);
                CabinetPackageMoreGeoloc.DataSource = dd;
                CabinetPackageMoreGeoloc.DataSourceID = "";
                CabinetPackageMoreGeoloc.DataBind();
            } else
            {
                CabinetAddTrackInfo.Text = "Вы не выбрали почтовое отправление в таблице выше!";
                CabinetAddTrackInfo.Visible = true;
            }
        }

        protected void CabitClosePackageGeolocPanel_Click(object sender, EventArgs e)
        {
            CabinetPackageGeolocPanel.Visible = false;
        }
    }
}