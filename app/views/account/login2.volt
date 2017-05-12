<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=1">
    <title>SIA</title>
    <!-- Style CSS -->
    {#<link rel="stylesheet" href="css/style.css">#}
    {{ stylesheet_link("css/style.css") }}
    <!-- bootstrap -->
    {#<link rel="stylesheet" href="css/bootstrap/dist/css/bootstrap.min.css">#}
    {{ stylesheet_link("bootstrap/css/bootstrap.min.css") }}
    <!-- font-awesome -->
    {#<link rel="stylesheet" href="css/font-awesome.min.css">#}
    {{ stylesheet_link("font-awesome/css/font-awesome.min.css") }}
  </head>
  <body>

<div class="container-fluid">
    <!-- PERGURUAN TINGGI -->
    <div class="row" style="    padding: 12px 10px; background-color: #F2F1EF">
       <div class="col-md-12">
        <div class="xv" style="margin: 0 auto; ">
            <img src="/sia/public/img/logo.png" style="float:left;height: 75px; margin-left: 53px;">
            <div class="asdasd" style="padding: 8px 137px;">
               <h4 style="font-family: 'century gothic';text-transform: uppercase;"><b>Sekolah Tinggi Ilmu Kesehatan Kendal</b></h4>
            <p>Jl. Laut No:31 Kendal, Kodepos 51311 Telp. (0294) 381343, Fax. (0294) 381834</p>
            </div>
        </div>
       </div>
    </div>

    <!-- BANNER -->
    <div class="row" style="background-color: #34495E;    height: 37px;">
      <div class="container-fluid">
        <h4 style="color:white;     font-family: 'century gothic';
        text-transform: uppercase; white; text-align: center;"><span class="glyphicon glyphicon-education" aria-hidden="true"></span>
     Sistem Informasi Akademik</h4>
      </div><!-- /.container-fluid -->
    </div>

    <!-- NEWS -->
    <div class="row" style="background-color: #34495E;    height: 37px;">
      <div class="container-fluid">
        <h5 style="color: white; text-align: center;">
     <marquee>News Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
     tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
     quis nostrud </marquee></h5>
      </div><!-- /.container-fluid -->
    </div>
</div>


 <?= $this->flashSession->output() ?>

<style type="text/css">
  .errorMessage{
        color: #a94442;
    background-color: #f2dede;
    border-color: #ebccd1;
        padding: 15px;
    margin-bottom: 20px;
    border: 1px solid transparent;
    border-radius: 4px;
     text-align: center;

  }
</style>




        <div class="container-fluid" style="background-color: #231F20">
          <div class="row">
<!--Slider -->
              <div class="col-xs-12 col-sm-12 col-md-9 slider">
                <section>
                    <div id="carousel-generic" class="carousel slide" data-ride="carousel">
    <!--Indicators -->
                      <ol class="carousel-indicators">
                        <li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-generic" data-slide-to="2"></li>
                        <li data-target="#carousel-generic" data-slide-to="3"></li>
                      </ol>

    <!--Wrapper for slides -->
                      <div class="carousel-inner">
                        <div class="item active">
                          <img src="https://smb.telkomuniversity.ac.id/lib/datamember/smbb/slider/Slideshow%20-%2020160406112329.jpg" height="300" alt="">
                        </div>

                        <div class="item">
                          <img src="https://smb.telkomuniversity.ac.id/lib/datamember/smbb/slider/Slideshow%20-%2020160406112405.jpg" height="300" alt="">
                        </div>
                      </div>

<!--Controls -->
                     <a class="left carousel-control" href="#carousel-generic" role="button" data-slide="prev">
                       <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                       <span class="sr-only">Previous</span>
                     </a>
                     <a class="right carousel-control" href="#carousel-generic" role="button" data-slide="next">
                       <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                       <span class="sr-only">Next</span>
                     </a>

                    </div>
                </section>
              </div>
<!--end Slider -->


<!--Aside  -->
            <aside>
                <div class="col-xs-12 col-sm-12 col-md-3" style="padding-top: 25px;">
                  <form class="login" action="{{ url('account/loginProses') }}" method="post" style="background-color: #34495E; color: white;">
                    <div class="panel" style="background:transparent;">
                      <div class="panel-heading" style="background-color: #34495E">
                        <h1 class="">Siakad Account</h1>
                        <i class="fa fa-sign-in" aria-hidden="true"></i>
                      </div>
                    </div>


                    <div class="form-group">
                      <div class="inner-addon left-addon">
                        <i class="glyphicon glyphicon-user"></i>
                        <label>Login</label>
                        <input type="text" class="form-control" name="uid" id="username" placeholder="UID">
                        </div>
                      </div>
                      <!--end form grup -->

                      <div class="form-group" style="padding-top: 0px;">
                        <div class="inner-addon right-addon">
                          <i class="fa fa-key" aria-hidden="true"></i>
                          <label>Password</label>
                          <input type="password" class="form-control" name="passwd" id="password"  placeholder="password">
                        </div>
                      </div>
                      <!--end form-group -->

                      <!--image capcha-->

                      <div class="form-group form-horizontal">
                        <div class="row">
                          <label class="col-sm-2 control-label"></label>
                          <div class="col-sm-9" >
                            <img id="captcha" width="100" src="http://um.ugm.ac.id/admisi/index.php/akun/auth/captcha/" alt="captcha" />
                          </div>
                          <div class="">
                            <a id="refresh" href="http://um.ugm.ac.id/admisi/index.php/akun/auth/captcha/">
                              <i class="fa fa-refresh"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                      <!--end image capcha-->

                      <!--capcha-->
                      <div class="form-group form-horizontal">
                        <div class="row">
                          <label class="col-sm-3 control-label" style="padding-left: 0px;"> Captcha</label>
                          <div class="col-sm-9">
                            <input type="text" class="form-control" name="captcha" data-target="captcha">
                          </div>

                        </div>

                      </div>
                      <!--end capcha-->

                      <div class="form-group">
                        <button type="submit" class="btn btn-primary pull-right">Login</button>
                      </div>

                    </form>
                      <!--end form-group -->

<!--end login  -->
                </div>
            </aside>
          </div>
<!--row-->
        </div>

<!-- TAP -->
        <div class="content">
          <div class="container">
              <!-- BEGIN Portlet PORTLET-->
              <div class="portlet">
                <div class="portlet-title">
                  <div class="caption caption-red">
                    <i class="glyphicon glyphicon-pushpin"></i>
                    <span class="caption-subject bold font-yellow-crusta uppercase">
                    Tabs </span>
                    <span class="caption-helper">more samples...</span>
                  </div>
                  <ul class="nav nav-tabs">
                    <li>
                      <a href="#portlet_tab3" data-toggle="tab">
                      Tab 3 </a>
                    </li>
                    <li>
                      <a href="#portlet_tab2" data-toggle="tab">
                      Tab 2 </a>
                    </li>
                    <li class="active">
                      <a href="#portlet_tab1" data-toggle="tab">
                      Tab 1 </a>
                    </li>
                  </ul>
                </div>
                <div class="portlet-body">
                  <div class="tab-content">
                    <div class="tab-pane active" id="portlet_tab1">
                      <h4>Tab 1 Content</h4>
                      <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>
                    </div>
                    <div class="tab-pane" id="portlet_tab2">
                      <h4>Tab 2 Content</h4>
                      <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>
                    </div>
                    <div class="tab-pane" id="portlet_tab3">
                      <h4>Tab 3 Content</h4>
                      <p>Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. consectetur purus sit amet fermentum. Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum.</p>
                      </div>
                  </div>
                </div>
              </div>
              <!-- END Portlet PORTLET-->
          </div>
        </div>

<!--Footer-->
        <footer>
          <div class="text-center">
            <p>Integrated Academic Information System - College of Health Scirences Kendal</p>
            <p style="font-weight:bold;">College of Health Sciences Kendal</p>
            <p>&copy; November 2016</p>
          </div>
        </footer>
<!--End Footer-->


<!--jQuery first -->
      {#<script src="css/jquery/dist/jquery.min.js"></script>#}
      {{ javascript_include("jquery/dist/jquery.min.js") }}
<!--JavaScript -->
      {#<script src="bootstrap/js/bootstrap.min.js"></script>#}
      {{ javascript_include("bootstrap/dist/js/bootstrap.min.js") }}

  </body>
</html>
