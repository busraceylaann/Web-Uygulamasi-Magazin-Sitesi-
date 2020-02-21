<%@ Page Title="" Language="C#" MasterPageFile="~/adminpanel.Master" AutoEventWireup="true" CodeBehind="galerieditörü.aspx.cs" Inherits="magazin.galerieditörü" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            height: 175px;
            width: 43px;
        }

        .auto-style4 {
            width: 75px;
        }

        .auto-style5 {
            width: 52px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="plr-50 h-600x h-md-800x h-xs-1000x oflow-hidden">

            <table class="w-md-100">
                <tr>

                    <td class="auto-style5" rowspan="5">
                        <br />
                        <asp:Button ID="Button1" runat="server" Height="43px" Text="Geri" Width="79px" OnClick="Button1_Click" />
                    </td>
                    <td class="auto-style3" rowspan="4">
                        <asp:Image ID="Image1" runat="server" Height="542px" Width="644px" />


                        <br />


                    </td>
                    <td class="auto-style4" rowspan="5">
                        <asp:Button ID="Button2" runat="server" Height="43px" Text="İleri" Width="76px" OnClick="Button2_Click" />
                    </td>
                    <td class="auto-style4">
                        <asp:FileUpload ID="FileUpload1" runat="server" Height="28px" Width="275px" />
                        <br />
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btekle" runat="server" OnClick="btekle_Click" Text="Ekle" Height="24px" Width="80px" />
                        <asp:Button ID="btsil" runat="server" OnClick="btsil_Click" Text="Sil" Height="24px" Width="80px" />
                    </td>
                </tr>
                <tr>

                    <td class="auto-style4" colspan="2">
                        <asp:Label ID="lbuyarı" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>

                    <td class="auto-style4" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>

                    <td class="auto-style4" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">
                       
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick">
                        </asp:Timer>
                    </td>
                    <td class="auto-style4" colspan="2">
                        &nbsp;</td>
                </tr>
            </table>

        </div>
    
    
</asp:Content>
