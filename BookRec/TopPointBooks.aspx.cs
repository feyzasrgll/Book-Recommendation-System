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
    public partial class TopPointBooks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetTopPointBooks();
        }
        void GetTopPointBooks()
        {
            DbManager manager = new DbManager();
            DataSet data = manager.GetmyTopPointBooks();
            GridView1.DataSource = data;
            GridView1.DataBind();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("BookDetails.aspx?kitapId=" + id);
        }
    }
}