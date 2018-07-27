using BookRecommendationSystem;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookRec
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGenders();
            BindDate();
        }

        void BindGenders()
        {
            List<string> gendersList = new List<string>();
            gendersList.Add("Erkek");
            gendersList.Add("Kadın");

            RadioButtonList1.DataSource = gendersList;
            RadioButtonList1.DataBind();

            RadioButtonList1.SelectedIndex = 0;
        }

        void BindDate()
        {
            List<int> dayList = new List<int>();
            List<string> monthList = new List<string>();
            List<string> yearList = new List<string>();

            for (int i = 1; i <= 31; i++)
            {
                if (i <= 12)
                    monthList.Add(i.ToString());
                dayList.Add(i);
            }

            for (int i = 1990; i < 2010; i++)
                yearList.Add(i.ToString());

            DayList.DataSource = dayList;
            DayList.DataBind();

            MonthList.DataSource = monthList;
            MonthList.DataBind();

            YearList.DataSource = yearList;
            YearList.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string gender = string.Empty;
            if (RadioButtonList1.SelectedIndex == 0)
                gender = "Erkek";
            else
                gender = "Kadın";

            DateTime dob = new DateTime(Convert.ToInt32(YearList.SelectedValue), Convert.ToInt32(MonthList.SelectedValue), Convert.ToInt32(DayList.SelectedValue));

            DbManager manager = new DbManager();

            bool result = manager.Signup(NameTextBox.Text,SurnameTextBox.Text,UsernameTextBox.Text, PasswordTextBox.Text, gender, dob, string.Empty);
            bool result2 = manager.ManagerLogin(UsernameTextBox.Text,string.Empty);
            if (result == true && result2 == false)
            {
                MessageBox.Show(this.Page, "Başarılı", "Tebrikler, başarıyla kaydoldunuz!");
                Response.Redirect("Login.aspx");
            }
            else
                MessageBox.Show(this.Page, "Başarısız", "Girdiğiniz kullanıcı adını alamazsınız!");
        }
    }
}