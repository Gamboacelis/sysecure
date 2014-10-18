<?php

include_once './includes/conexiones/db_local.inc.php';
$dbmysql = new database();
date_default_timezone_set('America/Bogota');
$funcion = isset($_GET['opcion']) ? $_GET['opcion'] : 'ninguno';
switch ($funcion) {
    case 'reportePPL':
        consultarDatosPPL();
        break;
    case 'mostrarDatosPpl':
        mostrarDatosPpl();
        break;
}

function consultarDatosPPL() {
    global $dbmysql;
    $nombreppl = $_POST['nombreppl'];
    $retval = '';
    $separaNombre=  explode(' ', $nombreppl);
    switch (count($separaNombre)) {
        case 1:
            $nom1=$separaNombre[0];
            $nom2=$separaNombre[0];
            break;
        case 2:
            $nom1=$separaNombre[0];
            $nom2=$separaNombre[1];
            break;
        case 3:
            $nom1=$separaNombre[0];
            $nom2=$separaNombre[1].' '.$separaNombre[2];
            break;
        case 4:
            $nom1=$separaNombre[0].' '.$nom2=$separaNombre[1];
            $nom2=$separaNombre[2].' '.$separaNombre[3];
            break;
        default:
            break;
    }
    $sql="SELECT * FROM `sys_ppl` WHERE (`PPL_NOMBRE` LIKE '%$nom1%' OR `PPL_APELLIDO` LIKE '%$nom1%') OR  (`PPL_NOMBRE` LIKE '%$nom2%' OR  `PPL_APELLIDO` LIKE '%$nom2%')";
    $val = $dbmysql->query($sql);
    if($val->num_rows>0){                
    $retval = '<div class="row">
                <div class="well col-sm-12 col-md-12 col-lg-6">
                    <div>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                </tr>
                            </thead>
                            <tbody style="font-size:0.8em;">';
                    while ($row = $val->fetch_object()){
                        $retval .='<tr class="conPpl" onclick="javascript:consultaDatosPPL('.$row->PPL_COD.');">'
                                    . '<td><i class="fa fa-user text-muted"></i></td>'
                                    . '<td>'.$row->PPL_NOMBRE.'</td>'
                                    . '<td>'.$row->PPL_APELLIDO.'</td>'
                                . '</tr>';
                    }
                 $retval .= '</tbody>
                        </table>
                    </div>
                </div>
                <div class="well col-sm-12 col-md-12 col-lg-6" id="datosPpl">
                    
                </div>
            </div>';
    }else{
        $retval = '<div class="row">
                        <div class="well col-sm-12 col-md-12 col-lg-6">
                            <div>
                                <p style="color:red;">No existen registros</p>
                            </div>
                        </div>    
                    </div>';
    }
    echo $retval;
}

function mostrarDatosPpl() {
    global $dbmysql;
    $ppl = $_POST['ppl'];
    $retval = '';
    $sql="SELECT p.`PPL_COD`,p.`PAB_COD`,pa.`PAB_DESCRIPCION`,p.`PPL_NOMBRE`,p.`PPL_APELLIDO`,p.`PPL_CEDULA`,p.`PPL_NACIONALIDAD`FROM `sys_ppl` p, sys_pabellones pa WHERE p.`PAB_COD`=pa.`PAB_COD` AND p.`PPL_COD`=$ppl;";
    $val = $dbmysql->query($sql);
    $row = $val->fetch_object();
    $sql2="SELECT h.*,tv.TPV_DESCRIPCION FROM `sys_horarios`h ,`sys_tipovisita` tv WHERE h.`TPV_COD`=tv.`TPV_COD` AND h.`PAB_COD` = $row->PAB_COD AND h.HOR_ESTADO = 'A';";
    $val2 = $dbmysql->query($sql2);
    $retval .= '<div>
                    <h1><strong style="text-align:center;">' . $row->PPL_NOMBRE . ' '.$row->PPL_APELLIDO.'</strong><small><br><i class="fa fa-lock text-muted"></i> &nbsp;'.$row->PPL_NACIONALIDAD.'</small></h1>
                    <div class="row">';
                    if($val2->num_rows>0){
                    while($row2 = $val2->fetch_object()){
                        $retval .= '<div class="dl-horizontal col col-12">
                                        <dt><strong class="text-danger">Horario: </strong></dt>
                                        <dd class="text-primary">' . $row2->HOR_DESCRIPCION . '</dd>
                                        <dt><strong class="text-danger">Dia: </strong></dt>
                                        <dd class="text-primary">' . $row2->HOR_DIAS . '</dd>
                                        <dt><strong class="text-danger">Hora Ingreso: </strong></dt>
                                        <dd class="text-primary">' . $row2->HOR_HORA_ING. ' </dd>
                                        <dt><strong class="text-danger">Hora Salida: </strong></dt>
                                        <dd class="text-primary">' . $row2->HOR_HORA_SAL. ' </dd>
                                        <dt><strong class="text-danger">Tipo de Visitas: </strong></dt>
                                        <dd class="text-primary">' . $row2->TPV_DESCRIPCION. ' </dd>
                                </div><hr style="color: #0056b2;" />';
                    }
                    }else{
                        $retval .= '<div class="col col-12">
                                        <p style="color:red;"><strong>Este Ppl no Tiene Horarios de Visitas</strong></a>
                                    </div>';    
                    }
        $retval .= '</div>
                </div>';
    
    echo $retval;
}
