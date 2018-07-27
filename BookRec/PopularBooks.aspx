<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PopularBooks.aspx.cs" Inherits="BookRec.PopularBooks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="/css/menu.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
   <title>Popüler Kitaplar</title>
    <style>
        .gvcss{
            background-color:#f7ef6a;
        }
        .auto-style1 {
            margin-top: 22px;
        }
        .auto-style2 {
            height: 51px;
        }
        .auto-style3 {
            background-color: #f7ef6a;
            height: 230px;
            width: 457px;
            margin-top: 92px;
        }
        .auto-style4 {
            width: 282px;
        }
        .auto-style5 {
            width: 102px;
        }
    </style>
</head>
<body style="background-color:#ccdfcb">

    <form id="form1" runat="server">
        <div id='cssmenu'>
        <ul>
            <li><a href='/Profile.aspx'>Profil</a></li>
            <li class='active'><a href='/PopularBooks.aspx'>Popüler Kitaplar</a></li>
            <li><a href='/TopPointBooks.aspx'>Yüksek Puanlı Kitaplar</a></li>
            <li><a href='/PopularWriters.aspx'>Popüler Yazarlar</a></li>
            <li><a href='/Timeline.aspx'>Anasayfa</a></li>
            <li><a href='/Search.aspx'>Ara</a></li>
        </ul>
        </div>

        <div>
            <table class="auto-style3">
                <tr>
                    <td aria-multiline="True" aria-multiselectable="True" class="auto-style2">
                        <asp:Label ID="PupularBookslbl" runat="server" Text="En Popüler Kitaplar: " BorderColor="White" Font-Bold="False" Font-Italic="True" Font-Size="X-Large" ForeColor="#333333"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td aria-selected="true">
                        <asp:GridView ID="PopularBooksGridView" runat="server" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="1px" CellPadding="5" CssClass="auto-style1" ForeColor="Black" GridLines="None" Height="217px" SelectedIndex="0" Width="1005px" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField>                                 
                                    <HeaderTemplate>
                                        <table>
                                            <tr>
                                                <td class="auto-style4">
                                                    Kitap Adı 
                                                </td>
                                                <td class="auto-style5">
                                                    Yazar Adı
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
                                                <td class="auto-style4">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("KitapId") %>' OnClick="LinkButton1_Click"> <%# Eval("KitapAdi") %></asp:LinkButton>
                                                </td>
                                                <td class="auto-style5">
                                                    <%# Eval("YazarAdSoyad") %>
                                                </td>
                                                <td>
                                                    <%# Eval("OkunmaSayisi") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                            <SelectedRowStyle BackColor="#CCFF33" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
