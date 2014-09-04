<?php

include_once("conexiones/db_local.inc.php");
$dbmysql = new database();
date_default_timezone_set('America/Bogota');

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$funcion = isset($_GET['funcion']) ? $_GET['funcion'] : 'ninguno';
switch ($funcion) {
    case 'consultadatosVisitante':
        consultadatosVisitante();
        break;
    case 'registraVisitante':
        registraVisitante();
        break;
}

function reporte_visitantes() {
    global $dbmysql;
    $retval = '';
    $retval = '<section id="widget-grid" class="">
<div class="row">
        <div class="col-sm-6">
            <button id="enable" class="btn btn-primary btn-lm" href="javascript:void(0); " data-toggle="modal" data-target="#nuevaVisita">
                    <i class="fa fa-gear fa-2x fa-spin"></i>
                    Nueva Visita
            </button>
        </div>
        <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="jarviswidget jarviswidget-color-darken" id="wid-id-0" data-widget-editbutton="false">
                        <header>
                                <span class="widget-icon"> <i class="fa fa-table"></i> </span>
                                <h2>Listado de Visitas </h2>
                        </header>
                        <div>
                                
                                <div class="jarviswidget-editbox">
                                
                                </div>
                                <div class="widget-body no-padding">
                                
                                        <table id="dt_basic" class="table table-striped table-bordered table-hover" width="100%">
                                                <thead>
                                                        <tr>
                                                                <th>ID</th>
                                                                <th><i class="fa fa-fw fa-user text-muted hidden-md hidden-sm hidden-xs"></i> Nombres</th>
                                                                <th><i class="fa fa-fw fa-user text-muted hidden-md hidden-sm hidden-xs"></i> Apellidos</th>
                                                                <th><i class="fa fa-fw fa-phone text-muted hidden-md hidden-sm hidden-xs"></i> PPL</th>
                                                                <th><i class="fa fa-fw fa-map-marker txt-color-blue hidden-md hidden-sm hidden-xs"></i> Pabellon</th>
                                                                <th><i class="fa fa-fw fa-calendar txt-color-blue hidden-md hidden-sm hidden-xs"></i> Hora Ingreso</th>
                                                                <th><i class="fa fa-fw fa-calendar txt-color-blue hidden-md hidden-sm hidden-xs"></i> Hora Transcurrida</th>
                                                                <th><i class="fa fa-fw fa-calendar txt-color-blue hidden-md hidden-sm hidden-xs"></i> Hora Salida</th>
                                                        </tr>
                                                </thead>
                                                <tbody>
                                                        <tr class="terminarVisita">
                                                                <td>1</td>
                                                                <td>Jennifer</td>
                                                                <td>Cantuña</td>
                                                                <td>Julio Roman Cantuña</td>
                                                                <td>M2</td>
                                                                <td>10:00</td>
                                                                 <td><div class="progress progress-striped active no-margin">
                                                                        <div class="progress-bar progress-bar-success" style="width: 15%" role="progressbar">15%</div>
                                                                    </div>
                                                                </td>
                                                                <td>12:40</td>
                                                        </tr>
                                                        <tr class="terminarVisita">
                                                                <td>2</td>
                                                                <td>Clark</td>
                                                                <td>Ruiz</td>
                                                                <td>Manuel Chavez Ruiz</td>
                                                                <td>M3</td>
                                                                <td>10:00</td>
                                                                 <td><div class="progress progress-striped active no-margin">
                                                                        <div class="progress-bar progress-bar-success" style="width: 35%" role="progressbar">35%</div>
                                                                    </div>
                                                                </td>
                                                                <td>12:20</td>
                                                        </tr>
                                                        <tr class="terminarVisita">
                                                                <td>3</td>
                                                                <td>Brendan</td>
                                                                <td>Marquez</td>
                                                                <td>Carlos Marin Perez</td>
                                                                <td>M2</td>
                                                                <td>10:00</td>
                                                                <td><div class="progress progress-striped active no-margin">
                                                                        <div class="progress-bar progress-bar-success" style="width: 85%" role="progressbar">85%</div>
                                                                    </div>
                                                                </td>
                                                                <td>11:00</td>
                                                        </tr>
                                                        <tr class="terminarVisita">
                                                                <td>4</td>
                                                                <td>Warren</td>
                                                                <td>Richard</td>
                                                                <td>José Astudillo</td>
                                                                <td>M1</td>
                                                                <td>10:40</td>
                                                                 <td><div class="progress progress-striped active no-margin">
                                                                        <div class="progress-bar progress-bar-success" style="width: 35%" role="progressbar">35%</div>
                                                                    </div>
                                                                </td>
                                                                <td>11:40</td>
                                                        </tr>
                                                        <tr class="terminarVisita">
                                                                <td>5</td>
                                                                <td>Rajah</td>
                                                                <td>Valencia</td>
                                                                <td>Luis Valencia Roman</td>
                                                                <td>M1</td>
                                                                <td>11:30</td>
                                                                 <td><div class="progress progress-striped active no-margin">
                                                                        <div class="progress-bar progress-bar-success" style="width: 45%" role="progressbar">45%</div>
                                                                    </div>
                                                                </td>
                                                                <td>12:30</td>
                                                        </tr>
                                                        <tr class="terminarVisita">
                                                                <td>6</td>
                                                                <td>Demetrius</td>
                                                                <td>Torres</td>
                                                                <td>Federico Gonzales</td>
                                                                <td>M2</td>
                                                                <td>12:30</td>
                                                                 <td><div class="progress progress-striped active no-margin">
                                                                        <div class="progress-bar progress-bar-success" style="width: 65%" role="progressbar">65%</div>
                                                                    </div>
                                                                </td>
                                                                <td>13:30</td>
                                                        </tr>
                                                        <tr class="terminarVisita">
                                                                <td>7</td>
                                                                <td>Keefe</td>
                                                                <td>Perez</td>
                                                                <td>Pedro Rodriguez Perez</td>
                                                                <td>M3</td>
                                                                <td>11:45</td>
                                                                 <td><div class="progress progress-striped active no-margin">
                                                                        <div class="progress-bar progress-bar-success" style="width: 85%" role="progressbar">85%</div>
                                                                    </div>
                                                                </td>
                                                                <td>12:45</td>
                                                        </tr>
                                                        <tr class="terminarVisita">
                                                                <td>8</td>
                                                                <td>Leila</td>
                                                                <td>Maldonado</td>
                                                                <td>Rodrigo Castañeda</td>
                                                                <td>M4</td>
                                                                <td>10:00</td>
                                                                 <td><div class="progress progress-striped active no-margin">
                                                                        <div class="progress-bar progress-bar-success" style="width: 65%" role="progressbar">65%</div>
                                                                    </div>
                                                                </td>
                                                                <td>11:00</td>
                                                        </tr>
                                                        <tr class="terminarVisita">
                                                                <td>9</td>
                                                                <td>Fritz</td>
                                                                <td>Tello</td>
                                                                <td>jesus Altamirano</td>
                                                                <td>M1</td>
                                                                <td>12:00</td>
                                                                 <td><div class="progress progress-striped active no-margin">
                                                                        <div class="progress-bar progress-bar-success" style="width: 25%" role="progressbar">25%</div>
                                                                    </div>
                                                                </td>
                                                                <td>13:00</td>
                                                        </tr>
                                                        <tr class="terminarVisita">
                                                                <td>10</td>
                                                                <td>Cassady</td>
                                                                <td>Gallo</td>
                                                                <td>Marco Ricaurte</td>
                                                                <td>M2</td>
                                                                <td>12:15</td>
                                                                 <td><div class="progress progress-striped active no-margin">
                                                                        <div class="progress-bar bg-color-redLight" style="width: 95%" role="progressbar">95%</div>
                                                                    </div>
                                                                </td>
                                                                <td>13:15</td>
                                                        </tr>
                                                        <tr class="terminarVisita">
                                                                <td>11</td>
                                                                <td>Rogan</td>
                                                                <td>Lopez</td>
                                                                <td>Manuel Gomez Bastidas</td>
                                                                <td>M4</td>
                                                                <td>12:30</td>
                                                                 <td><div class="progress progress-striped active no-margin">
                                                                        <div class="progress-bar progress-bar-success" style="width: 15%" role="progressbar">15%</div>
                                                                    </div>
                                                                </td>
                                                                <td>13:30</td>
                                                        </tr>
                                                        <tr class="terminarVisita">
                                                                <td>12</td>
                                                                <td>Candice</td>
                                                                <td>Valdez</td>
                                                                <td>Luis Miguel Escalada</td>
                                                                <td>M3</td>
                                                                <td>13:00</td>
                                                                 <td><div class="progress progress-striped active no-margin">
                                                                        <div class="progress-bar progress-bar-success" style="width: 55%" role="progressbar">55%</div>
                                                                    </div>
                                                                </td>
                                                                <td>14:00</td>
                                                        </tr>
                                                </tbody>
                                        </table>
                                </div>
                        </div>
                </div>
            </article>
        </div>
    </div>';
    $retval .=frm_nueva_visita();
    $retval .=frm_termina_visita();
    return $retval;
}

function frm_nueva_visita() {
    $retval = '';
    $retval .='<div class="modal fade" id="nuevaVisita" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
                                                    
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title" id="myModalLabel">Registrar Visita</h4>
							</div>
							<div class="modal-body">
                                                            <form id="order-form" class="smart-form">
                                                                <fieldset>
                                                                    <div class="row">
                                                                            <div class="col-md-6">
                                                                                    <span>Coloque el dedo sobre el lector</span>
                                                                                    <label class="input">
                                                                                            <input type="text" class="form-control" placeholder="Codigo Visita" id="codigoVisitante" required />
                                                                                            <i class="icon-append fa fa-search" onclick="javascript:buscarVisita();"></i>
                                                                                    </label> 
                                                                            </div>                
                                                                    </div>
                                                                  </fieldset>   
								 <fieldset>
                                                                    <div class="row">
                                                                            <div class="col-md-6">
                                                                            <header> Datos del Visitante </header>
                                                                                    <div class="well well-sm well-primary" id="datosVisitante">
                                                                                        
                                                                                    </div>
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                            <header> Datos del PPL </header>
                                                                                    <div class="well well-sm well-primary" id="datosPpl">
                                                                                        
                                                                                    </div>
                                                                            </div>
                                                                    </div>
                                                                </fieldset>
                                                            </form>     
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">
									Cancel
								</button>
								<button type="button" class="btn btn-primary" onclick="javascript:registraVisita();">
									Registrar Visita
								</button>
							</div>
                                                     
						</div>
                                               
					</div>
				</div>';
    return $retval;
}

function frm_termina_visita() {
    $retval = '';
    $retval .='<div class="modal fade" id="terminarVisita" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
                                                    
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title" id="myModalLabel">Terminar Visita</h4>
							</div>
							<div class="modal-body">
                                                            <form id="order-form" class="smart-form">
								 <fieldset>
                                                                    <div class="row">
                                                                            <div class="col-md-6">
                                                                            <h1> Visitante </h1>
                                                                                        <section>
                                                                                            <img alt="demo user" src="uploads/imagenes/visitas/WillianEspinosa.png" style="width: 139px;">
                                                                                        </section> 
                                                                            </div>
                                                                            <div class="col-md-6">
                                                                            <h1> PPL </h1>
                                                                                       <section>
                                                                                            <img alt="demo user" src="uploads/imagenes/ppl/JuanPerez.jpg" style="width: 139px;">
                                                                                        </section>  
                                                                            </div>
                                                                    </div>
                                                                </fieldset>
                                                            </form>     
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">
									Cancel
								</button>
								<button type="button" class="btn btn-primary" onclick="javascript:TerminarVisita();">
									Terminar Visita
								</button>
							</div>
                                                     
						</div>
                                               
					</div>
				</div>';
    return $retval;
}

function consultadatosVisitante() {
    global $dbmysql;
    $retval = '';
    $codigo = '';
    $datosPersonales = array();
    /* @var $_POST type */
    $codigo = $_POST['codigo'];
    $sql = "SELECT v.*,p.* FROM sys_visitante v, `sys_parentesco` p WHERE p.PAR_COD=v.PAR_COD AND v.VIS_CEDULA = '$codigo'";
    $val_s = $dbmysql->query($sql);
    if ($val_s->num_rows > 0) {
        $row = $val_s->fetch_object();
        $datosPersonales['datosPersonales'] = array(
            "VIS_COD" => $row->VIS_COD,
            "VIS_NOMBRE" => $row->VIS_NOMBRE,
            "VIS_APELLIDO" => $row->VIS_APELLIDO,
            "PAR_DESCRIPCION" => $row->PAR_DESCRIPCION,
            "VIS_CEDULA" => $row->VIS_CEDULA,
            "VIS_DIRECCION" => $row->VIS_DIRECCION,
            "VIS_TELEFONO" => $row->VIS_TELEFONO,
            "VIS_CORREO" => $row->VIS_CORREO,
            "VIS_IMAGEN" => $row->VIS_IMAGEN
        );
        $sql_ppl = "SELECT vp.*,p.* FROM `sys_visitante_ppl` vp, `sys_ppl` p WHERE vp.`PPL_COD`=p.`PPL_COD` AND vp.VIS_COD=$row->VIS_COD;";
        $val_ppl = $dbmysql->query($sql_ppl);
        while ($row_ppl = $val_ppl->fetch_object()) {
            $sql_p2 = "SELECT ppa.*,ppl.*,ce.*,pa.* FROM `sys_ppl` ppl,`sys_ppl_pabellon` ppa,`sys_centro` ce,`sys_pabellones` pa WHERE ppa.`PPL_COD`=ppl.`PPL_COD` AND ppa.`PAB_COD`=pa.`PAB_COD` AND ppa.`CEN_COD`=ce.`CEN_COD` AND ppl.`PPL_COD`=$row_ppl->PPL_COD";
            $val_p2 = $dbmysql->query($sql_p2);
            $row_p2 = $val_p2->fetch_object();
            $datosPersonales['datosPpl'] = array(
                "PPL_COD" => $row_ppl->PPL_COD,
                "PPL_NOMBRE" => $row_ppl->PPL_NOMBRE,
                "PPL_APELLIDO" => $row_ppl->PPL_APELLIDO,
                "PPL_CEDULA" => $row_ppl->PPL_CEDULA,
                "PPL_IMG" => $row_ppl->PPL_IMG,
                "CEN_DESCRIPCION" => $row_p2->CEN_DESCRIPCION,
                "PAB_DESCRIPCION" => $row_p2->PAB_DESCRIPCION
            );
        }

//        $retval = utf8_encode($datosPersonales);
        $retval = json_encode($datosPersonales);
//        print_r($datosPersonales);exit;
        echo $retval;
    } else {
        echo 'nada';
    }
}

function registraVisitante() {
    global $dbmysql;
    $codigoVisita = $_POST['codigoVisita'];
    $codigoppl = $_POST['codigoppl'];
    $fecha=date('Y-m-d');
    $horaIngreso=date('H:i');
    $horaSalida=date('H:i');
    $retval = '';
    $sql = "INSERT INTO sys_visitas (
            VIS_COD,
            PPL_COD,
            VISG_FECHA,
            VISG_HORA_INGRESO,
            VISG_HORA_SALIDA
            )VALUES('','$codigoVisita','$codigoppl','$fecha','$horaIngreso','');";
    $val_s = $dbmysql->query($sql);
    return $retval;
}
