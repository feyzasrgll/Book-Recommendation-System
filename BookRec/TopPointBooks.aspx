<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopPointBooks.aspx.cs" Inherits="BookRec.TopPointBooks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="/css/menu.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
   <title>Yüksek Puanlı Kitaplar</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id='cssmenu'>
        <ul>
            <li><a href='/Profile.aspx'>Profil</a></li>
            <li><a href='/PopularBooks.aspx'>Popüler Kitaplar</a></li>
            <li class='active'><a href='/TopPointBooks.aspx'>Yüksek Puanlı Kitaplar</a></li>
            <li><a href='/PopularWriters.aspx'>Popüler Yazarlar</a></li>
            <li><a href='/Timeline.aspx'>Anasayfa</a></li>
            <li><a href='/Search.aspx'>Ara</a></li>
        </ul>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td>
                                    Kitap Adı
                                </td>
                                <td>
                                    Puanı
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument=' <%# Eval("BId") %>' OnClick="LinkButton1_Click"> <%# Eval("BookName") %> </asp:LinkButton>
                                </td>
                                <td>
                                    <%# Eval("AverageScore") %>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
