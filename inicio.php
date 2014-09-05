<?php
session_start();
if ($_SESSION["autenticado"] == 'SI') {
    $titulo = '';
    $contenido = '';
    $usuario = '';
    
    $usuario = $_SESSION["usu_real_nombre"];
    $modulos = isset($_GET['modulo']) ? $_GET['modulo'] : 'ninguno';
    include_once("./includes/visitas.php");
    include_once("./includes/generales.php");
    $clGeneral = new general();
    $clGeneral->inicializaMenu();
    switch ($modulos) {
        case 'administrativo':
            $option = isset($_GET['op']) ? $_GET['op'] : 0;
            include_once("./includes/pabellones/pabellon_vistas.php");
            include_once("./includes/usuario/Usuarios_vistas.php");
            include_once("./includes/horarios/horarios_vistas.php");
            include_once("./includes/ppl/ppl_vistas.php");
            include_once("./includes/visitante/visitantes_vistas.php");

            switch ($option) {
                case 'horarios':
                    $titulo='Revisión de Horarios';
                    $activarMenu31='class="active"';
                    $contenido = frm_asignacionPabellones();
                    break;
                case 'pabellones':
                    $titulo='Revisión de Pabellones';
                    $activarMenu32='class="active"';
                    $contenido = reporte_pabellones();
                    break;
                case 'ppl':
                    $titulo='Revisión de Personas Privadas de Libertad';
                    $activarMenu33='class="active"';
                    $contenido = revisarPpl();
                    break;
                case 'usuarios':
                    $titulo='Revisión de Usuarios';
                    $activarMenu34='class="active"';
                    $contenido = revisarUsuarios();
                    break;
                case 'visitantes':
                    $titulo='Revisión de Visitantes';

                    $activarMenu35='class="active"';

                    $contenido = revisarVisitantes();
                    break;
                    
                
            }
            break;
        case 'controles':
            $option = isset($_GET['op']) ? $_GET['op'] : 0;
            switch ($option) {
                case 'acceso1':
                    include_once("./includes/controles/acceso1/acceso1_vistas.php");
                    $titulo='Revisión de Accesos Primer Nivel';
                    $activarMenu41='class="active"';
                    $contenido = revisarPpl();
                    break;
                case 'acceso2':
                    include_once("./includes/controles/acceso2/acceso2_vistas.php");
                    $titulo='Revisión de Accesos Segundo Nivel';
                    $activarMenu42='class="active"';
                    $contenido = frm_revisarAcceso2(); 
                    break;
                case 'acceso3':
                    include_once("./includes/controles/acceso3/acceso3_vistas.php");
                    $titulo='Revisión de Accesos Tercer Nivel';
                    $activarMenu43='class="active"';
                    $contenido = frm_revisarAcceso3();
                    break;
                case 'acceso4':
                    include_once("./includes/controles/acceso4/acceso4_vistas.php");
                    $titulo='Revisión de Accesos Cuarto Nivel';
                    $activarMenu44='class="active"';
                    $contenido = frm_revisarAcceso4();
                    break;
                case 'sanciones':
                    include_once("./includes/sanciones/sancion_vistas.php");

                    $titulo='Revisión de Visitantes sancionados';

                    $activarMenu45='class="active"';

                    $contenido = revisarSanciones();
                    break;    

                case 'traspaso':
                    include_once("./includes/traspaso/traspaso_vistas.php");

                    $titulo='Traspaso de PPL a otro pabellon';

                    $activarMenu46='class="active"';

                    $contenido = revisarPpl();
                    break;                    
            }
            break;
        default:
            $titulo = 'Reporte de Visitas';
            $activarMenu1='class="active"';
            $contenido = reporte_visitantes();
            break;
    }
    ?>
    <!DOCTYPE html>
    <html lang="es">
        <head>
            <meta charset="utf-8">
            <title> Sysecure </title>
            <meta name="description" content="Automatizacion y Control de Visitas a PPL">
            <meta name="author" content="iBlack Sistemas y Comunicaciones S.A.">
            <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
            <!-- Basic Styles -->
            <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
            <link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">
            <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
            <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
            <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">
            <!-- SmartAdmin RTL Support is under construction
                     This RTL CSS will be released in version 1.5
            <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->
            <link rel="stylesheet" type="text/css" media="screen" href="css/generales.css"> 
            <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
            <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">
            <!-- FAVICONS -->
            <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
            <link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">
            <!-- GOOGLE FONT -->
            <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
            <!-- Specifying a Webpage Icon for Web Clip 
                     Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
            <link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
            <link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
            <link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
            <link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">
            <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
            <meta name="apple-mobile-web-app-capable" content="yes">
            <meta name="apple-mobile-web-app-status-bar-style" content="black">
            <!-- Startup image for web apps -->
            <link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
            <link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
            <link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">
        </head>
        <body class="desktop-detected pace-done fixed-header fixed-navigation fixed-ribbon smart-style-3">
            <header id="header">
                <div id="logo-group">
                    <span id="logo"> <img src="img/logo.png" alt="SmartAdmin"> </span>
                    <span id="activity" class="activity-dropdown"> <i class="fa fa-user"></i> <b class="badge"> 21 </b> </span>

                    <!-- AJAX-DROPDOWN : control this dropdown height, look and feel from the LESS variable file -->
                    <div class="ajax-dropdown">

                        <!-- the ID links are fetched via AJAX to the ajax container "ajax-notifications" -->
                        <div class="btn-group btn-group-justified" data-toggle="buttons">
                            <label class="btn btn-default">
                                <input type="radio" name="activity" id="ajax/notify/mail.html">
                                Msgs (14) </label>
                            <label class="btn btn-default">
                                <input type="radio" name="activity" id="ajax/notify/notifications.html">
                                notify (3) </label>
                            <label class="btn btn-default">
                                <input type="radio" name="activity" id="ajax/notify/tasks.html">
                                Tasks (4) </label>
                        </div>

                        <!-- notification content -->
                        <div class="ajax-notifications custom-scroll">

                            <div class="alert alert-transparent">
                                <h4>Click a button to show messages here</h4>
                                This blank page message helps protect your privacy, or you can show the first message here automatically.
                            </div>

                            <i class="fa fa-lock fa-4x fa-border"></i>

                        </div>
                        <!-- end notification content -->

                        <!-- footer: refresh area -->
                        <span> Last updated on: 12/12/2013 9:43AM
                            <button type="button" data-loading-text="<i class='fa fa-refresh fa-spin'></i> Loading..." class="btn btn-xs btn-default pull-right">
                                <i class="fa fa-refresh"></i>
                            </button> 
                        </span>
                        <!-- end footer -->

                    </div>
                    <!-- END AJAX-DROPDOWN -->
                </div>
                <!-- pulled right: nav area -->
                <div class="pull-right">

                    <!-- collapse menu button -->
                    <div id="hide-menu" class="btn-header pull-right">
                        <span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i class="fa fa-reorder"></i></a> </span>
                    </div>
                    <!-- end collapse menu -->
                    <!-- #MOBILE -->
                    <!-- Top menu profile link : this shows only when top menu is active -->
                    <ul id="mobile-profile-img" class="header-dropdown-list hidden-xs padding-5">
                        <li class="">
                            <a href="#" class="dropdown-toggle no-margin userdropdown" data-toggle="dropdown"> 
                                <img src="img/avatars/sunny.png" alt="John Doe" class="online" />  
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li>
                                    <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0"><i class="fa fa-cog"></i> Setting</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#" class="padding-10 padding-top-0 padding-bottom-0"> <i class="fa fa-user"></i> <u>P</u>rofile</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="toggleShortcut"><i class="fa fa-arrow-down"></i> <u>S</u>hortcut</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="javascript:void(0);" class="padding-10 padding-top-0 padding-bottom-0" data-action="launchFullscreen"><i class="fa fa-arrows-alt"></i> Full <u>S</u>creen</a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="index.php" class="padding-10 padding-top-5 padding-bottom-5" data-action="userLogout"><i class="fa fa-sign-out fa-lg"></i> <strong><u>L</u>ogout</strong></a>
                                </li>
                            </ul>
                        </li>
                    </ul>

                    <!-- logout button -->
                    <div id="logout" class="btn-header transparent pull-right">
                        <span> <a href="index.php" title="Sign Out" data-action="userLogout" data-logout-msg="You can improve your security further after logging out by closing this opened browser"><i class="fa fa-sign-out"></i></a> </span>
                    </div>
                    <!-- end logout button -->
                    <!-- fullscreen button -->
                    <div id="fullscreen" class="btn-header transparent pull-right">
                        <span> <a href="javascript:void(0);" data-action="launchFullscreen" title="Full Screen"><i class="fa fa-arrows-alt"></i></a> </span>
                    </div>
                    <!-- end fullscreen button -->
                </div>
                <!-- end pulled right: nav area -->
            </header>
            <!-- END HEADER -->
            <aside id="left-panel">
                <div class="login-info">
                    <span> <!-- User image size is adjusted inside CSS, it should stay as it --> 
                        <a href="javascript:void(0);" id="show-shortcut" data-action="toggleShortcut">
                            <img src="img/avatars/sunny.png" alt="me" class="online" /> 
                            <span>
                                <?php echo $usuario; ?>
                            </span>
                            <i class="fa fa-angle-down"></i>
                        </a> 
                    </span>
                </div>
                <!-- NAVIGATION -->
                <nav>
                    <ul id="sysMenu">
                        <li <?php echo $activarMenu1 ?>><a href="inicio.php" title="Dashboard"><i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">Principal</span></a></li>
                        <li <?php echo $activarMenu2 ?>><a href="#"><i class="fa fa-lg fa-fw fa-inbox"></i> <span class="menu-item-parent">Visitas</span></a></li>
                        <li <?php echo $activarMenu3 ?>><a href="#"><i class="fa fa-lg fa-fw fa-bar-chart-o"></i> <span class="menu-item-parent">Administracion</span></a>
                            <ul>
                                <li <?php echo $activarMenu31 ?>><a href="?modulo=administrativo&op=horarios">Horarios de Visitas</a></li>
                                <li <?php echo $activarMenu32 ?>><a href="?modulo=administrativo&op=pabellones">Pabellones</a></li>
                                <li <?php echo $activarMenu33 ?>><a href="?modulo=administrativo&op=ppl">PPL</a></li>
                                <li <?php echo $activarMenu34 ?>><a href="?modulo=administrativo&op=usuarios">Usuarios</a></li>
                                <li <?php echo $activarMenu35 ?>><a href="?modulo=administrativo&op=visitantes">Visitantes</a></li>
                            </ul>
                        </li>
                        <li <?php echo $activarMenu4 ?>><a href="#"><i class="fa fa-lg fa-fw fa-table"></i> <span class="menu-item-parent">Controles</span></a>
                            <ul>
                                <li <?php echo $activarMenu41 ?>><a href="?modulo=controles&op=acceso1">Acceso 1</a></li>
                                <li <?php echo $activarMenu42 ?>><a href="?modulo=controles&op=acceso2">Acceso 2</a></li>
                                <li <?php echo $activarMenu43 ?>><a href="?modulo=controles&op=acceso3">Acceso 3</a></li>
                                <li <?php echo $activarMenu44 ?>><a href="?modulo=controles&op=acceso4">Acceso 4</a></li>
                                <li <?php echo $activarMenu45 ?>><a href="?modulo=controles&op=sanciones">Sanciones</a></li>
                                <li <?php echo $activarMenu46 ?>><a href="?modulo=controles&op=traspaso">Traspaso PPL</a></li>                                

                            </ul>
                        </li>

                        <!--li class="top-menu-hidden">
                            <a href="#"><i class="fa fa-lg fa-fw fa-cube txt-color-blue"></i> <span class="menu-item-parent">SmartAdmin Intel</span></a>
                            <ul>
                                <li>
                                    <a href="difver.html"><i class="fa fa-stack-overflow"></i> Different Versions</a>
                                </li>
                                <li>
                                    <a href="applayout.html"><i class="fa fa-cube"></i> App Settings</a>
                                </li>
                                <li>
                                    <a href="http://bootstraphunter.com/smartadmin/BUGTRACK/track_/documentation/index.html" target="_blank"><i class="fa fa-book"></i> Documentation</a>
                                </li>
                                <li>
                                    <a href="http://bootstraphunter.com/smartadmin/BUGTRACK/track_/" target="_blank"><i class="fa fa-bug"></i> Bug Tracker</a>
                                </li>
                            </ul>
                        </li-->
                    </ul>
                </nav>
                <span class="minifyme" data-action="minifyMenu"> 
                    <i class="fa fa-arrow-circle-left hit"></i> 
                </span>

            </aside>
            <!-- END NAVIGATION -->

            <!-- MAIN PANEL -->
            <div id="main" role="main">

                <!-- RIBBON -->
                <div id="ribbon">
                    <span class="ribbon-button-alignment"> 
                        <span id="refresh" class="btn btn-ribbon" data-action="resetWidgets" data-title="refresh"  rel="tooltip" data-placement="bottom" data-original-title="<i class='text-warning fa fa-warning'></i> Warning! This will reset all your widget settings." data-html="true">
                            <i class="fa fa-refresh"></i>
                        </span> 
                    </span>
                    <!-- breadcrumb -->
                    <ol class="breadcrumb">
                        <li>Inicio</li><li>Dashboard</li>
                    </ol>
                </div>
                <!-- END RIBBON -->

                <!-- MAIN CONTENT -->
                <div id="content">

                    <div class="row">
                        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
                            <h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i> Inicio <span>>  <?php echo $titulo ?></span></h1>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-5 col-lg-8">
                            <ul id="sparks" class="">
                                <li class="sparks-info">
                                    <h5>
                                        Centro
                                        <span class="txt-color-greenDark"> <?php echo $_SESSION["usu_centro_descrip"]; ?></span>
                                    </h5>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <?php echo $contenido ?>
                </div>
                <!-- END MAIN CONTENT -->

            </div>
            <!-- END MAIN PANEL -->

            <!-- PAGE FOOTER -->
            <!--div class="page-footer">
                <div class="row">
                    <div class="col-xs-12 col-sm-6">
                        <span class="txt-color-white">Sysecure WebApp © 2014-2015</span>
                    </div>

                    <div class="col-xs-6 col-sm-6 text-right hidden-xs">
                        <div class="txt-color-white inline-block">
                            <i class="txt-color-blueLight hidden-mobile">Última actividad de la cuenta <i class="fa fa-clock-o"></i> <strong>Hace 52 minutos &nbsp;</strong> </i>
                            <div class="btn-group dropup">
                                <button class="btn btn-xs dropdown-toggle bg-color-blue txt-color-white" data-toggle="dropdown">
                                    <i class="fa fa-link"></i> <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu pull-right text-left">
                                    <li>
                                        <div class="padding-5">
                                            <p class="txt-color-darken font-sm no-margin">Download Progress</p>
                                            <div class="progress progress-micro no-margin">
                                                <div class="progress-bar progress-bar-success" style="width: 50%;"></div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <div class="padding-5">
                                            <p class="txt-color-darken font-sm no-margin">Server Load</p>
                                            <div class="progress progress-micro no-margin">
                                                <div class="progress-bar progress-bar-success" style="width: 20%;"></div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <div class="padding-5">
                                            <p class="txt-color-darken font-sm no-margin">Memory Load <span class="text-danger">*critical*</span></p>
                                            <div class="progress progress-micro no-margin">
                                                <div class="progress-bar progress-bar-danger" style="width: 70%;"></div>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <div class="padding-5">
                                            <button class="btn btn-block btn-default">refresh</button>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END PAGE FOOTER -->

            <!-- SHORTCUT AREA : With large tiles (activated via clicking user name tag)
            Note: These tiles are completely responsive,
            you can add as many as you like
            -->
            <div id="shortcut">
                <ul>
                    <li>
                        <a href="#inbox.html" class="jarvismetro-tile big-cubes bg-color-blue"> <span class="iconbox"> <i class="fa fa-envelope fa-4x"></i> <span>Mail <span class="label pull-right bg-color-darken">14</span></span> </span> </a>
                    </li>
                    <li>
                        <a href="#calendar.html" class="jarvismetro-tile big-cubes bg-color-orangeDark"> <span class="iconbox"> <i class="fa fa-calendar fa-4x"></i> <span>Calendar</span> </span> </a>
                    </li>
                    <li>
                        <a href="#gmap-xml.html" class="jarvismetro-tile big-cubes bg-color-purple"> <span class="iconbox"> <i class="fa fa-map-marker fa-4x"></i> <span>Maps</span> </span> </a>
                    </li>
                    <li>
                        <a href="#invoice.html" class="jarvismetro-tile big-cubes bg-color-blueDark"> <span class="iconbox"> <i class="fa fa-book fa-4x"></i> <span>Invoice <span class="label pull-right bg-color-darken">99</span></span> </span> </a>
                    </li>
                    <li>
                        <a href="#gallery.html" class="jarvismetro-tile big-cubes bg-color-greenLight"> <span class="iconbox"> <i class="fa fa-picture-o fa-4x"></i> <span>Gallery </span> </span> </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="jarvismetro-tile big-cubes selected bg-color-pinkDark"> <span class="iconbox"> <i class="fa fa-user fa-4x"></i> <span>My Profile </span> </span> </a>
                    </li>
                </ul>
            </div>
            <!-- END SHORTCUT AREA -->

            <!--================================================== -->

            <!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
            <script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plantilla/plugin/pace/pace.min.js"></script>

            <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
            <script>
                if (!window.jQuery) {
                    document.write('<script src="js/plantilla/libs/jquery-2.1.1.min.js"><\/script>');
                }
            </script>

            <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>
            <script>
                if (!window.jQuery.ui) {
                    document.write('<script src="js/plantilla/libs/jquery-ui.min.js"><\/script>');
                }
            </script>

            <!-- JS TOUCH : include this plugin for mobile drag / drop touch events
            <script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

            <!-- BOOTSTRAP JS -->
            <script src="js/plantilla/bootstrap/bootstrap.min.js"></script>

            <!-- CUSTOM NOTIFICATION -->
            <script src="js/plantilla/notification/SmartNotification.min.js"></script>

            <!-- JARVIS WIDGETS -->
            <script src="js/plantilla/smartwidgets/jarvis.widget.min.js"></script>

            <!-- EASY PIE CHARTS -->
            <script src="js/plantilla/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

            <!-- SPARKLINES -->
            <script src="js/plantilla/plugin/sparkline/jquery.sparkline.min.js"></script>

            <!-- JQUERY VALIDATE -->
            <script src="js/plantilla/plugin/jquery-validate/jquery.validate.min.js"></script>
            
             <!-- JQUERY VALIDATE MENSSAGE IN SPANISH -->
            <script src="js/plantilla/plugin/jquery-validate/jqueryvalidatemessage.min.js"></script>
                
            <!-- JQUERY MASKED INPUT -->
            <script src="js/plantilla/plugin/masked-input/jquery.maskedinput.min.js"></script>

            <!-- JQUERY SELECT2 INPUT -->
            <script src="js/plantilla/plugin/select2/select2.min.js"></script>

            <!-- JQUERY UI + Bootstrap Slider -->
            <script src="js/plantilla/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

            <!-- browser msie issue fix -->
            <script src="js/plantilla/plugin/msie-fix/jquery.mb.browser.min.js"></script>

            <!-- FastClick: For mobile devices -->
            <script src="js/plantilla/plugin/fastclick/fastclick.min.js"></script>
            
            <!-- Generador de MD5 -->
            <script src="js/plantilla/plugin/jquery-md5/jquery.md5.min.js"></script>
            <!--[if IE 8]>

            <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

            <![endif]-->

            <!-- Demo purpose only -->
            <!--script src="js/plantilla/demo.min.js"></script-->

            <!-- MAIN APP JS FILE -->
            <script src="js/plantilla/app.min.js"></script>
            <script src="js/general.js"></script>
            <script src="js/visitas.js"></script>
            <script src="js/usuario.js"></script>
            <script src="js/pabellones.js"></script>
            <script src="js/horarios.js"></script>
            <script src="js/ppl.js"></script>
            <script src="js/visitantes.js"></script>
            <script src="js/acceso1.js"></script>
            <script src="js/acceso2.js"></script>
            <script src="js/acceso3.js"></script>
            <script src="js/acceso4.js"></script>
            <script src="js/sancionados.js"></script>
            <script src="js/traspaso.js"></script>

            <!-- PAGE RELATED PLUGIN(S) -->
            <script src="js/plantilla/plugin/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
            <!-- Flot Chart Plugin: Flot Engine, Flot Resizer, Flot Tooltip -->
            <script src="js/plantilla/plugin/flot/jquery.flot.cust.min.js"></script>
            <script src="js/plantilla/plugin/flot/jquery.flot.resize.min.js"></script>
            <script src="js/plantilla/plugin/flot/jquery.flot.tooltip.min.js"></script>
            <!-- Vector Maps Plugin: Vectormap engine, Vectormap language -->
            <script src="js/plantilla/plugin/vectormap/jquery-jvectormap-1.2.2.min.js"></script>
            <script src="js/plantilla/plugin/vectormap/jquery-jvectormap-world-mill-en.js"></script>
            <!-- Full Calendar -->
            <script src="js/plantilla/plugin/fullcalendar/jquery.fullcalendar.min.js"></script>
            <script src="js/plantilla/plugin/datatables/jquery.dataTables.min.js"></script>
            <script src="js/plantilla/plugin/datatables/dataTables.colVis.min.js"></script>
            <script src="js/plantilla/plugin/datatables/dataTables.tableTools.min.js"></script>
            <script src="js/plantilla/plugin/datatables/dataTables.bootstrap.min.js"></script>
            <script src="js/plantilla/plugin/knob/jquery.knob.min.js"></script>
            
            
            <script>
                $(document).ready(function() {
                    // DO NOT REMOVE : GLOBAL FUNCTIONS!
                    pageSetUp();
                    
                });
            </script>
        </body>
    </html>
    <?php
    
} else {
    header('Location: index.php');
}
?>