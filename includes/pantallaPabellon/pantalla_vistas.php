<?php
session_start();
include_once '../../includes/generales.php';
$clGeneral = new general();
//include_once PATH_PROD.SISTEM_NAME.'/includes/generales.php';
//$clGeneral = new general();
//include_once PATH_PROD.SISTEM_NAME.'/includes/conexiones/db_local.inc.php';
//$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$centro = isset($_GET['centro']) ? $_GET['centro'] : 'ninguno';
$pabellon = isset($_GET['pabellon']) ? $_GET['pabellon'] : 'ninguno';
$nomPabellon = $clGeneral->obtenerPabellon($pabellon);
$nombrePpl='CARLOS FLORES';
$nombreVisitante='OSWALDO NAVAS';
$tipoVisita='Familiar';
?>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <title> Sysecure .:. <?php echo $nomPabellon ?></title>
        <meta name="description" content="Instalador web de Sistema Sysecure">
        <meta name="author" content="Wie Solutions">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/demo.min.css">
        <!-- page related CSS -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/lockscreen.min.css">
        <!-- FAVICONS -->
        <link rel="shortcut icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="../../img/favicon/favicon.ico" type="image/x-icon">
        <!-- GOOGLE FONT -->
        <link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="../../img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="../../img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="../../img/splash/touch-icon-ipad-retina.png">
        <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <!-- Startup image for web apps -->
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="../../img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="../../img/splash/iphone.png" media="screen and (max-device-width: 320px)">
        <style>
            .widget-body{font-size: 2em;}
            .lockscreen {top: 0;margin-top: 0;}
            
        </style>
    </head>
    <body class="desktop-detected pace-done fixed-header fixed-navigation fixed-ribbon smart-style-3">
        <div id="Relogin-form" class="lockscreen animated flipInY" action="javascript:Relogin();" autocomplete="off">
            <div class="logo">
                <img src="../../img/logo/Logo.png" alt="Sysecure">
            </div>
            <div>
                <div>
                    <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false" data-widget-deletebutton="false">
                        <header>
                            <span class="widget-icon"> <i class="fa fa-check"></i> </span>
                            <h2>  Información General </h2>
                        </header>
                        <div>
                            <div class="widget-body">
                                <div class="row">
                                    <form id="wizard-1" novalidate="novalidate">
                                        <div id="bootstrap-wizard-1" class="col-sm-12">

                                            <div class="tab-content">
                                                <div class="tab-pane active" id="tab1" style="text-align: center;">
                                                    <h3><strong>Pabellón </strong> <?php echo $nomPabellon ?></h3>
                                                    <h2><strong><?php echo $nombrePpl?></strong> </h2>
                                                    <p class="text-primary"> Por favor atender a la Visita tipo: <span class="text-success"><?php echo $tipoVisita?></span></p>
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <div class="fotoPabellon">
                                                                    <span><p class="text-danger"><strong>PPL</strong></p></span>
                                                                    <img src="../../img/avatars/male.png" width="150px">
                                                                    <span><p><?php echo $nombrePpl?></p></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <div class="fotoPabellon">
                                                                    <span><p class="text-danger"><strong>Visitante</strong></p></span>
                                                                    <img src="../../img/avatars/male.png" width="150px">
                                                                   <span><p><?php echo $nombreVisitante?></p></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <p class="font-xs margin-top-5">
                Copyright WieSolutions 2014.
            </p>
        </div>
        <!--================================================== -->

        <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
        <script data-pace-options='{ "restartOnRequestAfter": true }' src="../../js/plantilla/plugin/pace/pace.min.js"></script>

        <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
        <script>
            if (!window.jQuery) {
                document.write('<script src="../../js/plantilla/libs/jquery-2.0.2.min.js"><\/script>');
            }
        </script>

        <script src="../../js/plantilla/libs/jquery-ui-1.10.3.min.js"></script>


        <!-- JS TOUCH : include this plugin for mobile drag / drop touch events
        <script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

        <!-- BOOTSTRAP JS -->
        <script src="../../js/plantilla/bootstrap/bootstrap.min.js"></script>

        <!-- CUSTOM NOTIFICATION -->
        <script src="../../js/plantilla/notification/SmartNotification.min.js"></script>

        <!-- JARVIS WIDGETS -->
        <script src="../../js/plantilla/smartwidgets/jarvis.widget.min.js"></script>

        <!-- EASY PIE CHARTS -->
        <script src="../../js/plantilla/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

        <!-- SPARKLINES -->
        <script src="../../js/plantilla/plugin/sparkline/jquery.sparkline.min.js"></script>

        <!-- JQUERY VALIDATE -->
        <script src="../../js/plantilla/plugin/jquery-validate/jquery.validate.min.js"></script>

        <!-- JQUERY VALIDATE MENSSAGE IN SPANISH -->
        <script src="../../js/plantilla/plugin/jquery-validate/jqueryvalidatemessage.min.js"></script>

        <!-- JQUERY MASKED INPUT -->
        <script src="../../js/plantilla/plugin/masked-input/jquery.maskedinput.min.js"></script>

        <!-- JQUERY SELECT2 INPUT -->
        <script src="../../js/plantilla/plugin/select2/select2.min.js"></script>

        <!-- JQUERY UI + Bootstrap Slider -->
        <script src="../../js/plantilla/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

        <!-- browser msie issue fix -->
        <script src="../../js/plantilla/plugin/msie-fix/jquery.mb.browser.min.js"></script>

        <!-- FastClick: For mobile devices -->
        <script src="../../js/plantilla/plugin/fastclick/fastclick.min.js"></script>

        <!-- Generador de MD5 -->
        <script src="../../js/plantilla/plugin/jquery-md5/jquery.md5.min.js"></script>

        <!-- SOAP JS -->
        <script src="../../js/plantilla/plugin/jquery-soap/jquery.soap.js"></script>

        <!-- XML2JSON JS -->
        <script src="../../js/plantilla/plugin/jquery-soap/jquery.xml2json.js"></script>
        <!-- MAIN APP JS FILE -->
        <script src="../../js/plantilla/app.min.js"></script>
        <!-- PAGE RELATED PLUGIN(S) -->
        <script src="../../js/plantilla/plugin/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="../../js/plantilla/plugin/fuelux/wizard/wizard.min.js"></script>
        <script src="../../js/pantallaPabellon.js"></script>
    </body>
</html>
