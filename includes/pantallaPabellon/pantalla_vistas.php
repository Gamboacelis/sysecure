<?php
session_start();
include_once '../../includes/generales.php';
$clGeneral = new general();
date_default_timezone_set('America/Bogota');
$codigoCentro = $_SESSION["usu_centro_cod"].'-'.$_SESSION["usu_pabellon_cod"];
$centro = $_SESSION["usu_centro_descrip"];
$nomPabellon = $clGeneral->obtenerPabellon($_SESSION["usu_pabellon_cod"]);
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
                            <h2>  Información General .:. <?php echo $centro;?> </h2>
                        </header>
                        <div>
                            <div class="widget-body">
                                <div class="row">
                                    <form id="wizard-1" novalidate="novalidate">
                                        <div id="bootstrap-wizard-1" class="col-sm-12">

                                            <div class="tab-content">
                                                <div class="tab-pane active" id="tab1" style="text-align: center;">
                                                    <h3><strong>Pabellón </strong> <span id="nombrePabellon<?php echo $codigoCentro; ?>"></span></h3>
                                                    <h2><strong><span id="horarioPabellon<?php echo $codigoCentro; ?>"></span></strong> </h2>
                                                    <p class="text-primary"> Por favor atender a la Visita tipo: <span class="text-success"><span id="tipoHorario<?php echo $codigoCentro; ?>"></span></span></p>
                                                    <div class="row">
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <div class="fotoPabellon">
                                                                    <span><p class="text-danger"><strong>PPL</strong></p></span>
                                                                    <img id="imagenPpl<?php echo $codigoCentro; ?>" src="../../img/avatars/male.png" width="150px">
                                                                    <span><p id="nombrePPl<?php echo $codigoCentro; ?>"></p></span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6">
                                                            <div class="form-group">
                                                                <div class="fotoPabellon">
                                                                    <span><p class="text-danger"><strong>Visitante</strong></p></span>
                                                                    <img id="imagenVisitante<?php echo $codigoCentro; ?>" src="../../img/avatars/male.png" width="150px">
                                                                   <span><p id="nombreVisitante<?php echo $codigoCentro; ?>"></p></span>
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
        <script src="../../js/fancywebsocket.js"></script>
    </body>
</html>
