<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BookRec.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Giriş</title>
</head>
    <style>
        body
        {
                background-color: #cccccc;
        }

    </style>
<body>
    <form id="form1" runat="server">
        <div style="height: 273px; width: 308px; margin-left: 246px; margin-top: 141px">
            <asp:Label ID="Label1" runat="server" Text="Kullanıcı adı:"></asp:Label>
            <asp:TextBox ID="UserNameTextBox" runat="server" Height="31px" style="margin-left: 72px" Width="133px"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Şifre:"></asp:Label>
            <asp:TextBox ID="PasswordTextBox" runat="server" Height="35px" style="margin-left: 124px; margin-top: 4px" Width="132px"></asp:TextBox>
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="LoginButton" runat="server" Height="38px" OnClick="LoginButton_Click" style="margin-left: 83px" Text="Giriş Yap" Width="158px" />
            <br />
            <br />
            <asp:Button ID="SignUpButton" runat="server" Height="34px" OnClick="SignUpButton_Click1" style="margin-left: 86px; margin-top: 0px" Text="Kayıt Ol" Width="153px" />
        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">yönetici olarak giriş yapmak için tıklayın...</asp:LinkButton>
        </p>
    </form>
    <p>
        &nbsp;</p>
</body>
</html>
