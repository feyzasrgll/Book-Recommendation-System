using BookRecommendationSystem;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookRec
{
    public partial class ManagerLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ManagerLoginButton_Click(object sender, EventArgs e)
        {
            DbManager manager = new DbManager();
            bool result = manager.ManagerLogin(ManagerUsernameTextBox.Text, ManagerPasswordTextBox.Text);
            if (result == true)
            {
                ManagerPasswordTextBox.Text = string.Empty;
                Response.Redirect("BookDefinitions.aspx");
            }
            else
            {
                MessageBox.Show(this.Page, "Hata","Giriş bilgilerinizi kontrol ediniz.");
            }
                
        }
    }
}