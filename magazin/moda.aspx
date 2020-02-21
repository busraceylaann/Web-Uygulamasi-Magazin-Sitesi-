<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfamaster.Master" AutoEventWireup="true" CodeBehind="moda.aspx.cs" Inherits="magazin.moda" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
         .auto-style1 {
            width: 1583px;
            height: 624px;
            margin-top: 41px;
        }
        .auto-style11 {
            height: 55px;
        }
        .auto-style12 {
            width: 231px;
            }
        .auto-style13 {
            width: 821px;
            }
        .auto-style14 {
            height: 154px;
        }
        .auto-style18 {
            height: 55px;
            width: 772px;
        }
        .auto-style20 {
            left: 0px;
            top: 1px;
            height: 220px;
        }
        .auto-style23 {
            width: 772px;
        }
        .auto-style24 {
            height: 55px;
            width: 821px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div>
            <div class="ptb-0">
                <a class="mt-10" href="anasayfa.aspx"><i class="fa fa-home"></i><b>ANASAYFA</b></a>
                <a class="mt-10 color-ash" href="#"><i class="mlr-10 ion-chevron-right"></i><b> > Moda</b></a>

            </div>

            <div>
              <table class="auto-style1">
            <tr>
                <td class="auto-style14" colspan="2">
                    :<asp:Image ID="Image1" runat="server" Height="441px" Width="774px" />

                    <br />
                    </td>
                <td rowspan="2" class="auto-style23">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" GridLines="None" AllowPaging="True" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" Height="118px" OnPageIndexChanging="GridView1_PageIndexChanging" Width="539px" PageSize="15" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellSpacing="1" CssClass="offset-sm-0">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="magazinad" HeaderText="Moda" />
                        <asp:BoundField DataField="magazintarih" HeaderText="Son Tarih " />
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label3" runat="server" ForeColor="Black" Text="Son Yazı Tarihi  :    "></asp:Label>
                    <asp:Label ID="lbtarih" runat="server" ForeColor="Black"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="Label2" runat="server" ForeColor="Black" Text="Moda    :"></asp:Label>
                </td>
                <td class="auto-style24"><%Response.Write(magazinad); %>
                    </td>
                <td class="auto-style18" rowspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="Label4" runat="server" ForeColor="Black" Text="Moda Yorumu    :"></asp:Label>
                </td>
                <td class="auto-style24"><%Response.Write(ictemiz); %>
                    </td>
            </tr>
            <tr>
                <td class="auto-style12">
                    <br />
                    :</td>
                <td class="auto-style13"></td>
                <td class="auto-style23">
                </td>
            </tr>
            </table>
            </div>
        </div>
    </section>
     <footer class="footer-area">

        <!-- Main Footer Area -->
        <div class="main-footer-area">
            <div class="container">
                <div class="row">

                    <!-- Footer Widget Area -->
                    <div class="auto-style20">
                        <div class="footer-widget-area mt-80">
                            <!-- Footer Logo -->
                            <div class="footer-logo">
                                <a href="index.html"><img src="img/core-img/logo.png" alt=""></a>
                            </div>
                            <!-- List -->
                            <ul class="list">
                                <li><a href="mailto:contact@youremail.com">civciv@youremail.com</a></li>
                                <li><a href="tel:+4352782883884">+ 0545 288 884</a></li>
                                
                            </ul>
                        </div>
                    </div>

                   
                    <div class="col-12 col-sm-4 col-lg-2">
                        <div class="footer-widget-area mt-80">
                            <!-- Title -->
                            <h4 class="widget-title">Site</h4>
                            <!-- List -->
                            <ul class="list">
                                 <li><a href="anasayfa.aspx">Anasayfa</a></li>
                                <li><a href="yasam.aspx">Yaşam</a></li>
                                <li><a href="moda.aspx">Moda</a></li>
                                <li><a href="galeri.aspx">Galeri</a></li>
                                <li><a href="dunyamagazini.aspx">Dünya Magazini</a></li>
                                <li><a href="unludunyasi.aspx">Ünlü Dünyası</a></li>
                                <li><a href="sayfalar.aspx">İletişim</a></li>      
                              
                            </ul>
                        </div>
                    </div>

                  
        <!-- Bottom Footer Area -->
        <div class="bottom-footer-area">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <!-- Copywrite -->
                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
 &copy;<script>document.write(new Date().getFullYear());</script> CivCİv |  <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        
                                </p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area Start ##### -->

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</asp:Content>