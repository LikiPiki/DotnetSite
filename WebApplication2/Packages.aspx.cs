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
                    Почтовые_отправления myPackage = new Почтовые_отправления();
                    myPackage.выдана = false;
                    myPackage.дата_отправки = DateTime.Now;
                    myPackage.кому = PackagesToBox.Text;
                    myPackage.от_кого = PackagesFromBox.Text;
                    myPackage.откуда = PackagesFromHere.Text;
                    myPackage.куда = PackagesToHere.Text;
                    myPackage.индификатор_склада = Convert.ToInt32(NewWarehouseNumber.SelectedValue);
                    myPackage.тип_отправления = NewPackageType.SelectedValue;
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
    }
}