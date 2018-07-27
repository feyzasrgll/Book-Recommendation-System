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
    public partial class Timeline : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DbManager manager = new DbManager();
                DropDownList1.DataSource = manager.GetMyBooks();
                DropDownList1.DataTextField = "BookName";
                DropDownList1.DataValueField = "Id";
                DropDownList1.DataBind();

                DropDownList2.DataSource = manager.GetMyBooks();
                DropDownList2.DataTextField = "BookName";
                DropDownList2.DataValueField = "Id";
                DropDownList2.DataBind();

                PageNumberTextBox.Text = "1";
            }
        }

        protected void AddCommentButton_Click1(object sender, EventArgs e)
        {

            DbManager manager = new DbManager();
            manager.AddComment(Convert.ToInt32(DropDownList1.SelectedValue),1, CommentTextBox.Text, Convert.ToInt32(Session["UserId"]),Convert.ToInt32(DropDownList4.SelectedValue));
            MessageBox.Show(this.Page, "Başarılı", "Yorumunuz Başarılı bir şekilde eklenmiştir.");

            DropDownList1.SelectedIndex = 0;
            CommentTextBox.Text = string.Empty;
        }

        protected void AddQuoteButton0_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(PageNumberTextBox.Text) || Convert.ToInt32(PageNumberTextBox.Text) < 1)
            {
                MessageBox.Show(this.Page, "Sayfa Sayısı Hatası!", "Sayfa sayısı giriş dizinini kontrol ediniz.");
                PageNumberTextBox.Text = string.Empty;
            }
            else
            {
                DbManager manager = new DbManager();
                manager.AddQuote(Convert.ToInt32(DropDownList2.SelectedValue),1, Convert.ToInt32(PageNumberTextBox.Text), QuoteTextBox.Text, Convert.ToInt32(Session["UserId"]),Convert.ToInt32(DropDownList3.SelectedValue));
                MessageBox.Show(this.Page, "Başarılı", "Yorumunuz Başarılı bir şekilde eklenmiştir.");

                DropDownList2.SelectedIndex = 0;
                PageNumberTextBox.Text = string.Empty;
                QuoteTextBox.Text = string.Empty;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["UserId"]);
            GridView1.Visible = true;
            DbManager manager = new DbManager();
            DataSet dset = manager.CheckMyMessages(id);
            GridView1.DataSource = dset.Tables[0];
            GridView1.DataBind();
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Label1.Visible = true;
            TextBox1.Visible = true;
            Label2.Visible = true;
            TextBox2.Visible = true;
            Button2.Visible = true;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(Request.QueryString["SendeeId"]);
            int id = Convert.ToInt32(Session["UserId"]);

            string text1 = TextBox1.Text;
            string text2 = TextBox2.Text;
            DbManager mng = new DbManager();
            mng.SendMessage(id,Id,text1,text2,DateTime.Now);
            MessageBox.Show(this.Page, "Gönderildi", "Mesajınız bşarıyla ggönderilmiştir.");
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}