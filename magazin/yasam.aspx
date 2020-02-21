<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfamaster.Master" AutoEventWireup="true" CodeBehind="yasam.aspx.cs" Inherits="magazin.yasam" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
         .auto-style1 {
            width: 1497px;
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
            width: 751px;
            }
        .auto-style14 {
            height: 154px;
        }
        .auto-style16 {
            height: 55px;
            width: 751px;
        }
        .auto-style17 {
            width: 639px;
        }
        .auto-style18 {
            height: 55px;
            width: 639px;
        }
        .auto-style19 {
            height: 46px;
        }
        .auto-style20 {
            left: 0px;
            top: 1px;
            height: 220px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <div>
            <div class="ptb-0">
                <a class="mt-10" href="anasayfa.aspx"><i class="fa fa-home"></i><b>ANASAYFA</b></a>
                <a class="mt-10 color-ash" href="#"><i class="mlr-10 ion-chevron-right"></i><b> > Yaşam</b></a>

            </div>

            <div>
              <table class="auto-style1">
            <tr>
                <td class="auto-style14" colspan="2">
                    :<asp:Image ID="Image1" runat="server" Height="431px" Width="743px" />
                    <br />
                    </td>
                <td rowspan="2" class="auto-style17">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" GridLines="Horizontal" AllowPaging="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" Height="118px" OnPageIndexChanging="GridView1_PageIndexChanging" Width="539px" PageSize="15" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="magazinad" HeaderText="Burç Adı" />
                        <asp:BoundField DataField="magazintarih" HeaderText="Son Tarih " />
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <SortedAscendingCellStyle BackColor="#F4F4FD" />
                    <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                    <SortedDescendingCellStyle BackColor="#D8D8F0" />
                    <SortedDescendingHeaderStyle BackColor="#3E3277" />
                </asp:GridView>

                </td>
            </tr>
            <tr>
                <td class="auto-style19" colspan="2">
                    <asp:Label ID="Label3" runat="server" ForeColor="Black" Text="Son Yazı Tarihi  :    "></asp:Label>
                    <asp:Label ID="lbtarih" runat="server" ForeColor="Black"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="Label2" runat="server" ForeColor="Black" Text="Burç Adı    :"></asp:Label>
                </td>
                <td class="auto-style16"><%Response.Write(magazinad); %>
                    </td>
                <td class="auto-style18" rowspan="2">
                </td>
            </tr>
            <tr>
                <td class="auto-style11">
                    <asp:Label ID="Label4" runat="server" ForeColor="Black" Text="Burç Yorumu    :"></asp:Label>
                </td>
                <td class="auto-style16"><%Response.Write(ictemiz2); %>
                    </td>
            </tr>
            <tr>
                <td class="auto-style12">
                    <br />
                    :</td>
                <td class="auto-style13"></td>
                <td class="auto-style17">
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