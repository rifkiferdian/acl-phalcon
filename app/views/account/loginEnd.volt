<section class="content">

    <div class="login-box">
      <div class="login-logo">
        <a href="../../index2.html"><b>SIAKAD </b>STIE</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg" style="    color: #605CA8;"><span style="color: red;">Session</span> Habis Silahkan Login Kembali..!</p>

        <form action="{{ url('account/loginProsesAgain') }}" method="post">
          <div class="form-group has-feedback">
            <input type="text" name="uid" class="form-control" placeholder="Uid">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" name="passwd" class="form-control" placeholder="Password">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-4">
               <div class="form-group form-horizontal">
	                <div class="row">
	                  <label class="col-sm-2 control-label"></label>
	                  <div class="col-sm-9" >
	                    <img id="captcha" width="100" src="http://um.ugm.ac.id/admisi/index.php/akun/auth/captcha/" alt="captcha" />
	                  </div>
	                </div>
	            </div>
            </div>
            <div class="col-xs-8">
              <div class="form-group form-horizontal">
                <div class="row">
                  <label class="col-sm-3 control-label"> Captcha</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" name="captcha" data-target="captcha">
                  </div>
                </div>
            </div><!-- /.col -->
          </div>
          </div>

          <div class="row">
            <div class="col-xs-8">
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
            </div><!-- /.col -->
          </div>
        </form>

      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->
</section>


