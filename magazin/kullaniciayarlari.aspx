<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel.Master" AutoEventWireup="true" CodeBehind="kullaniciayarlari.aspx.cs" Inherits="magazin.kullaniciayarlari" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
        <tr>
            <td class="auto-style2">Kullanıcı Adı</td>
            <td class="auto-style2">:</td>
            <td class="auto-style2">
                <asp:TextBox ID="tbara" runat="server" OnTextChanged="tbad0_TextChanged"></asp:TextBox>
                <asp:Button ID="ara" runat="server" OnClick="ara_Click" Text="Arama" />
                <asp:Button ID="temizle" runat="server" OnClick="temizle_Click" Text="Temizle" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Kullanıcı Ad</td>
            <td class="auto-style2">:</td>
            <td class="auto-style2">
                <asp:TextBox ID="tbad" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Kullanıcı Rütbe</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:TextBox ID="tbrütbe" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">Yeni Rütbesi</td>
            <td class="auto-style3">:</td>
            <td>
                <asp:DropDownList ID="dprütbe" runat="server" Width="121px">
                    <asp:ListItem>Admin</asp:ListItem>
                    <asp:ListItem>Üye</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:Button ID="kaydet" runat="server" OnClick="kaydet_Click" Text="Kaydet" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Font-Bold="False">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="üyekullanıcıad" HeaderText="Kullanıcı Adı" />
                        <asp:BoundField DataField="üyead" HeaderText="Ad" />
                        <asp:BoundField DataField="üyesoyad" HeaderText="Soyad" />
                        <asp:BoundField DataField="üyetelefon" HeaderText="Telefon" />
                        <asp:BoundField DataField="üyerütbe" HeaderText="Rütbe" />
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
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
</asp:Content>
