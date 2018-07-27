<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopularWriters.aspx.cs" Inherits="BookRec.PopularWriters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="/css/menu.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
   <title>Popüler Yazarlar</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id='cssmenu'>
        <ul>
            <li><a href='/Profile.aspx'>Profil</a></li>
            <li><a href='/PopularBooks.aspx'>Popüler Kitaplar</a></li>
            <li><a href='/TopPointBooks.aspx'>Yüksek Puanlı Kitaplar</a></li>
            <li class='active'><a href='/PopularWriters.aspx'>Popüler Yazarlar</a></li>
            <li><a href='/Timeline.aspx'>Anasayfa</a></li>
            <li><a href='/Search.aspx'>Ara</a></li>
        </ul>
        </div>

        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="279px">
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <table>
                                <tr>
                                    <td>
                                        Yazar
                                    </td>
                                    <td>
                                        Kitapları
                                    </td>
                                    <td>
                                        Okunma Sayısı
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("WriterId") %>' OnClick="LinkButton1_Click"><%# Eval("WriterNameSurname") %></asp:LinkButton>
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("BookId") %>' OnClick="LinkButton2_Click"><%# Eval("BookName") %></asp:LinkButton>
                                    </td>
                                    <td>
                                        <%# Eval("WriterReadingCount") %>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
