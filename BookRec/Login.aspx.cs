using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using BookRecommendationSystem;

namespace BookRec
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            DbManager manager = new DbManager();
            bool result = manager.Login(UserNameTextBox.Text, PasswordTextBox.Text);
            if (result == true)
            {
                int id = manager.GetUserId(UserNameTextBox.Text);
                Session["UserId"] = id;
                Response.Redirect("Timeline.aspx");
            }
            else
            {
                MessageBox.Show(this.Page, "Başarısız", "Giriş bilgilerinizi kontrol ediniz!");
            }
        }

        protected void SignUpButton_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagerLogin.aspx");
        }


    }
}