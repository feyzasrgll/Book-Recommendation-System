<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Timeline.aspx.cs" Inherits="BookRec.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="/css/menu.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
   <title>Profil</title>
    <style type="text/css">
        .auto-style1 {
            margin-top: 90px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id='cssmenu'>
        <ul>
            <li><a href='/Profile.aspx'>Profil</a></li>
            <li><a href='/PopularBooks.aspx'>Popüler Kitaplar</a></li>
            <li><a href='/TopPointBooks.aspx'>Yüksek Puanlı Kitaplar</a></li>
            <li><a href='/PopularWriters.aspx'>Popüler Yazarlar</a></li>
            <li class='active'><a href='/Timeline.aspx'>Anasayfa</a></li>
            <li><a href='/Search.aspx'>Ara</a></li>
        </ul>
        </div>
        <div>
            <table class="class">
                <tr>
                    <td>
                        <asp:Label ID="RecommandedUsers" runat="server" Text="Sizin için önerilen Kullanıcılar:" BorderColor="#FF9900"></asp:Label>
                        <br />
                        <br />
                        <asp:GridView ID="ListOfRecommandedUsers" runat="server" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    Kullanıcı adı
                                                </td>
                                                <td>
                                                    Okunan ortak kitap sayısı
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <%# Eval("Person") %>
                                                </td>
                                                <td>
                                                    <%# Eval("BookCount") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td> 
                    <td>
                        <asp:GridView ID="UserRecommendGV" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    Kullanıcı adı
                                                </td>

                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <%# Eval("Person") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style1">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    Kitap Adı
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <%# Eval("BookName") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                     </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
