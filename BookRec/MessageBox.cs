using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace BookRec
{
    public static class MessageBox
    {
        public static void Show(Page page, string title, string text)
        {
            page.ClientScript.RegisterClientScriptBlock(page.GetType(), title, $"<script>alert('{text}');</script>");
        } 
    }
}