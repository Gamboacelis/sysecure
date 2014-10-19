$(document).ready(function () {
    $('#listaHorarios').dataTable();
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
        }
    });
}

function reporteHorarios() {
    var nivel = $('#nivel').val();
    $.ajax({
        url: './includes/reportes/horarios/Rhorarios_model.php?opcion=reporteHorarios',
        datetype: "json",
        type: 'POST',
        data: {nivel: nivel},
        success: function (res) {
            $('#muestraReporteHorarios').html(res);
        }
    });
}