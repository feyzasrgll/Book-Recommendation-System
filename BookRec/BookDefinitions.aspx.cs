using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BookRecommendationSystem;

namespace BookRec
{
    public partial class BookDefinitions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BookAddButton_Click(object sender, EventArgs e)
        {
            string bn = BookTextBox.Text;
            string bp = PublisherTextBox.Text;
            string bd = BookDetailTextBox.Text;
            DbManager manager = new DbManager();
            manager.AddBookasManager(bn, bp, bd);
            MessageBox.Show(this.Page, "Başarılı", "Kitap başarılı bir şekilde eklendi!");
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            Label1.Visible = true;
            SaveButton.Visible = true;

            DropDownList1.Visible = true;
            DbManager manager = new DbManager();
            DropDownList1.DataSource = manager.GetMyBooks();
            DropDownList1.DataTextField = "BookName";
            DropDownList1.DataValueField = "Id";

            DropDownList1.DataBind();
        }
    }
}