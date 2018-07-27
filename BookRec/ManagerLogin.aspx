<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagerLogin.aspx.cs" Inherits="BookRec.ManagerLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 34px;
        }
        .auto-style2 {
            height: 35px;
        }
        .auto-style3 {
            height: 54px;
        }
        .auto-style4 {
            margin-left: 51px;
        }
    </style>
</head>
<body style="height: 138px; width: 305px; margin-left: 244px; margin-top: 207px">
    <form id="form1" runat="server">
                <div>
            <div style="margin: 10px;">
                <table>
                    <tr class="satir">
                        <td class="auto-style1">
                            <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı: "></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="ManagerUsernameTextBox" runat="server" Width="150px" Height="28px"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label2" runat="server" Text="Şifre: "></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="ManagerPasswordTextBox" runat="server" Width="150px" TextMode="Password" Height="28px"></asp:TextBox>
                        </td>
                    </tr>
                        <tr>
                        <td class="auto-style3"></td>
                        <td class="auto-style3">
                            <asp:Button ID="ManagerLoginButton" runat="server" Text="Giriş yap" Width="75px" OnClick="ManagerLoginButton_Click" CssClass="auto-style4" Height="27px"/>
                        </td>
                        </tr>
                </table>
            </div>

    </form>
</body>
</html>
