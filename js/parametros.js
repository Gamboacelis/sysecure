$(document).ready(function() {
    $('#vistaparametros').dataTable();

});

function editarParametro(cod) {
    $('#vis' + cod).children('td').children('.txtVisDatos').hide();
    $('#vis' + cod).children('td').children('.visDatosGeneral').show();
    $('#vis' + cod).children('td').children('.visBtnGuardar').show();
    $('#vis' + cod).children('td').children('.visBtnDatos').hide();
}
function GuardarCambioParametro(cod, tipo) {
    if (tipo === 'N') {
        var url = './includes/ppl/ppl_model.php?opcion=guardarListaVisitante';
        var codigo = $('#IDpplNew').val();
        var nombre = $('#new').children('td').children('#visNombre').val();
        var apellido = $('#new').children('td').children('#visApellido').val();
        var parentesco = $('#new').children('td').children('#visParentesco').val();
    } else {
        var url = './includes/ppl/ppl_model.php?opcion=actualizaListaVisitante';
        var codigo = cod;
        var nombre = $('#vis' + cod).children('td').children('#visNombre').val();
        var apellido = $('#vis' + cod).children('td').children('#visApellido').val();
        var parentesco = $('#vis' + cod).children('td').children('#visParentesco').val();
    }
    $.ajax({
        url: url,
        datetype: "json",
        type: 'POST',
        data: {visCod: codigo, nombre: nombre, apellido: apellido, parentesco: parentesco},
        success: function(res) {
            if (res != '0') {
                var json_obj = $.parseJSON(res);
                if (tipo === 'N') {
                    $('#new').children('td').children('#txtVisNombre').text(json_obj.datosActualizados.nombre);
                    $('#new').children('td').children('#txtVisApellido').text(json_obj.datosActualizados.apellido);
                    $('#new').children('td').children('#txtVisParentesco').text(json_obj.datosActualizados.parentesco);
                } else {
                    $('#vis' + cod).children('td').children('#txtVisNombre').text(json_obj.datosActualizados.nombre);
                    $('#vis' + cod).children('td').children('#txtVisApellido').text(json_obj.datosActualizados.apellido);
                    $('#vis' + cod).children('td').children('#txtVisParentesco').text(json_obj.datosActualizados.parentesco);
                }
            }
            if (tipo === 'N') {
                revisarVisitantesDisponibles(json_obj.datosActualizados.codigoPPL);
            } else {
                $('#vis' + cod).children('td').children('#visNombre').val(json_obj.datosActualizados.nombre);
                $('#vis' + cod).children('td').children('#visApellido').val(json_obj.datosActualizados.apellido);
                $('#vis' + cod).children('td').children('#visParentesco').prop('selectedIndex', parentesco);
                $('#vis' + cod).children('td').children('.txtVisDatos').show();
                $('#vis' + cod).children('td').children('.visDatos').hide();
                $('#vis' + cod).children('td').children('.visBtnGuardar').hide();
                $('#vis' + cod).children('td').children('.visBtnDatos').show();
            }
            $.smallBox({
                title: "Actualización",
                content: "<i class='fa fa-clock-o'></i> <i>Visitante Actualizado correctamente...</i>",
                color: "#659265",
                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                timeout: 4000
            });
        }
    });
}