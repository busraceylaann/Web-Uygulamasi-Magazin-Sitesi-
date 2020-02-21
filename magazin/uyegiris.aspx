<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfamaster.Master" AutoEventWireup="true" CodeBehind="uyegiris.aspx.cs" Inherits="magazin.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            margin-left: 150px;
            margin-top: 50px;
            margin-bottom: 50px;
        height: 162px;
    }

        .auto-style2 {
            width: 260px;
        }

        .auto-style5 {
            width: 260px;
            height: 48px;
        }

        .auto-style6 {
            height: 48px;
        }

        .auto-style7 {
        width: 260px;
        height: 46px;
    }
    .auto-style8 {
        height: 46px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="home-about-area section-gap">
        <div class="container">
            <div class="ptb-0">
                <a class="mt-10" href="anasayfa.aspx"><i class="fa fa-home"></i><b>ANASAYFA</b></a>
                <a class="mt-10 color-ash" href="#"><i class="mlr-10 ion-chevron-right"></i><b> > Üye Giriş</b></a>

            </div>
            <div class="row align-items-center">
                <div class="col-lg-6 home-about-left">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style5">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="10pt" Text="Kullanıcı Ad :"></asp:Label>
                            </td>
                            <td class="auto-style6">
                                <asp:TextBox ID="tbkul" runat="server" BorderColor="Black" Height="29px" Width="175px"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="10pt" Text="Kullanıcı Adı Veya Şifre Yanlış girilmiştir" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7">
                                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="10pt" Text="Şifre :"></asp:Label>
                            </td>
                            <td class="auto-style8">
                                <asp:TextBox ID="tbsifre" runat="server" BorderColor="Black" Height="29px" Width="176px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td>&nbsp;<asp:Button ID="btgiris" runat="server" Font-Bold="True" Font-Size="10pt" Height="45px" Text="Giriş" Width="128px" OnClick="btgiris_Click" />
                                &nbsp;</td>
                        </tr>
                    </table>
                </div>     
            </div>
        </div>
    </section>
</asp:Content>
