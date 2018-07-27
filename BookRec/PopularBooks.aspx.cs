using BookRecommendationSystem;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookRec
{
    public partial class PopularBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetPopularBooks();
        }

        void GetPopularBooks()
        {
            DbManager manager = new DbManager();
            DataSet data = manager.GetMyPopularBooks();
            PopularBooksGridView.DataSource = data.Tables[0];
            PopularBooksGridView.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("BookDetails.aspx?kitapId=" + id);
        }
    }

}