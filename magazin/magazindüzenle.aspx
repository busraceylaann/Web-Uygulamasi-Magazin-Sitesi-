<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel.Master" AutoEventWireup="true" CodeBehind="magazindüzenle.aspx.cs" Inherits="magazin.magazindüzenle" ValidateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
select{display:block}button,select{text-transform:none}*,*::before,*::after{box-sizing:border-box}*,*::before,*::after{text-shadow:none !important;box-shadow:none !important}
        .auto-style1 {
            font-family: inherit;
            font-size: inherit;
            line-height: inherit;
            margin: 0;
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
     <table class="auto-style1">
            <tr>
                <td class="auto-style2" colspan="2">Magazin Arama</td>
                <td>
                <asp:DropDownList ID="dptür" runat="server">
                   <asp:ListItem>Yaşam</asp:ListItem>
                    <asp:ListItem>Moda</asp:ListItem>
                    <asp:ListItem>Dünya Magazini</asp:ListItem>
                    <asp:ListItem>Ünlü Dünyası</asp:ListItem>
                </asp:DropDownList>
                    <asp:Button ID="getir" runat="server" Text="Getir" OnClick="getir_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Magazin İd</td>
                <td class="auto-style2">:</td>
                <td>
                    <asp:TextBox ID="tbid" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2"> Başlık</td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:TextBox ID="tbad" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Magazin Türü</td>

                <td class="auto-style3">:</td>
                <td>
                <asp:DropDownList ID="magazintürü" runat="server">
                   <asp:ListItem>Yaşam</asp:ListItem>
                    <asp:ListItem>Moda</asp:ListItem>
                    <asp:ListItem>Dünya Magazini</asp:ListItem>
                    <asp:ListItem>Ünlü Dünyası</asp:ListItem>
                </asp:DropDownList>
                </td>
            </tr>
         <tr>
                <td class="auto-style2">Ana Resim </td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="109px" Width="138px" />
                    <br />
                <asp:FileUpload ID="FileUpload1" runat="server" Height="28px" Width="270px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="ekle" runat="server" Text="Ekle" OnClick="ekle_Click" />
                    <asp:Button ID="sil" runat="server" Text="Sil" OnClick="sil_Click" />
                    <asp:Button ID="düzelt" runat="server" Text="Düzelt" OnClick="düzelt_Click" />
                    <asp:Label ID="lbuyarı" runat="server" Font-Bold="True" Text="Lütfen Tüm Kısımları Doldurunuz" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:GridView ID="GridView1" runat="server" CellPadding="2" ForeColor="Black" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Font-Bold="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="magazinad" HeaderText="Magazin Adı" />
                            <asp:BoundField DataField="magazintarih" HeaderText="Tarih" />
                            <asp:BoundField DataField="magazintür" HeaderText="Türü" />
                            <asp:BoundField DataField="üyekullanıcıad" HeaderText="Gönderen" />
                        </Columns>
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Magazin</td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:TextBox ID="icerik" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="kaydet" runat="server" OnClick="kaydet_Click" Text="Kaydet" Visible="False" />
                </td>
            </tr>
        </table>
</asp:Content>
