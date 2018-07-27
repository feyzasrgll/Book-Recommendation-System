<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BookRec.Timeline" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="/css/menu.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
   <title>Haber Akışı</title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 2px;
        }
        .auto-style2 {
            height: 125px;
            width: 717px;
        }
        .auto-style3 {
            margin-left: 0px;
        }
        .auto-style5 {
            height: 95px;
        }
        .auto-style4 {
            margin-left: 0px;
            margin-top: 0px;
        }
        .class{
            background-color:#f7ef6a;
        }

        .auto-style6 {
            margin-top: 0px;
        }

        .auto-style7 {
            margin-left: 46px;
        }

        .auto-style8 {
            width: 145px;
        }

        .auto-style9 {
            margin-top: 21px;
        }

        .auto-style10 {
            width: 108px;
        }

        .auto-style11 {
            margin-top: 9px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <div id='cssmenu'>
        <ul>
            <li class='active'><a href='/Profile.aspx'>Profil</a></li>
            <li><a href='/PopularBooks.aspx'>Popüler Kitaplar</a></li>
            <li><a href='/TopPointBooks.aspx'>Yüksek Puanlı Kitaplar</a></li>
            <li><a href='/PopularWriters.aspx'>Popüler Yazarlar</a></li>
            <li><a href='/Timeline.aspx'>Anasayfa</a></li>
            <li><a href='/Search.aspx'>Ara</a></li>
        </ul>
        </div>

        <div style ="margin: 10 px;">
            <table class="auto-style2">

            <tr class="satir">
                <td style="grid-auto-columns" class="auto-style5">
                    <asp:Label ID="Label9" runat="server" Text="İleti Paylaş: "></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="CommentTextBox" runat="server" Width="238px" CssClass="auto-style1" Font-Italic="True" ForeColor="#669999" Height="66px" TextMode="MultiLine">İleti Mesajınız</asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:CheckBoxList ID="CheckBoxList2" runat="server">
                        <asp:ListItem Selected="True">Bu kitabı  okudum</asp:ListItem>
                    </asp:CheckBoxList>
                    Kitaba puanım<br />
&nbsp;<asp:DropDownList ID="DropDownList4" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="AddCommentButton" runat="server" Text="Add" CssClass="auto-style3" Width="58px" OnClick="AddCommentButton_Click1" />
                </td>
            </tr>

            <tr class="satir">
                <td style="grid-auto-columns">
                    <asp:Label ID="Label10" runat="server" Text="Alıntı Paylaş: "></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
                    <asp:TextBox ID="PageNumberTextBox" runat="server" CssClass="auto-style4" Font-Italic="True" Font-Names="Arial" ForeColor="#669999" Height="16px" TextMode="Number" Width="45px">Sayfa</asp:TextBox>
                </td>
                
                <td>
                    <asp:TextBox ID="QuoteTextBox" runat="server" Width="238px" CssClass="auto-style3" Font-Italic="True" ForeColor="#669999" Height="68px" TextMode="MultiLine">Alıntı Mesajınız</asp:TextBox>
                </td>
                <td>
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" Width="138px" CssClass="auto-style11" Height="16px" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" >
                        <asp:ListItem Selected="True">Bu kitabı okudum</asp:ListItem>
                    </asp:CheckBoxList>
                    Kitaba puanım<br />
&nbsp;<asp:DropDownList ID="DropDownList3" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style10">
                    <asp:Button ID="AddQuoteButton0" runat="server" Text="Add" CssClass="auto-style3" Width="58px" OnClick="AddQuoteButton0_Click" Height="28px" />
                </td>
            </tr>
            </table>
        </div>
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="Button1" runat="server" Text="Mesajlarım" CssClass="auto-style6" Height="27px" OnClick="Button1_Click" />
                        <br />
                    </td>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="auto-style7" Height="149px" Width="245px" Visible="False">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    Gönderen
                                                </td>
                                                <td>
                                                    Konu
                                                </td>
                                                <td>
                                                    Mesaj
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("SenderId") %>' OnClick="LinkButton1_Click"><%# Eval("UserName") %></asp:LinkButton>
                                                </td>
                                                <td>
                                                    <%# Eval("Eventt") %>
                                                </td>
                                                <td>
                                                    <%# Eval("TextMessage") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                    <td>

                    </td>
                    <td class="auto-style8">
                        <asp:Label ID="Label1" runat="server" Text="Konu:" Visible="False"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                        <asp:Label ID="Label2" runat="server" Text="Mesaj:" Visible="False"></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
                        <asp:Button ID="Button2" runat="server" Text="Gönder" CssClass="auto-style9" OnClick="Button2_Click" Visible="False" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
