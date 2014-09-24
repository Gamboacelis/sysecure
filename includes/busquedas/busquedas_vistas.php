<?php
session_start();
date_default_timezone_set('America/Bogota');
include_once 'D:/Compartida/htdocs/sysecure/includes/conexiones/db_local.inc.php';
$dbmysql = new database();
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'frm_busquedasGenerales':
        frm_busquedasGenerales();
        break;
}

function frm_busquedasGenerales() {
    global $dbmysql;
    $retval = '';
    $valBusqueda=$_POST['valBusqueda'];
    $sql="SELECT vp.*,v.*,par.* FROM  sys_visitante_ppl vp,`sys_visitante` v, `sys_parentesco` par 
          WHERE vp.VIS_COD=v.VIS_COD AND vp.PAR_COD=par.PAR_COD  AND `VIS_NOMBRE` LIKE '%$valBusqueda%' OR `VIS_APELLIDO` LIKE '%$valBusqueda%' OR `VIS_CEDULA` = '$valBusqueda'";
    $val = $dbmysql->query($sql);
    
    $retval = '<div class="row">
                        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-4">
                            <h1 class="page-title txt-color-blueDark"><i class="fa-fw fa fa-home"></i> Inicio <span>>  Busquedas ...</span></h1>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-md-5 col-lg-8">
                            <ul id="sparks" class="">
                                <li class="sparks-info">
                                    <h5>
                                        Palabra Buscada:
                                        <span class="txt-color-greenDark">'.$valBusqueda.'</span>
                                    </h5>
                                </li>
                            </ul>
                        </div>
                    </div>
                <div class="col-sm-12 widget-body">
                                    <h1> Buscar <span class="semi-bold">Todo</span></h1>
                                    <br>
                                    <h1 class="font-md"> Resultados para la Busqueda <small class="text-danger"> &nbsp;&nbsp;('.$val->num_rows.' resultados)</small></h1>';
                             while($row = $val->fetch_object()){ 
                                    $estado=($row->VIS_ESTADO=='A')?'<span class="label label-success"><i class="fa fa fa-check"></i>  Validado</span>':'<span class="label label-warning"><i class="fa fa-question-circle"></i>  No Validado</span>';
                                    $sql1="SELECT vp.*,p.PPL_COD,p.PAB_COD,p.PPL_NOMBRE, p.PPL_APELLIDO, p.PPL_CEDULA, p.PPL_NACIONALIDAD,v.`VISG_COD`,v.`VIP_COD`,v.`HOR_COD`,MAX(v.`VISG_FECHA`) AS FechaVisita,v.`VISG_HORA_INGRESO`,v.`VISG_HORA_SALIDA`,v.`VISG_ESTADO` FROM   `sys_ppl` p,`sys_visitante_ppl` vp,  `sys_visitas` v WHERE p.PPL_COD = vp.PPL_COD AND vp.VIP_COD=v.VIP_COD  AND vp.VIP_COD = '$row->VIP_COD'";
                                    $val1 = $dbmysql->query($sql1);
                                    $row1 = $val1->fetch_object();
                                    $img=($row->VIS_IMAGEN!='')?PATH_VISITAS.$row->VIS_IMAGEN:'img/avatars/male.png';
                                   $retval .= '<div class="search-results">
                                                <h4><i class="fa fa-plus-square txt-color-blue"></i>&nbsp;<a href="javascript:void(0);">'.$row->VIS_NOMBRE.' '.$row->VIS_APELLIDO.'</a></h4>
                                                    <img alt="'.$row->VIS_NOMBRE.' '.$row->VIS_APELLIDO.'" src="'.$img.'" class="img-thumbnail img-circle" style="width: 60px">
                                                    <div>
                                                        <div>'.$estado.'</div>
                                                        <div class="url text-success">
                                                                '.$row->PAR_DESCRIPCION.' <i class="fa fa-caret-down"></i>
                                                        </div>
                                                        <p class="description">
                                                            Ultima Visita: '.$row1->FechaVisita.'
                                                            <br>
                                                            PPL Visitado: '.$row1->PPL_NOMBRE.' '.$row1->PPL_APELLIDO.'
                                                            <br>
                                                            <br>
                                                            <!--a class="btn btn-default btn-xs" href="javascript:void(0)">Mas detalles</a-->
                                                        </p>
                                                    </div>
                                                </div>';
                            }
		$retval .= '</div>';
    echo $retval;
}