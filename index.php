<?php
include_once("includes/conexiones/db_local.inc.php");
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
?>
<!DOCTYPE html>
<html lang="en-us" id="extr-page">
	<head>
        <meta charset="utf-8">
        <title> Sysecure </title>
        <meta name="description" content="Automatizacion y Control de Visitas a PPL">
        <meta name="author" content="iBlack Sistemas y Comunicaciones S.A.">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/generales.css"> 
        <link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">
        <link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
        <link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
        <link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
        <link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
        <link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-mobile-web-app-status-bar-style" content="black">
        <link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
        <link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
        <link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">
    </head>
    <body class="animated fadeInDown">
		<header id="header">
                    <div id="logo-group">
                        <span id="logo"> <img src="img/logo/Logo.png" alt="Sysecure"> </span>
                    </div>
                    <span id="extr-page-header-space">
                        <a href="javascript:abrirLogin()" class="btn btn-danger">Acceder al Sistema</a> 
                    </span>
		</header>

		<div id="main" role="main">

			<!-- MAIN CONTENT -->
			<div id="content" class="container">

				<div class="row">
					<div id="divPropaganda" class="col-xs-12 col-sm-12 col-md-7 col-lg-12 hidden-xs hidden-sm">
						<h1 class="txt-color-red login-header-big">SYSECURE</h1>
						<div class="hero">

							<div class="pull-left login-desc-box-l">
								<h4 class="paragraph-header">Control de Visitas de PPL, MultiCentros</h4><br>
                                                                <spam class="text-success"><strong>Puede consultar el Horario de Visitas de un PPL, dando click aqui:</strong></spam><br><br>
                                                                <a class="btn btn-primary btn-lg" href="javascript:consultarHoarios();">Consultar Horarios</a>
							</div>
							
                                                    <img src="img/justicia.jpg" class="pull-right img-thumbnail" alt="" style="width:350px">

						</div>

						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
								<img src="img/logo_minJus.png" class="pull-right display-image" alt="" width="300px">
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                                                <img src="img/ealv.png" class="pull-right display-image" alt="" width="300px">
							</div>
						</div>

					</div>
					<div id="ventanaLogin" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true" style="display: block;width: 600px;margin: auto;top: 50px;overflow-y: hidden;">
						<div class="well no-padding">
                                                    <form action="javascript:login();" id="login-form" class="smart-form client-form" method="POST">
								<header>
									Ingreso
								</header>

								<fieldset>
									<section>
										<label class="label">Centro</label>
										<label class="select state-success"> <i class="icon-append fa fa-user"></i>
                                                                                    <select class="valid" name="centro" id="centro">
                                                                                        <option disabled="" selected="" value="0">-- Seleccione --</option>
                                                                                        <?php   
                                                                                            global $dbmysql;
                                                                                            $sqlcmb = "SELECT * FROM `sys_centro`";
                                                                                            $valcmb = $dbmysql->query($sqlcmb);
                                                                                            while($row = $valcmb->fetch_object()){?>
                                                                                                    <option value="<?php echo $row->CEN_COD ?>"><?php echo $row->CEN_DESCRIPCION ?></option>
                                                                                                <?php } ?>
                                                                                    </select>
											<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Seleccione un Centro de reclusión</b></label>
									</section>
									<section>
										<label class="label">Usuario</label>
										<label class="input"> <i class="icon-append fa fa-user"></i>
                                                                                    <input type="text" name="usuario" id="usuario">
											<b class="tooltip tooltip-top-right"><i class="fa fa-user txt-color-teal"></i> Por favor digite su Usuario</b></label>
									</section>

									<section>
										<label class="label">Password</label>
										<label class="input"> <i class="icon-append fa fa-lock"></i>
                                                                                    <input type="password" name="clave" id="clave">
											<b class="tooltip tooltip-top-right"><i class="fa fa-lock txt-color-teal"></i> Por favor digite su Clave</b> </label>
									</section>
								</fieldset>
								<footer>
									<button type="submit" class="btn btn-primary">
										Ingresar
									</button>
								</footer>
							</form>

						</div>
					</div>
                                        <div class="modal fade" id="frmConsultaModal" tabindex="-1" role="dialog" aria-labelledby="PagoModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" style="width: 800px;">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                                                &times;
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <div class="jarviswidget jarviswidget-sortable" id="wid-id-4" data-widget-editbutton="false" data-widget-custombutton="false">
                                                                        <header>
                                                                                <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                                                                                <h2>Consulta el Horario de Visitas</h2>				
                                                                        </header>
                                                                        <div>
                                                                            <div class="widget-body">
                                                                                <div class="smart-form">
                                                                                    <fieldset>
                                                                                            <section>
                                                                                                <label>Nombre del PPL</label>
                                                                                                <label class="input">
                                                                                                    <i class="icon-prepend fa fa-user"></i>
                                                                                                    <input id="nomPpl" name="nomPpl" type="text" placeholder="Nombre y Apellido del PPL">
                                                                                                </label>
                                                                                            </section>
                                                                                            <section style="text-align: center;">
                                                                                                <a class="btn btn-success"  onclick="javascript:consultarPPLBusqueda();" href="#">
                                                                                                        <i class="fa fa-check"></i>
                                                                                                        Consultar
                                                                                                </a>
                                                                                            </section>    
                                                                                        
                                                                                    </fieldset>
                                                                                    <fieldset>
                                                                                                
                                                                                    </fieldset>
                                                                               </div>
                                                                            </div>
                                                                            <div id="muestraReporte">

                                                                            </div>
                                                                        </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
				</div>
			</div>

		</div>

		<!--================================================== -->	

		<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
		<script src="js/plantilla/plugin/pace/pace.min.js"></script>

	    <!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
	    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script> if (!window.jQuery) { document.write('<script src="js/plantilla/libs/jquery-2.1.1.min.js"><\/script>');} </script>

	    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.0/jquery-ui.min.js"></script>
		<script> if (!window.jQuery.ui) { document.write('<script src="js/plantilla/libs/jquery-ui-1.11.0.min.js"><\/script>');} </script>

		<!-- JS TOUCH : include this plugin for mobile drag / drop touch events 		
		<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> -->

		<!-- BOOTSTRAP JS -->		
		<script src="js/plantilla/bootstrap/bootstrap.min.js"></script>

		<!-- JQUERY VALIDATE -->
		<script src="js/plantilla/plugin/jquery-validate/jquery.validate.min.js"></script>
		
		<!-- JQUERY MASKED INPUT -->
		<script src="js/plantilla/plugin/masked-input/jquery.maskedinput.min.js"></script>
		<!-- CUSTOM NOTIFICATION -->
                <script src="js/plantilla/notification/SmartNotification.min.js"></script>
		<!--[if IE 8]>
			
			<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
			
		<![endif]-->

		<!-- MAIN APP JS FILE -->
		<script src="js/plantilla/app.min.js"></script>
                <script src="js/general.js"></script>

		<script type="text/javascript">
			runAllForms();

			$(function() {
				// Validation
				$("#login-form").validate({
					// Rules for form validation
					rules : {
						email : {
							required : true,
							email : true
						},
						password : {
							required : true,
							minlength : 3,
							maxlength : 20
						}
					},

					// Messages for form validation
					messages : {
						email : {
							required : 'Please enter your email address',
							email : 'Please enter a VALID email address'
						},
						password : {
							required : 'Please enter your password'
						}
					},

					// Do not change code below
					errorPlacement : function(error, element) {
						error.insertAfter(element.parent());
					}
				});

                $( ".close" ).click(function() {
                    $('#muestraReporte').html('');
                    $('#nomPpl').val('');
                });


                    $( '#nomPpl' ).keyup(function(e) {
                        if(e.keyCode==13){
                             $(".btn-success").trigger("click");
                          
                     } 
           
                     });     
			});
                        function login(){
                            var usuario=$("#usuario").val();
                            var clave= $("#clave").val();
                            var centro= $("#centro").val();
                             $.ajax({
                                url: "autenticacion.php",
                                type: 'post',
                                data:{usuario:usuario,clave:clave,centro:centro},
                                success: function(respuesta) {
                                    if(respuesta==='ok'){
                                        window.location = "inicio.php"; 
                                    }else{
                                        $.smallBox({
                                            title : "Usuario y/o Contraseña Incorrectos..",
                                            content : "<i class='icon-remove'></i> <i>Digite Nuevamente su Usuario y Contraseña..!</i>",
                                            color : "#C46A69",
                                            iconSmall : "fa fa-check fa-2x fadeInRight animated",
                                            timeout : 4000
                                        });
                                        $("#usuario").val('');
                                        $("#clave").val('');
                                        $("#centro").val('');
                                    }
                                }
                            });
                        }
                        function consultarHoarios(){
                            $('#frmConsultaModal').modal('show');
                        }
                        function consultarPPLBusqueda(){
                            var nombreppl=$('#nomPpl').val();
                            if(nombreppl!==''){
                                $.ajax({
                                    url: "busqueda.php?opcion=reportePPL",
                                    type: 'post',
                                    data:{nombreppl:nombreppl},
                                    success: function(respuesta) {
                                        if(respuesta!==''){
                                            $('#muestraReporte').html(respuesta);
                                        }else{
                                            $.smallBox({
                                                title : "No Valido",
                                                content : "<i class='icon-remove'></i> <i>Estimado Usuario, digite nuevamente el nombre de la Persona, nuestra base de datos no encuentra coincidencias..!</i>",
                                                color : "#C46A69",
                                                iconSmall : "fa fa-check fa-2x fadeInRight animated",
                                                timeout : 7000
                                            });
                                            $("#nomPpl").val('');
                                        }
                                    }
                                });
                            }else{
                                $.smallBox({
                                    title : "Error..!",
                                    content : "<i class='icon-remove'></i> <i>Debe ingresar el nombre o apellido de la Persona que busca</i>",
                                    color : "#C46A69",
                                    iconSmall : "fa fa-check fa-2x fadeInRight animated",
                                    timeout : 4000
                                });
                                $("#nomPpl").val('');
                            }
                        }
                        function abrirLogin(){
 
                            $('#ventanaLogin').modal('show');
                        }
		</script>

	</body>
</html>