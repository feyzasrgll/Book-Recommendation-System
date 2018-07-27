<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="BookRec.BookDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 208px;
        }
        .auto-style5 {
            width: 405px;
            height: 372px;
            margin-left: 4px;
        }
        .auto-style7 {
            width: 208px;
            height: 6px;
        }
        .auto-style8 {
            width: 208px;
            height: 118px;
        }
        .auto-style11 {
            width: 208px;
            height: 128px;
        }
        .auto-style12 {
            width: 226px;
        }
        .auto-style13 {
            width: 226px;
            height: 118px;
        }
        .auto-style14 {
            width: 226px;
            height: 6px;
        }
        .auto-style15 {
            width: 226px;
            height: 128px;
        }
        .auto-style16 {
            margin-top: 0px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style5">
                <tr>
                    <td class="auto-style12">
                        <asp:Label ID="BookNamelbl" runat="server" Text="Label"></asp:Label> 
                        <asp:Label ID="WriterNamelbl" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Publisherlbl" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:Image ID="BookImg" runat="server" Height="131px" Width="162px" />
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="BookDetailtb" runat="server" Height="126px" Width="205px" TextMode="MultiLine"></asp:TextBox>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style14">
                        puan: <asp:Label ID="BookScorelbl" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="auto-style7">
                        okunma sayısı: <asp:Label ID="BookReadingCountlbl" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">
                        incelemeler: <asp:GridView ID="BookCommentsGV" runat="server" CssClass="auto-style16" Width="196px" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    Kullanıcı
                                                </td>
                                                <td>
                                                    Yorum/inceleme
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <%# Eval("UserName") %>
                                                </td>
                                                <td>
                                                    <%# Eval("UserComment") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        
                    </td>
                    <td class="auto-style11">
                        alıntılar: <asp:GridView ID="BookQuotesGV" runat="server" Height="134px" Width="203px" CssClass="auto-style16" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    Kulanıcı
                                                </td>
                                                <td>
                                                    Sayfa
                                                </td>
                                                <td>
                                                    Alıntı
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <%# Eval("UserName") %>
                                                </td>
                                                <td>
                                                    <%# Eval("PageNo") %>
                                                </td>
                                                <td>
                                                    <%# Eval("UserQuote") %>
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
        <div>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1">Kitap kaydı işlemleri için tıklayın...</asp:LinkButton>
        </div>
    </form>
</body>
</html>
