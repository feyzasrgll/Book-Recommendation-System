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
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        DbManager manager = new DbManager();
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            TextBox1.Visible = true;
            Button1.Visible = true;
            Button2.Visible = false;
            Button3.Visible = false;
        }
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            TextBox1.Visible = true;
            Button1.Visible = false;
            Button2.Visible = true;
            Button3.Visible = false;
        }
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            TextBox1.Visible = true;
            Button1.Visible = false;
            Button2.Visible = false;
            Button3.Visible = true;
        }
        protected void Button1_Click(object sender, EventArgs e)//Kullanıcı aratma
        {
            GridView1.DataSource = manager.GetMyUserSearchResult(TextBox1.Text);
            GridView1.DataBind();
        }
        protected void Button2_Click(object sender, EventArgs e)//Kitap aratma
        {
            GridView2.DataSource = manager.GetMyBookSearchResult(TextBox1.Text);
            GridView2.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)//Yazar aratma
        {
            GridView3.DataSource = manager.GetMyWriterSearchResult(TextBox1.Text);
            GridView3.DataBind();            
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            int UserId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("UserProfile.aspx?UserId=" + UserId);
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            int BookId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("BookDetails.aspx?kitapId=" + BookId);
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            int WriterId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("WriterBooks.aspx?writerId=" + WriterId);
        }
    }
}