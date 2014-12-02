<?php
session_start();
$codUsuario = $_SESSION["user_id"];
$usuario = $_SESSION["usu_usuario"];
$centro = $_SESSION["usu_centro_cod"];
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
        <!-- page related CSS -->
        <link rel="stylesheet" type="text/css" media="screen" href="css/lockscreen.min.css">
        <!-- FAVICONS -->
        <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">
    </head>
    <body>
        <div id="main" role="main">
            <!-- MAIN CONTENT -->
            <form id="cambioClave-form" class="smart-form lockscreen animated flipInY" action="javascript:cambioClaveInicial();" autocomplete="off">
                <div class="logo">
                    <img src="img/logo/Logo.png" alt="Sysecure">
                </div>
                <div>
                    <img src="img/avatars/male.png" alt="" width="120" height="120" />
                    <div>
                        <h1><i class="fa fa-user fa-3x text-muted air air-top-right hidden-mobile"></i><?php echo $_SESSION["usu_real_nombre"] ?><small><i class="fa fa-lock text-muted"></i> &nbsp;Cambio de Contraseña</small></h1>
                        <p class="text-muted">
                            <a href="mailto:<?php echo $_SESSION["usu_mail"] ?>"><?php echo $_SESSION["usu_mail"] ?></a>
                            <input name="codUsuario" id="codUsuario" type="hidden" value="<?php echo $codUsuario ?>">
                            <input name="usuario" id="usuario" type="hidden" value="<?php echo $usuario ?>">
                            <input name="centro" id="centro" type="hidden" value="<?php echo $centro ?>">
                        </p>
                        <fieldset>
                            <section class="col col-12">
                                <label class="input">
                                    <i class="icon-prepend fa fa-key"></i>
                                    <input class="form-control" type="password" name="password" id="password" placeholder="Nueva Contraseña">
                                </label>
                            </section>
                            <section class="col col-12">
                                <label class="input">
                                    <i class="icon-prepend fa fa-key"></i>
                                    <input class="form-control" type="password" name="passwordConfirm" id="passwordConfirm" placeholder="Repetir Contraseña">
                                </label>
                            </section>
                        </fieldset>
                        <footer>
                            <button class="btn btn-primary" type="submit"> Cambiar </button>
                        </footer>
                    </div>

                </div>
                <p class="font-xs margin-top-5">
                    Copyright WieSolutions 2014.
                </p>
            </form>

        </div>

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
        <script type="text/javascript">
            runAllForms();
            $(function() {
                $.validator.addMethod("validacionClave", function(value, element) {
                    return  /(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/.test(value);
                });
                $("cambioClave-form").validate({
                    rules: {
                        password: {
                            required: true,
                            minlength: 8,
                            maxlength: 20,
                            validacionClave: true
                        },
                        passwordConfirm: {
                            required: true,
                            minlength: 8,
                            maxlength: 20,
                            equalTo: '#password'
                        },
                    },
                    errorPlacement: function(error, element) {
                        error.insertAfter(element.parent());
                    }
                });
            });
            function cambioClaveInicial() {
                var codUsuario = $('#codUsuario').val();
                var clave = $('#password').val();
                $.ajax({
                    url: "./includes/usuario/Usuarios_model.php?opcion=cambioClaveInicial",
                    type: 'post',
                    data: {codUsuario: codUsuario, clave: clave},
                    success: function(respuesta) {
                        if (respuesta === '1') {
                            $.smallBox({
                                title: 'Actualización',
                                content: "<i class='fa fa-clock-o'></i> <i>Usuario Actualizado su Clave...</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 7000
                            });
                            window.location = "index.php"; 
                        }
                    }
                });
            }
        </script>
    </body>
</html>