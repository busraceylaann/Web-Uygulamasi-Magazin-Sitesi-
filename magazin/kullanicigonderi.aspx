<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfamaster.Master" AutoEventWireup="true" CodeBehind="kullanicigonderi.aspx.cs" Inherits="magazin.kullanicigonderi" ValidateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 
        {
            width:100%;
        }
        .auto-style2 {
            width: 129px;
        }
        .auto-style3 {
            width: 12px;
        }
        .auto-style4 {
            width: 129px;
            height: 18px;
        }
        .auto-style5 {
            width: 12px;
            height: 18px;
        }
        .auto-style6 {
            height: 18px;
        }
        .auto-style7 {
            width: 129px;
            height: 41px;
        }
        .auto-style8 {
            width: 12px;
            height: 41px;
        }
        .auto-style9 {
            height: 41px;
        }
        .auto-style10 {
            width: 126px;
            height: 41px;
        }
    </style>
      <script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            var editor = CKEDITOR.replace('<%=icerik.ClientID%>');
            CKFinder.setupCKEditor(editor, '../ckfinder');
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="ptb-0">
                <a class="mt-10" href="anasayfa.aspx"><i class="fa fa-home"></i><b>ANASAYFA</b></a>
                <a class="mt-10 color-ash" href="#"><i class="mlr-10 ion-chevron-right"></i><b> > Sizden Gelenler</b></a>

            </div>
    <table class="auto-style1">
        <tr>
            <td class="auto-style4">Magazin Türü</td>
            <td class="auto-style5">:</td>
            <td class="auto-style6" colspan="3">
                <asp:DropDownList ID="DropDownList1" runat="server">
                     <asp:ListItem>Yaşam</asp:ListItem>
                    <asp:ListItem>Moda</asp:ListItem>
                    <asp:ListItem>Dünya Magazini</asp:ListItem>
                    <asp:ListItem>Ünlü Dünyası</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Magazin Adı</td>
            <td class="auto-style3">:</td>
            <td colspan="3">
                <asp:TextBox ID="tbadı" runat="server" Height="16px" Width="156px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Resim</td>
            <td class="auto-style3">:</td>
            <td colspan="3">
                <asp:FileUpload ID="FileUpload1" runat="server" Height="28px" Width="270px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Magazin İçerik</td>
            <td class="auto-style3">:</td>
            <td colspan="3">
                <asp:TextBox ID="icerik" runat="server" Height="16px" TextMode="MultiLine" Width="156px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td class="auto-style10">
                <asp:Button ID="kaydet" runat="server" Font-Bold="True" Font-Size="10pt" Height="43px" OnClick="kaydet_Click" Text="Kaydet" Width="113px" />
            </td>
            <td class="auto-style9">
                <asp:Button ID="iptal" runat="server" Font-Bold="True" Font-Size="10pt" Height="43px" OnClick="iptal_Click" Text="İptal" Width="113px" />
            </td>
            <td class="auto-style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td colspan="3">&nbsp;</td>
        </tr>
    </table>
     
</asp:Content>
