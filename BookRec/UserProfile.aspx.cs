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
    public partial class UserDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int UId = Convert.ToInt32(Request.QueryString["UserId"]);
            BindUserInfo(UId);
            BindQuotesandComments(UId);
        }
        DbManager mng = new DbManager();
        void BindUserInfo(int UId)
        {
            DataSet dset = mng.GetMyUserInfo(UId);

            UserNamelbl.Text = dset.Tables[0].Rows[0]["UserName"].ToString();
            NameSurnamelbl.Text = dset.Tables[0].Rows[0]["NameSurname"].ToString();
        }
        void BindQuotesandComments(int Id)
        {
            DataSet dset = mng.GetMyUserQotesandComments(Id);
            GridView1.DataSource = dset.Tables[0];
            GridView1.DataBind();
        }

        protected void SendMessageButton_Click(object sender, EventArgs e)
        {
            MessageEventlbl.Visible = true;
            EventTextBox.Visible = true;
            Messagelbl.Visible = true;
            MessageTextBox.Visible = true;
            SendButton.Visible = true;
        }

        protected void SendButton_Click(object sender, EventArgs e)
        {
            int UId = Convert.ToInt32(Request.QueryString["UserId"]);
            int id = Convert.ToInt32(Session["UserId"]);
            string eventtext = EventTextBox.Text;
            string messagetext = MessageTextBox.Text;
            mng.SendMessage(id,UId,eventtext,messagetext,DateTime.Now);
            MessageBox.Show(this.Page, "Gönderildi", "Mesajınız başarıyla gönderilmiştir.");
            EventTextBox.Text = " ";
            MessageTextBox.Text = " ";  
        }
    }
}