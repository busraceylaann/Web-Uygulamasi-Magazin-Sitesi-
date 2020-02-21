<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfamaster.Master" AutoEventWireup="true" CodeBehind="uyekayit.aspx.cs" Inherits="magazin.uyekayit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 85%;
        height: 424px;
    }

        .auto-style2 {
            width: 229px;
        }

        .auto-style3 {
            width: 219px;
        }
    .auto-style4 {
        width: 320px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="home-about-area section-gap">
        <div class="container">
            <div class="ptb-0">
                <a class="mt-10" href="anasayfa.aspx"><i class="fa fa-home"></i><b>ANASAYFA</b></a>
                <a class="mt-10 color-ash" href="#"><i class="mlr-10 ion-chevron-right"></i><b> > Üye Kayıt</b></a>

            </div>
            <div class="row align-items-center">
                <div class="col-lg-6 home-about-left">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label1" runat="server" Text="Ad" Font-Bold="True" Font-Size="10pt"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="tbad" runat="server" Height="23px" Width="157px" BorderColor="#000099"></asp:TextBox>
                            </td>
                            <td class="auto-style4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label2" runat="server" Text="Soyad" Font-Bold="True" Font-Size="10pt"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="tbsoyad" runat="server" Height="23px" Width="157px" BorderColor="#000099"></asp:TextBox>
                            </td>
                            <td class="auto-style4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label3" runat="server" Text="Tel" Font-Bold="True" Font-Size="10pt"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="tbtel" runat="server" Height="23px" Width="157px" BorderColor="#000099"></asp:TextBox>
                            </td>
                            <td class="auto-style4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label4" runat="server" Text="Kullanıcı Ad" Font-Bold="True" Font-Size="10pt"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="tbkul" runat="server" Height="23px" Width="157px" BorderColor="#000099"></asp:TextBox>
                            </td>
                            <td class="auto-style4">
                                <asp:Label ID="lbkul" runat="server" Font-Bold="True" Font-Size="10pt" Text="Kullanıcı Adı Kullanılmaktadır" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label5" runat="server" Text="Şifre" Font-Bold="True" Font-Size="10pt"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="tbsifre" runat="server" Height="23px" Width="157px" BorderColor="#000099"></asp:TextBox>
                            </td>
                            <td class="auto-style4">
                                <asp:Label ID="lbsif" runat="server" Font-Bold="True" Font-Size="10pt" Text="Şifre 4 karakterden Büyük olmalıdır" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style4">
                                <asp:Button ID="btkayit" runat="server" Height="39px" OnClick="btkayit_Click" Text="Kayıt Ol" Width="120px" BorderColor="#000099" Font-Bold="True" Font-Size="10pt" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
