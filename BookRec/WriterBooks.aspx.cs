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
    public partial class WriterDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int WId = Convert.ToInt32(Request.QueryString["writerId"]);
            BindWriterBooks(WId);
            BindWriterInfo(WId);
        }

        void BindWriterBooks(int writerid)
        {
            DbManager manager = new DbManager();
            GridView1.DataSource = manager.WriterBooks(writerid);
            GridView1.DataBind();
        }
        void BindWriterInfo(int writerid)
        {
            DbManager manager = new DbManager();
            DataSet set = new DataSet();
            set = manager.GetMyWriterInfo(writerid);

            WriterNameSurnamelbl.Text = set.Tables[0].Rows[0]["WriterNameSurname"].ToString();
            Writerdoblbl.Text = set.Tables[0].Rows[0]["WriterDob"].ToString();
            Writerdodlbl.Text = set.Tables[0].Rows[0]["WriterDod"].ToString();
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            int bookId = Convert.ToInt32((sender as LinkButton).CommandArgument);
            Response.Redirect("BookDetails.aspx?kitapId=" + bookId);
        }
    }
}