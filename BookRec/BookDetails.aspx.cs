using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BookRecommendationSystem;

namespace BookRec
{
    public partial class BookDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int kId = Convert.ToInt32(Request.QueryString["kitapId"]);
            BindData(kId);
            BindCommentData(kId);
            BindQuoteData(kId);            
        }

        void BindData(int kId)
        {
            DbManager manager = new DbManager();
            DataSet KeepDs = new DataSet();
            KeepDs = manager.GetBookDetails(kId);

            BookNamelbl.Text = KeepDs.Tables[0].Rows[0]["KitapAdi"].ToString();
            WriterNamelbl.Text = KeepDs.Tables[0].Rows[0]["Yazar"].ToString();
            Publisherlbl.Text = KeepDs.Tables[0].Rows[0]["Yayinevi"].ToString();
            BookScorelbl.Text = KeepDs.Tables[0].Rows[0]["KitapPuani"].ToString();
            BookReadingCountlbl.Text = KeepDs.Tables[0].Rows[0]["OkunmaSayisi"].ToString();
            BookDetailtb.Text = KeepDs.Tables[0].Rows[0]["KitapDetay"].ToString();
        }
        void BindCommentData(int kId)
        {
            DbManager manager = new DbManager();
            DataSet GetSet = new DataSet();
            GetSet = manager.GetMyComments(kId);
            BookCommentsGV.DataSource = GetSet.Tables[0];
            BookCommentsGV.DataBind();
        }
        void BindQuoteData(int kId)
        {
            DbManager manager = new DbManager();
            DataSet GetSet2 = new DataSet();
            GetSet2 = manager.GetMyQuotes(kId);
            BookQuotesGV.DataSource = GetSet2.Tables[0];
            BookQuotesGV.DataBind();
        }


        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }
    }
}