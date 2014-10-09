<?php

session_start();
date_default_timezone_set('America/Bogota');
include_once PATH_PROD.SISTEM_NAME.'/includes/conexiones/db_local.inc.php';
$dbmysql = new database();

function reporteVisitas() {
    $retval = '';
    $retval ='<article class="col-sm-12 col-md-12 col-lg-10">
                <div class="jarviswidget" id="wid-id-2" data-widget-colorbutton="false" data-widget-editbutton="false" data-widget-custombutton="false">
                    <header>
                        <span class="widget-icon"> <i class="fa fa-edit"></i> </span>
                        <h2>Plugins & Enhancers </h2>
                    </header>
                    <div>
                        <div class="widget-body">
                            <form class="">
                                <fieldset>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                    <div class="input-group">
                                                            <input class="form-control" id="fdesde" name="fdesde" type="text" placeholder="Fecha Desde">
                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                    </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                                <div class="form-group">
                                                        <div class="input-group">
                                                                <input class="form-control" id="fhasta" name="fhasta" type="text" placeholder="Fecha hasta">
                                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                        </div>
                                                </div>
                                        </div>
                                    </div>
                                </fieldset>
                                <fieldset style="text-align: center;">
                                    <a class="btn btn-success" href="javascript:reporteVisitas();">
                                        <i class="fa fa-check"></i>
                                        Consultar
                                    </a>
                                </fieldset>
                            </form>
                        </div>
                        <div id="muestraReporteVisitas">
                            <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="jarviswidget" id="wid-id-2" data-widget-editbutton="false">
                                        <header>
                                                <span class="widget-icon"> <i class="fa fa-bar-chart-o"></i> </span>
                                                <h2>Bar Graph </h2>
                                        </header>
                                        <div>
                                                <div class="jarviswidget-editbox">
                                                </div>
                                                <div class="widget-body no-padding">
                                                    <div id="bar-graph" class="chart no-padding"></div>
                                                </div>
                                        </div>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>';
    $retval .= '</article>';
    return $retval;
}