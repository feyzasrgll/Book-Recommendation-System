using BookRecommendationSystem;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookRec
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["UserId"]);
            BindRecommendedUser(id);
            BindRecommendednUsers2(2);
            BindRecommendBooks();
        }
        DbManager mng = new DbManager();
        void BindRecommendedUser(int Id)
        {
            ListOfRecommandedUsers.DataSource = mng.RecommendedUserbyBookCount(Id);
            ListOfRecommandedUsers.DataBind();   
        }
        void BindRecommendednUsers2(int id)
        {
            UserRecommendGV.DataSource = mng.RecommendedUserByBookScore(id);
            UserRecommendGV.DataBind();
        }
        void BindRecommendBooks()
        {
            GridView1.DataSource = mng.GetmyTopPointBooks();
            GridView1.DataBind();
        }
    }
}