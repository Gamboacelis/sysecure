<?php
session_start();
if ($_SESSION["autenticado"] == 'SI') {
    $titulo = '';
    $contenido = '';
    $usuario = '';

    $usuario = $_SESSION["usu_real_nombre"];
    $codUsu = $_SESSION["user_id"];
    $modulos = isset($_GET['modulo']) ? $_GET['modulo'] : 'ninguno';
    include_once("./includes/permisos.php");
    $permisos = new Permisos($codUsu);
    include_once("./includes/visitas.php");
    include_once("./includes/generales.php");
    $clGeneral = new general();
    $clGeneral->inicializaMenu();
    $activaVisita=$clGeneral->obtenerTotalVisita('A');
    $totalVisitaHoy=$clGeneral->obtenerTotalVisita('H');
    $totalVisita=$clGeneral->obtenerTotalVisita('T');
    switch ($modulos) {
        case 'administrativo':
            $option = isset($_GET['op']) ? $_GET['op'] : 0;
            include_once("./includes/pabellones/pabellon_vistas.php");
            include_once("./includes/usuario/Usuarios_vistas.php");
            include_once("./includes/horarios/horarios_vistas.php");
            include_once("./includes/ppl/ppl_vistas.php");
            include_once("./includes/visitante/visitantes_vistas.php");
            include_once("./includes/parametros/parametros_vistas.php");
            include_once("./includes/centros/centros_vistas.php");
            include_once("./includes/sanciones/mantenimiento/sancion_vistas.php");
            include_once("./includes/traspaso/traspaso_vistas.php");
            include_once("./includes/roles/roles_vistas.php");
            include_once("./includes/busquedas/busquedas_vistas.php");

            switch ($option) {
                case 'centros':
                    $titulo = 'Revisión de Centros';
                    $activarMenu31 = 'class="active"';
                    $contenido = reporteCentros();
                    break;
                case 'horarios':
                    $titulo = 'Revisión de Horarios';
                    $activarMenu32 = 'class="active"';
                    $contenido = frm_asignacionPabellones();
                    break;
                case 'pabellones':
                    $titulo = 'Revisión de Pabellones';
                    $activarMenu33 = 'class="active"';
                    $contenido = reporte_pabellones();
                    break;
                case 'parametros':
                    $titulo = 'Revisión de Parametros de Configuracion';
                    $activarMenu34 = 'class="active"';
                    $contenido = reporteParametros();
                    break;
                case 'ppl':
                    $titulo = 'Revisión de Personas Privadas de Libertad';
                    $activarMenu35 = 'class="active"';
                    $contenido = revisarPpl();
                    break;
                case 'usuarios':
                    $titulo = 'Revisión de Usuarios';
                    $activarMenu36 = 'class="active"';
                    $contenido = revisarUsuarios();
                    break;
                
                case 'visitantes':
                    $titulo = 'Revisión de Visitantes';
                    $activarMenu37 = 'class="active"';
                    $contenido = revisarVisitantes();
                    break;
                case 'sanciones':
                    $titulo='Mantenimiento de sanciones';
                    $activarMenu38='class="active"';
                    $contenido = revisarTipoSanciones();
                    break;
                case 'roles':
                    $titulo='Asignación de Permisos';
                    $contenido = frm_asignacionPermisos();
                    break;
                case 'busquedas':
                    $titulo='Buscar Todo...';
                    $contenido = frm_busquedasGenerales();
                    break;

            }
            break;
        case 'controles':
            $option = isset($_GET['op']) ? $_GET['op'] : 0;
            switch ($option) {
                case 'acceso1':
                    include_once("./includes/controles/acceso1/acceso1_vistas.php");
                    $titulo = 'Revisión de Accesos Primer Nivel';
                    $activarMenu41 = 'class="active"';
                    $contenido = revisarPpl();
                    break;
                case 'acceso2':
                    include_once("./includes/controles/acceso2/acceso2_vistas.php");
                    $titulo = 'Revisión de Accesos Segundo Nivel';
                    $activarMenu42 = 'class="active"';
                    $contenido = frm_revisarAcceso2();
                    break;
                case 'acceso3':
                    include_once("./includes/controles/acceso3/acceso3_vistas.php");
                    $titulo = 'Revisión de Accesos Tercer Nivel';
                    $activarMenu43 = 'class="active"';
                    $contenido = frm_revisarAcceso3();
                    break;
                case 'acceso4':
                    include_once("./includes/controles/acceso4/acceso4_vistas.php");
                    $titulo = 'Revisión de Accesos Cuarto Nivel';
                    $activarMenu44 = 'class="active"';
                    $contenido = frm_revisarAcceso4();
                    break;
                 case 'acceso5':
                    include_once("./includes/controles/acceso5/acceso5_vistas.php");
                    $titulo = 'Revisión de Accesos Primer Nivel';
                    $activarMenu46 = 'class="active"';
                    $contenido = frm_revisarAcceso5();
                    break;
                case 'sanciones':
                    include_once("./includes/sanciones/sancion_vistas.php");
                    $titulo = 'Revisión de Visitantes sancionados';
                    $activarMenu45 = 'class="active"';
                    $contenido = revisarSanciones();
                    break;
                
            }
            break;
        case 'reportes':
            $option = isset($_GET['op']) ? $_GET['op'] : 0;
            switch ($option) {
                case 'sancionados':
                    include_once("./includes/reportes/sanciones/Rsanciones_vistas.php");
                    $titulo = 'Reporte de Visitantes Sancionados';
                    $contenido = reporteSancionados();
                    break;
                case 'visitas':
                    include_once("./includes/reportes/visitas/Rvisitas_vistas.php");
                    $titulo = 'Reporte de Visitas';
                    $contenido = reporteVisitas();
                    break;                    
            }
            break;
        default:
            $titulo = 'Dashboard';
            $codMenu=$_SESSION["menu"]= 1;
            $activarMenu.$codMenu = 'class="active"';
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
            <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
            <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">
            <link rel="stylesheet" type="text/css" media="screen" href="css/generales.css"> 
            <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">
            <!-- FAVICONS -->
            <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
            <link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">
            <!-- GOOGLE FONT -->
            <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
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
                    <span id="logo"> <img src="img/logo/Logo.png" alt="Sisecure"> </span>
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
                        <span> <a href="logout.php" title="Sign Out" data-action="userLogout" data-logout-msg="Usted puede mejorar su seguridad aún más después de cerrar la sesión al cerrar este navegador abierto"><i class="fa fa-sign-out"></i></a> </span>
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
                            <img src="img/avatars/male.png" alt="<?php echo $usuario; ?>" class="online" /> 
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
                        <?php echo $permisos->construirMenu();?>
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
                    <form action="javascript:busquedas();" class="header-search pull-right">
                            <input type="text" placeholder="Buscar Visitante" id="search-visitante">
                            <button type="submit"><i class="fa fa-search"></i></button>
                            <a href="javascript:void(0);" id="cancel-search-js" title="Cancel Search"><i class="fa fa-times"></i></a>
                    </form>
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
                                    Visitas Activas
                                    <span class="txt-color-purple" title="Total de Visitas de Hoy Activas">
                                    <i class="fa fa-bolt"></i>
                                      <?php echo $activaVisita ?>
                                    </span>
                                </h5>
                                </li>
                                <li class="sparks-info">
                                    <h5>
                                        Visitas Hoy
                                        <span class="txt-color-greenDark" title="Total de Visitas de Hoy">
                                            <i class="fa fa-arrow-circle-up"></i>
                                             <?php echo $totalVisitaHoy ?>
                                        </span>
                                    </h5>
                                </li>
                                <!--li class="sparks-info">
                                    <h5>
                                        Total Visitas
                                        <span class="txt-color-blue" title="Total de Visitas General">
                                            <i class="fa fa-bar-chart-o "></i>
                                             <?php echo $totalVisita ?>
                                        </span>
                                    </h5>
                                </li-->  
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
            <script>
			if (!window.jQuery) {
				document.write('<script src="js/plantilla/libs/jquery-2.0.2.min.js"><\/script>');
			}
		</script>

		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
		<script>
			if (!window.jQuery.ui) {
				document.write('<script src="js/plantilla/libs/jquery-ui-1.10.3.min.js"><\/script>');
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
            
            <!-- SOAP JS -->
            <script src="js/plantilla/plugin/jquery-soap/jquery.soap.js"></script>
            
            <!-- XML2JSON JS -->
            <script src="js/plantilla/plugin/jquery-soap/jquery.xml2json.js"></script>
            <!--[if IE 8]>

            <h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>

            <![endif]-->

            <!-- Demo purpose only -->
            <!--script src="js/plantilla/demo.min.js"></script-->

            <!-- MAIN APP JS FILE -->
            <script src="js/plantilla/app.min.js"></script>
            <script src="js/timeOut.js"></script>
            <script src="js/general.js"></script>
            <script src="js/webcam.js"></script>
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
            <script src="js/centros.js"></script>
            <script src="js/parametros.js"></script>
            <script src="js/mantenimientoSanciones.js"></script>
            <script src="js/roles.js"></script>
            <script src="js/busquedas.js"></script>
            <script src="js/reportes.js"></script>

            <!-- PAGE RELATED PLUGIN(S) -->
            <script src="js/plantilla/plugin/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
            <script src="js/plantilla/plugin/clockpicker/clockpicker.min.js"></script>
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
            <script src="js/plantilla/plugin/morris/raphael.min.js"></script>
            <script src="js/plantilla/plugin/morris/morris.min.js"></script>


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