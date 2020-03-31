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
            AddNewPackagePanel.Visible = true;
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

        protected void PackagesAddNewBtn_Click(object sender, EventArgs e)
        {
            PackagesAddNewBtn.Visible = false;
            AddNewPackagePanel.Visible = true;
        }

        protected void NewPackageCancel_Click(object sender, EventArgs e)
        {
            PackagesAddNewBtn.Visible = true;
            AddNewPackagePanel.Visible = false;
        }
    }
}