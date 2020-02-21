<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel.Master" AutoEventWireup="true" CodeBehind="adminanasayfa.aspx.cs" Inherits="magazin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Page Head -->
    <h2>Hoşgeldin Yönetici</h2>
    <p id="page-intro">
        <asp:Label ID="Label1" runat="server" Text="*Yetkiniz O Sayfaya Erişememektedir!" Visible="False" Font-Bold="True" ForeColor="#FF3300"></asp:Label>
    </p>

    <ul class="shortcut-buttons-set">

        <li>
            <asp:LinkButton ID="lnbtkul" runat="server" OnClick="lnbtkul_Click" Text="Kullanıcı Yönet ">
            </asp:LinkButton><a class="shortcut-button"><span>
                <img src="admin/images/icons/pencil_48.png" alt="icon" />
                <br />

            </span></a></li>

        <li>
            <asp:LinkButton ID="lnbtsayfa" runat="server" OnClick="lnbtsayfa_Click" Text="Sayfa Menü"></asp:LinkButton><a  class="shortcut-button"><span>
                <img  src="admin/images/icons/paper_content_pencil_48.png" alt="icon" /><br />

            </span></a></li>

        <li>Magazin  Onayla<a class="shortcut-button" href="magazinonay.aspx"><span>
            <img src="admin/images/icons/image_add_48.png" alt="icon" /><br />
            
        </span></a></li>

        <li>Magazin Menü<a class="shortcut-button" href="magazindüzenle.aspx"><span>
            <img src="admin/images/icons/clock_48.png" alt="icon" /><br />
            
        </span></a></li>

        
        <li>Duyuru Menü<a class="shortcut-button" href="duyuru.aspx"><span>
            <img src="admin/images/icons/paper_content_pencil_48.png" alt="icon" /><br />
            
        </span></a></li>
         <li>Galeri Menü<a class="shortcut-button" href="galerieditörü.aspx"><span>
            <img src="admin/images/icons/image_add_48.png" alt="icon" /><br />
            
        </span></a></li>
        
        </ul>
   
    <!-- End .shortcut-buttons-set -->

    <div class="clear"></div>
    <!-- End .clear -->
        <div class="content-box-header">

            <h3>İçerik </h3>
        </div>
        <div>

            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" Font-Bold="False" Width="1213px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="magazinad" HeaderText="Magazin Adı" />
                    <asp:BoundField DataField="üyekullanıcıad" HeaderText="Gönderen Üye" />
                    <asp:BoundField DataField="magazintür" HeaderText="Türü" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>

        </div>
</asp:Content>
