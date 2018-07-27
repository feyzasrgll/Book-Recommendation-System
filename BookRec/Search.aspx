<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="BookRec.Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="/css/menu.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
   <title>Arama</title>
    <style type="text/css">
        .auto-style1 {
            height: 30px;
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
            <li><a href='/Timeline.aspx'>Anasayfa</a></li>
            <li class='active'><a href='/Search.aspx'>Ara</a></li>
        </ul>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Kullanıcı Arama</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Kitap Arama</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Yazar Arama</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" Visible="False" />
                    </td>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" Visible="False" />
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click" Visible="False" />
                    </td>
                </tr>
             </table>
        </div>

        <div>
            <table>
                <tr>
                    <td class="auto-style1">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="142px">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    Kullanıcı Adı
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="LinkButton4_Click"><%# Eval("UserName") %></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Width="131px">
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
                                                    <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="LinkButton5_Click"><%# Eval("BookName") %></asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" Width="136px">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                     Yazar
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton6" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="LinkButton6_Click"><%# Eval("WriterNameSurname") %></asp:LinkButton>
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
    <p>
        &nbsp;</p>
</body>
</html>
