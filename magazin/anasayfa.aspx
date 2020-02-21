<%@ Page Title="" Language="C#" MasterPageFile="~/anasayfamaster.Master" AutoEventWireup="true" CodeBehind="anasayfa.aspx.cs" Inherits="magazin.WebForm2" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            width: 86%;
            max-width: 1140px;
            min-width: 992px;
            height: 2509px;
            margin-left: auto;
            margin-right: auto;
            padding-left: 15px;
            padding-right: 15px;
        }
        .auto-style2 {
            left: 0px;
            top: 0px;
            width: 1313px;
            height: 1242px;
        }
        .auto-style3 {
            left: 0px;
            top: 0px;
            width: 1316px;
            height: 1908px;
        }
        .auto-style4 {
            left: 0px;
            top: 0px;
            width: 1313px;
            height: 647px;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- ##### Hero Area Start ##### -->
    <div class="hero-area">
        <div class="container">
            <div class="row align-items-center">
                <div>
                   <asp:Panel ID="Panel1" runat="server" Height="200px" Width="1200px" ForeColor="White" Font-Bold="true" Font-Italic="true">

            <marquee align="middle" scrollamount="2" width="100%" direction="up" scrolldelay="10" style="height:160px">

            <asp:Repeater ID="Repeater1" runat="server">

                <ItemTemplate>
                    <a id="a1" href='<%#Eval("duyuruid","~/duyurugoster.aspx?duyuruid={0}")%>' runat="server">
                        <p style="text-align:center"><%#Eval("baslik")%> </p>
                    </a>
                </ItemTemplate>

            </asp:Repeater>
                </marquee>
        </asp:Panel>
                   
                </div>

               
            </div>
        </div>
    </div>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Featured Post Area Start ##### -->
    <div class="featured-post-area">
        <div class="auto-style1">
            <div class="row">
                <div class="auto-style3">
                    <div class="row">

                        <!-- Single Featured Post -->
                        <div class="auto-style4">
                            <div class="single-blog-post featured-post" style="left: 0px; top: 0px; width: 1312px; height: 644px">
                                <div class="post-thumb">
                                    <asp:Image ID="Image1" runat="server" width="627px" Height="475px"/>
                                </div>
                                <div class="post-data">
                                    <a href="#" class="post-catagory"> <i class="mr-5 font-12 ion-clock"></i><h5> <%Response.Write(mt); %></h5></a>
                                    <a href="#" class="post-title">
                                        <h6><%Response.Write(mad); %></h6>
                                    </a>
                                   
                                </div>
                            </div>
                        </div>

                        <div class="auto-style2">
                            <!-- Single Featured Post -->
                            <div class="single-blog-post featured-post-2">
                                <div class="post-thumb">
                                    <asp:Image ID="Image2" runat="server" width="659px" Height="475px"/>
                                </div>
                                <div class="post-data">
                                    <a href="#" class="post-catagory"><i class="mr-5 font-12 ion-clock"></i><h5> <%Response.Write(mt1); %></h5></a>                                   
                                        <a href="#" class="post-title">
                                            <h6><%Response.Write(mad1); %></h6>
                                        </a>
                                        <!-- Post Like & Post Comment -->
                                       
                                 
                                </div>
                            </div>

                            <!-- Single Featured Post -->
                            <div class="single-blog-post featured-post-2" style="left: 0px; top: 0px; width: 1302px; height: 597px">
                                <div class="post-thumb" style="width: 1306px">
                                    <asp:Image ID="Image3" runat="server" width="692px" Height="475px"/>
                                </div>
                                <div class="post-data">
                                    <a href="#" class="post-catagory"><i class="mr-5 font-12 ion-clock"></i><h5> <%Response.Write(mt2); %></h5></a>
                                    <div class="post-meta">
                                        <a href="#" class="post-title">
                                            <h6><%Response.Write(mad2); %></h6>
                                        </a>
                                        <!-- Post Like & Post Comment -->
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>      
                  <div class="single-blog-post featured-post-2" style="left: 0px; top: 0px; width: 1293px">
                                <div class="post-thumb">
                                    <asp:Image ID="Image4" runat="server" width="665px" Height="475px"/>
                                </div>
                                <div class="post-data">
                                    <a href="#" class="post-catagory"><i class="mr-5 font-12 ion-clock"></i><h5> <%Response.Write(mt3); %></h5></a>
                                    <div class="post-meta">
                                        <a href="#" class="post-title">
                                            <h6><%Response.Write(mad3); %></h6>
                                        </a>
                                        <!-- Post Like & Post Comment -->
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>      
                  
                                       
                                        
   
   

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">

        <!-- Main Footer Area -->
        <div class="main-footer-area">
            <div class="container">
                <div class="row">

                    <!-- Footer Widget Area -->
                    <div class="col-12 col-sm-6 col-lg-4">
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
                                    <asp:Label ID="lbonline" runat="server">Toplam Ziyaret =</asp:Label>
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lbziyaret" runat="server">Online Kullanıcı =</asp:Label>
                                    
                                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                                    
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
