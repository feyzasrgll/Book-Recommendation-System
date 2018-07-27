<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookDefinitions.aspx.cs" Inherits="BookRec.BookDefinitions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="/css/menu.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>

    <title>Kitap Tanımları</title>
    <style type="text/css">
        .auto-style1 {
            width: 501px;
            height: 303px;
        }
        .auto-style3 {
            height: 52px;
        }
        .auto-style5 {
            height: 52px;
            width: 381px;
        }
        .auto-style6 {
            margin-left: 4px;
        }
        .auto-style7 {
            margin-left: 14px;
        }
        .auto-style8 {
            margin-left: 13px;
        }
        .auto-style9 {
            width: 381px;
            height: 257px;
        }
        .auto-style10 {
            height: 257px;
        }
        .auto-style11 {
            margin-top: 15px;
        }
        .auto-style12 {
            margin-left: 22px;
        }
        .auto-style13 {
            width: 158px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id='cssmenu'>
            <ul>
            <li class='active'><a href='/BookDefinitions.aspx'>Popüler Kitaplar</a></li>
            </ul>
        </div>
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style9">
                        <asp:Image ID="Image1" runat="server" Height="127px" Width="144px" />
                    </td>
                    <td class="auto-style10">
                        Kitap adı:<asp:TextBox ID="BookTextBox" runat="server" Width="142px" CssClass="auto-style8" Height="22px"></asp:TextBox>
                        Yayınevi:<asp:TextBox ID="PublisherTextBox" runat="server" Width="140px" CssClass="auto-style7" Height="23px"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:Label ID="Label1" runat="server" Text="Önce düzenlemek için kitap seçin." Visible="False"></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="167px" Width="128px" Visible="False">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">
                          Kitaba ait resim yükleyiniz.
                        <asp:FileUpload ID="FileUpload1" runat="server" Height="27px" Width="178px" />                        
                    </td>
                    <td class="auto-style3">
                        Kitap Detayları:
                        <asp:TextBox ID="BookDetailTextBox" runat="server" CssClass="auto-style6" Height="56px" TextMode="MultiLine"></asp:TextBox>
                    </td>

                </tr>
                </table>
        </div>
        <asp:Button ID="BookAddButton" runat="server" CssClass="auto-style11" OnClick="BookAddButton_Click" Text="Ekle" Width="59px" />
        <asp:Button ID="EditButton" runat="server" Text="Düzenle" CssClass="auto-style12" OnClick="EditButton_Click" Width="63px" />
        <asp:Button ID="SaveButton" runat="server" Text="Kaydet" Width="52px" Visible="False" />
    </form>
</body>
</html>
