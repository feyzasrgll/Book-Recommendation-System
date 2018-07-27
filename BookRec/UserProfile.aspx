<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="BookRec.UserDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 110px;
        }
        .auto-style2 {
            width: 263px;
        }
        .auto-style3 {
            height: 110px;
            width: 263px;
        }
        .auto-style4 {
            width: 263px;
            height: 21px;
        }
        .auto-style5 {
            margin-top: 11px;
        }
        .auto-style6 {
            margin-top: 18px;
        }
        .auto-style7 {
            margin-left: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="UserNamelbl" runat="server" Text="Label" ForeColor="DeepSkyBlue"></asp:Label> &nbsp;&nbsp;kişisinin profilini görüntülüyorsunuz.
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Image ID="UserImg" runat="server" Height="143px" Width="216px" />
                    </td>
                    <td class="auto-style1">
                         <asp:Label ID="NameSurnamelbl" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="SendMessageButton" runat="server" Text="Mesaj Gönder" OnClick="SendMessageButton_Click" />
                    </td>
                    <td>
                        Kullanıcıya ait kitap işlemleri:
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="MessageEventlbl" runat="server" Text="Konu:" Visible="False"></asp:Label>
                        <br />
                        <asp:TextBox ID="EventTextBox" runat="server" Height="28px" CssClass="auto-style5" Visible="False"></asp:TextBox>
                        <br />
                        <asp:Label ID="Messagelbl" runat="server" Text="Mesaj:" Visible="False"></asp:Label>
                        <br />
                        <asp:TextBox ID="MessageTextBox" runat="server" CssClass="auto-style6" Height="36px" TextMode="MultiLine" Visible="False"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Button ID="SendButton" runat="server" CssClass="auto-style7" OnClick="SendButton_Click" Text="Gönder" Visible="False" Width="80px" />
                    </td>
                    <td>
                      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="193px" Width="309px">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <table>
                                        <tr>
                                            <td>
                                                Kitap
                                            </td>
                                            <td>
                                                Puan
                                            </td>
                                            <td>
                                                Sayfa
                                            </td>
                                            <td>
                                                Alıntı
                                            </td>
                                            <td>
                                                İnceleme
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
                                            <td>
                                                <%# Eval("BookScore") %>
                                            </td>
                                            <td>
                                                <%# Eval("PageNo") %>
                                            </td>
                                            <td>
                                                <%# Eval("UserQuote") %>
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
                    <td>

                    </td>
                </tr>
                
                </table>
        </div>
 
    </form>
</body>
</html>
