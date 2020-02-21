<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel.Master" AutoEventWireup="true" CodeBehind="duyuru.aspx.cs" Inherits="magazin.duyuru" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 131px;
        }
        .auto-style3 {
            width: 8px;
        }

        .auto-style4 {
            width: 131px;
            height: 62px;
        }
        .auto-style5 {
            width: 8px;
            height: 62px;
        }
        .auto-style6 {
            height: 62px;
        }

        .auto-style7 {
            margin-right: 0;
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
    <div>

        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Duyuru Başlığı</td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:TextBox ID="baslik" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Duyuru İçeriği</td>
                <td class="auto-style3">:</td>
                <td>
                    <asp:TextBox ID="icerik" runat="server" TextMode="MultiLine" Width="901px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Yayınlansın mı</td>
                <td class="auto-style5">:</td>
                <td class="auto-style6">
                    <asp:CheckBox ID="cbyayinlansin" runat="server" Text="YAYINLANSIN" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">ID</td>
                <td class="auto-style3">:</td>
                <td>
&nbsp;
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="tbid" runat="server" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="ekle" runat="server" OnClick="ekle_Click" Text="Ekle" />
                    <asp:Button ID="sil" runat="server" OnClick="sil_Click1" Text="Sil" />
                    <asp:Button ID="düzelt" runat="server" OnClick="düzelt_Click" Text="Düzelt" />
                    <asp:Button ID="kaydet" runat="server" Height="29px" OnClick="kaydet_Click" Text="Kaydet" />
&nbsp;
                    <asp:Label ID="lbuyarı" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="81px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="350px" CssClass="auto-style7" DataKeyNames="duyuruid" OnPageIndexChanging="GridView1_PageIndexChanging" >
                        
                        <AlternatingRowStyle BackColor="White" />
                        
                        <Columns>
                            
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="baslik" HeaderText="Başlık" />
                            <asp:BoundField DataField="aciklama" HeaderText="İçerik" Visible="False" />
                            <asp:BoundField DataField="yayinda" HeaderText="Yayınlanma Durumu" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
