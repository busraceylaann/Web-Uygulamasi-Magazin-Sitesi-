<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfamaster.Master" AutoEventWireup="true" CodeBehind="duyurugoster.aspx.cs" Inherits="magazin.duyurugöster" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 1510px;
            height: 127px;
        }
        .auto-style2 {
            width: 2228px;
        }
        .auto-style3 {
            height: 131px;
        }
        .auto-style4 {
            width: 2228px;
            height: 41px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="auto-style3">
        <table class="auto-style1">
            <tr>
                <td style="background-color: #ff0000; color: #FFFFFF; font-size: x-large; border-style: outset; border-color: #800000" class="auto-style4">
                   <%Response.Write(tutbaslik); %>

                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <%Response.Write(tuticerik); %>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
