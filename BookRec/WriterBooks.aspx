<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WriterBooks.aspx.cs" Inherits="BookRec.WriterDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="WriterNameSurnamelbl" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Writerdoblbl" runat="server" Text="Label"></asp:Label> -
                        <asp:Label ID="Writerdodlbl" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
            </table>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <table>
                                <tr>
                                    <td>
                                        Yazarın Kitapları
                                    </td>
                                    <td>
                                        kitap İçerik
                                    </td>
                                    <td>
                                        Yayınevi
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("BookId") %>' OnClick="LinkButton1_Click1"><%# Eval("BookName") %></asp:LinkButton>
                                    </td>
                                    <td>
                                        <%# Eval("BookDetails") %>
                                    </td>
                                    <td>
                                        <%# Eval("BookPublisher") %>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
