using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            NewPackageInfoLabel.Visible = false;
            PackagesSubmitlabel.Visible = false;
            PackageFindInfo.Visible = false;
            PackagesAddGeolocationLabel.Visible = false;



            int selected = Convert.ToInt32(Session["SELECTED"]);
            if (selected != 0)
            {
                PackagesGeolocationPanel.Visible = true;
                this.updateLocations();
            } else
            {
                PackagesGeolocationPanel.Visible = true;
            }

            this.updateDropdownData();
        }

        protected void updateDropdownData()
        {
            DataClasses1DataContext db = new DataClasses1DataContext();

            // select all distinct packages types
            var dropData = db.Почтовые_отправления.Select(x => x.тип_отправления).AsEnumerable().Distinct().ToList();
            NewPackageType.DataSource = dropData;
            NewPackageType.DataSourceID = "";
            NewPackageType.DataBind();

            var warehousesData = db.Склады.Select(x => new { x.индификатор_склада, label = string.Format("{0} {1} {2}", x.Город, x.Адрес, x.Номер_склада) });
            NewWarehouseNumber.DataSource = warehousesData;
            NewWarehouseNumber.DataSourceID = "";
            NewWarehouseNumber.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["SELECTED"] = GridView1.SelectedValue;
        }

        protected void NewPackageBtn_Click(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            if (Page.IsValid)
            {
                try
                {
                    Почтовые_отправления myPackage = new Почтовые_отправления
                    {
                        выдана = false,
                        дата_отправки = DateTime.Now,
                        кому = PackagesToBox.Text,
                        от_кого = PackagesFromBox.Text,
                        откуда = PackagesFromHere.Text,
                        куда = PackagesToHere.Text,
                        индификатор_склада = Convert.ToInt32(NewWarehouseNumber.SelectedValue),
                        тип_отправления = NewPackageType.SelectedValue
                    };
                    db.Почтовые_отправления.InsertOnSubmit(myPackage);
                    db.SubmitChanges();

                    NewPackageInfoLabel.Text = "Успешно добавлена";
                } catch (Exception ex)
                {
                    NewPackageInfoLabel.Text = ex.Message;
                }
                NewPackageInfoLabel.Visible = true;
            }
        }

        protected void SubmitPackage_Click(object sender, EventArgs e)
        {
            int selectedItem = Convert.ToInt32(Session["SELECTED"]);

            try
            {
                DataClasses1DataContext db = new DataClasses1DataContext();
                var dd = (from p in db.Почтовые_отправления where p.номер_почтового_отправления == selectedItem select p).SingleOrDefault();
                dd.выдана = true;
                db.SubmitChanges();
                PackagesSubmitlabel.Text = "Успешно выдана!";
                Response.Redirect(Request.RawUrl);
            } catch(Exception ex)
            {
                PackagesSubmitlabel.Text = ex.Message;
            }
            PackagesSubmitlabel.Visible = true;
        }

        protected void PackageCreatePackage_Click(object sender, EventArgs e)
        {
            AddNewPackagePanel.Visible = true;
        }

        protected void PackagesFindByTrack_Click(object sender, EventArgs e)
        {
            DataClasses1DataContext db = new DataClasses1DataContext();
            if (PackagesFindByTrackBox.Text.Length == 0)
            {
                PackageFindInfo.Text = "Задан пустой запрос";
                PackageFindInfo.Visible = true;
                return;
            }

            int trackNumber = Convert.ToInt32(PackagesFindByTrackBox.Text);
            var dd = (from p in db.Почтовые_отправления where p.номер_почтового_отправления == trackNumber select p);
            int count = dd.Count();
            if (count > 0)
            {
                GridView1.DataSource = dd;
                GridView1.DataSourceID = "";
                GridView1.DataBind();
            } else
            {
                PackageFindInfo.Text = "К сожалению ничего не нашлось!";
                PackageFindInfo.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int selected = Convert.ToInt32(Session["SELECTED"]);

            if (selected != 0)
            {
                DataClasses1DataContext db = new DataClasses1DataContext();
                var dd = (from g in db.Геолокации where g.почтовое_отправление == selected select g);
                PackageMoreGeolocations.DataSource = dd;
                PackageMoreGeolocations.DataSourceID = "";
                PackageMoreGeolocations.DataBind();

                PackagesGeolocationPanel.Visible = true;
            } else
            {
                PackagesSubmitlabel.Text = "Сначала выберите почтовое отправление";
                PackagesSubmitlabel.Visible = true;
            }
        }

        protected void updateLocations()
        {
            int selected = Convert.ToInt32(Session["SELECTED"]);

            if (selected != 0)
            {
                DataClasses1DataContext db = new DataClasses1DataContext();
                var dd = (from g in db.Геолокации where g.почтовое_отправление == selected select g);
                PackageMoreGeolocations.DataSource = dd;
                PackageMoreGeolocations.DataSourceID = "";
                PackageMoreGeolocations.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string enteringText = PackagesAddGeolocationBox.Text;
            int selected = Convert.ToInt32(Session["SELECTED"]);
            DateTime dt = DateTime.Now;

            if (enteringText != "")
            {
                try
                {
                    DataClasses1DataContext db = new DataClasses1DataContext();

                    Геолокации geoloc = new Геолокации
                    {
                        почтовое_отправление = selected,
                        текущее_местоположение = enteringText,
                        время_прибытия = dt
                    };
                    db.Геолокации.InsertOnSubmit(geoloc);
                    db.SubmitChanges();

                    PackagesAddGeolocationLabel.Text = "Успешно добавлено!";
                    this.updateLocations();
                }
                catch (Exception ex)
                {
                    PackagesAddGeolocationLabel.Text = ex.Message;
                }
            } else
            {
                PackagesAddGeolocationLabel.Text = "Ничего не введено!";
            }
            PackagesAddGeolocationLabel.Visible = true;
        }
    }
}