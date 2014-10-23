$(document).ready(function () {
     var dtTable =$('#listaHorarios').dataTable({
        "bPaginate": true,
        "iDisplayLength": 10,
        "oLanguage": {
            "sEmptyTable": "No hay datos disponibles en la tabla",
            "sInfo": "Existen _TOTAL_ registros en total, mostrando (_START_ a _END_)",
            "sInfoEmpty": "No hay entradas para mostrar",
            "sInfoFiltered": " - Filtrado de registros _MAX_",
//            "sSearch": "Buscar: ",
            "sZeroRecords": "No hay registros que mostrar"
        }
    });
    // Date Range Picker
    $("#fdesde").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        dateFormat: "yy-mm-dd"
    });
    $("#fhasta").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        dateFormat: "yy-mm-dd"
    });
    
    $('#nivel').change(function(){
        var nivel=$(this).val();
        muestraPabellonesRep(nivel);
    })
    
});
function exportarRsanciones() {
    $("#datos_a_enviar").val($("<div>").append($("#listaReporteSancionados").eq(0).clone()).html());
    $("#FormularioExportacion").submit();
}

function exportarVisitas() {
    $("#datos_a_enviar").val($("<div>").append($("#listaReporteVisitas").eq(0).clone()).html());
    $("#FormularioExportacionVisitas").submit();
}
function exportarHorarios() {
    $("#datos_a_enviar").val($("<div>").append($("#listaReporteHorarios").eq(0).clone()).html());
    $("#FormularioExportacionHorarios").submit();
}
function reporteSancion() {
    var fdesde = $('#fdesde').val();
    var fhasta = $('#fhasta').val();
    $.ajax({
        url: './includes/reportes/sanciones/Rsanciones_model.php?opcion=reporteSancion',
        datetype: "json",
        type: 'POST',
        data: {fdesde: fdesde, fhasta: fhasta},
        success: function (res) {
            $('#muestraReporteSancion').html(res);
            $( "#main" ).css( "min-height","+=680");
            var dtTable =$('#listaSanciones').dataTable({
                "bPaginate": true,
                "iDisplayLength": 10,
                "oLanguage": {
                    "sEmptyTable": "No hay datos disponibles en la tabla",
                    "sInfo": "Existen _TOTAL_ registros en total, mostrando (_START_ a _END_)",
                    "sInfoEmpty": "No hay entradas para mostrar",
                    "sInfoFiltered": " - Filtrado de registros _MAX_",
        //            "sSearch": "Buscar: ",
                    "sZeroRecords": "No hay registros que mostrar"
                }
            });
        }
    });
}

function reporteVisitas() {
    var fdesde = $('#fdesde').val();
    var fhasta = $('#fhasta').val();
    $.ajax({
        url: './includes/reportes/visitas/Rvisitas_model.php?opcion=reporteVisitas',
        datetype: "json",
        type: 'POST',
        data: {fdesde: fdesde, fhasta: fhasta},
        success: function (res) {
            $('#muestraReporteVisitas').html(res);
            $( "#main" ).css( "min-height","+=680");
            var totHeig=$( "#listaReporteHorarios" ).height();
            $( "#main" ).css( "height","+="+totHeig );
            var dtTable =$('#listaVisitas').dataTable({
                "bPaginate": true,
                "iDisplayLength": 10,
                "oLanguage": {
                    "sEmptyTable": "No hay datos disponibles en la tabla",
                    "sInfo": "Existen _TOTAL_ registros en total, mostrando (_START_ a _END_)",
                    "sInfoEmpty": "No hay entradas para mostrar",
                    "sInfoFiltered": " - Filtrado de registros _MAX_",
                    "sZeroRecords": "No hay registros que mostrar"
                }
            });
        }
    });
}

function reporteHorarios() {
    var nivel = $('#nivel').val();
    var pabellon = $('#pabellon').val();
    $.ajax({
        url: './includes/reportes/horarios/Rhorarios_model.php?opcion=reporteHorarios',
        datetype: "json",
        type: 'POST',
        data: {nivel: nivel,pabellon:pabellon},
        success: function (res) {
            $('#muestraReporteHorarios').html(res);
            $( "#main" ).css( "min-height","+=680");
            var dtTable =$('#listaHorarios').dataTable({
                "bPaginate": true,
                "iDisplayLength": 10,
                "oLanguage": {
                    "sEmptyTable": "No hay datos disponibles en la tabla",
                    "sInfo": "Existen _TOTAL_ registros en total, mostrando (_START_ a _END_)",
                    "sInfoEmpty": "No hay entradas para mostrar",
                    "sInfoFiltered": " - Filtrado de registros _MAX_",
        //            "sSearch": "Buscar: ",
                    "sZeroRecords": "No hay registros que mostrar"
                }
            });
        }
    });
}

function muestraPabellonesRep(nivel){
    $.ajax({
        url: './includes/reportes/horarios/Rhorarios_model.php?opcion=comboPabellonesR',
        datetype: "json",
        type: 'POST',
        data: {nivel: nivel},
        success: function (res) {
            $('#RmuestraPabellones').html(res);
        }
    });
}