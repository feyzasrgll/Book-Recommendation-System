<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="BookRec.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100px;
            padding: 15px;
        }
        .auto-style2 {
            width: 10px;
            padding: 7px;
        }
        .myButton {
            background: orange;
            color: white;
            padding: 8px 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="margin: 10px;">
                <table>

                    <tr class="satir">

                    <td class="auto-style1">
                            <asp:Label ID="Label6" runat="server" Text="isim: "></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="NameTextBox" runat="server" Width="150px"></asp:TextBox>
                        </td>

                    </tr>

                    <tr>
                    <td class="auto-style1">
                            <asp:Label ID="Label7" runat="server" Text="Soyisim: "></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="SurnameTextBox" runat="server" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı: "></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="UsernameTextBox" runat="server" Width="150px"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label2" runat="server" Text="Şifre: "></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="PasswordTextBox" runat="server" Width="150px" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label3" runat="server" Text="Cinsiyet: "></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server"></asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label4" runat="server" Text="Doğum Tarihi: "></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:DropDownList ID="DayList" runat="server"></asp:DropDownList>
                            <asp:DropDownList ID="MonthList" runat="server"></asp:DropDownList>
                            <asp:DropDownList ID="YearList" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="Label5" runat="server" Text="Resim: "></asp:Label>
                        </td>
                        <td class="auto-style2">
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                        <td class="auto-style2">
                            <asp:Button ID="Button1" runat="server" Text="Kaydet" Width="212px" CssClass="myButton" OnClick="Button1_Click"/>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
