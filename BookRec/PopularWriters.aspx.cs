using BookRecommendationSystem;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookRec
{
    public partial class PopularWriters : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetPopularWriters();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int wId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("WriterBooks.aspx?writerId=" + wId);
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            int bookId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("BookDetails.aspx?kitapId=" + bookId);
        }
        void GetPopularWriters()
        {
            DbManager manager = new DbManager();
            GridView1.DataSource = manager.PopularWriters();
            GridView1.DataBind();
        }
    }
}