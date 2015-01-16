$(document).ready(function() {
    $('#listaAcceso3').dataTable({
        "bServerSide": true,
        "sAjaxSource": "includes/controles/acceso3/acceso3_dataTable.php",
        "oLanguage": {
            "sEmptyTable": "No hay datos disponibles en la tabla",
            "sInfo": "Existen _TOTAL_ registros en total, mostrando (_START_ a _END_)",
            "sInfoEmpty": "No hay entradas para mostrar",
            "sInfoFiltered": " - Filtrado de registros _MAX_",
//            "sSearch": "Buscar: ",
            "sZeroRecords": "No hay registros que mostrar"
        }
    });
    recargarVisitantesFuncionarios();
    $('#cedulaf').focusout(function(e) {
        if ($(this).val() !== '') {
            var cedula = $(this).val();
            $.ajax({
                url: './includes/visitante/visitantes_model.php?opcion=enviarDatosVisitanteGeneral',
                datetype: "json",
                type: 'POST',
                data: {cedula: cedula},
                success: function(res) {
                    if (res !== '') {
                        var json_obj = $.parseJSON(res);
                        $("#IDvisitantef").val(json_obj.datosVisitante.VIS_COD);
                        $("#nombref").val(json_obj.datosVisitante.VIS_NOMBRE);
                        ($("#nombref").val()!=='')?$("#nombref").prop('disabled', true):$("#nombref").prop('disabled', false);
                        $("#apellidof").val(json_obj.datosVisitante.VIS_APELLIDO);
                        ($("#apellidof").val()!=='')?$("#apellidof").prop('disabled', true):$("#apellidof").prop('disabled', false);
                        $("#telefonof").val(json_obj.datosVisitante.VIS_TELEFONO);
                        ($("#telefonof").val()!=='')?$("#telefonof").prop('disabled', true):$("#telefonof").prop('disabled', false);
                        $("#cedulaf").val(json_obj.datosVisitante.VIS_CEDULA);
                        ($("#cedulaf").val()!=='')?$("#cedulaf").prop('disabled', true):$("#cedulaf").prop('disabled', false);
                        $("#direccionf").val(json_obj.datosVisitante.VIS_DIRECCION);
                        ($("#direccionf").val()!=='')?$("#direccionf").prop('disabled', true):$("#direccionf").prop('disabled', false);
                        $("#correof").val(json_obj.datosVisitante.VIS_CORREO);
                        ($("#correof").val()!=='')?$("#correof").prop('disabled', true):$("#correof").prop('disabled', false);
                    }
                }
            });

        }
    });
    $('input[type="search"]').keyup(function(e) {
        if (e.keyCode == 13) {
            $("#buscar").trigger("click");
        }

    });
});
function recargarVisitantesFuncionarios(){
    var dtTable=$('#listaAccesoFuncionarios3').dataTable({
                "bDestroy": true,
                "bRetrieve": true,
                "bStateSave": true,
                "bPaginate": true,
                "bServerSide": true,
                "sAjaxSource": "includes/controles/acceso3/accesoFuncionarios3_dataTable.php",
                "oLanguage": {
                    "sEmptyTable": "No hay datos disponibles en la tabla",
                    "sInfo": "Existen _TOTAL_ registros en total, mostrando (_START_ a _END_)",
                    "sInfoEmpty": "No hay entradas para mostrar",
                    "sInfoFiltered": " - Filtrado de registros _MAX_",
                    "sZeroRecords": "No hay registros que mostrar"
                }
            });
    dtTable.fnReloadAjax();
}
function permitirAcceso3(nombre, vipcontrol, pplcod, codControl, horario) {
    $.SmartMessageBox({
        title: "Confirmación!",
        content: "Esta seguro que desea permitir el aceeso del visitante " + nombre + "?",
        buttons: '[No][Si]'
    }, function(ButtonPressed) {
        if (ButtonPressed === "Si") {
            $.ajax({
                url: "./includes/controles/acceso3/acceso3_model.php?opcion=permitirAcceso3",
                type: 'post',
                data: {vipcontrol: vipcontrol, pplcod: pplcod, codControl: codControl, horario: horario},
                success: function(respuesta) {
                    if (respuesta !== '0') {
                        $.smallBox({
                            title: nombre,
                            content: "<i class='fa fa-clock-o'></i> <i>Acceso del visitante Permitido...</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
//                        $("#verlugarCedula").html('<strong>'+respuesta+'</strong>');
//                        $("#txtCedula").html('<i> Visitante: '+nombre+'</i>');
//                        $("#frmCedulaModal").modal('show');
////                             
//                       $('#closeModalCedula').click(function(){
                        $('#cod_' + vipcontrol).parent('td').parent('tr').remove();
                        var message = respuesta;
                        send(message);
                        console.log(message);
//                       });
                    }
                },
                error: function() {
                    $.smallBox({
                        title: nombre,
                        content: "<i class='fa fa-clock-o'></i> <i>Error durante el proceso, datos no guardados</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                }
            });
        }
    });
}
function permitirAccesoFuncionario3(nombre, visCod) {
    $.SmartMessageBox({
        title: "Confirmación!",
        content: "Esta seguro que desea permitir el aceeso del visitante " + nombre + "?",
        buttons: '[No][Si]'
    }, function(ButtonPressed) {
        if (ButtonPressed === "Si") {
            $.ajax({
                url: "./includes/controles/acceso3/acceso3_model.php?opcion=permitirAccesoFuncionario3",
                type: 'post',
                data: {visCod: visCod},
                success: function(respuesta) {
                    if (respuesta !== '0') {
                        $.smallBox({
                            title: nombre,
                            content: "<i class='fa fa-clock-o'></i> <i>Acceso del visitante Permitido...</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                        $('#cod_' + visCod).parent('td').parent('tr').remove();
                    }
                },
                error: function() {
                    $.smallBox({
                        title: nombre,
                        content: "<i class='fa fa-clock-o'></i> <i>Error durante el proceso, datos no guardados</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                }
            });
        }
    });
}
function closeModalCedula() {
    $("#frmCedulaModal").modal('hide');
}
function crearVisitanteFuncionario() {
    $("#frmVisitaFuncionarioModal").modal('show');
}
function negarAcceso3(codVisita, codVisitante) {

    var mensaje = "Describa la razón de la sanción: ";
    $.SmartMessageBox({
        title: "Alerta..!",
        content: mensaje,
        buttons: "[Aceptar][Cancelar]",
        input: "text",
        placeholder: "Describa la razón",
        inputValue: "",
    }, function(ButtonPress, Value) {

        if (ButtonPress === "Aceptar") {
            if (Value !== '') {
                $.ajax({
                    url: "./includes/controles/acceso3/acceso3_model.php?opcion=bloquearAceeso3",
                    type: 'post',
                    data: {codigo: codVisita, visitante: codVisitante, razon: Value},
                    success: function(respuesta) {
                        if (respuesta === '1') {
                            $.smallBox({
                                title: 'Visitante Sancionado..!',
                                content: "<i class='fa fa-clock-o'></i> <i>Aceeso al visitante denegado...</i>",
                                color: "#659265",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 5000
                            });
                            $('#cod_' + codVisita).parent('td').parent('tr').remove();
                        }
                    },
                    error: function() {
                        $.smallBox({
                            title: 'ERROR..!',
                            content: "<i class='fa fa-clock-o'></i> <i>Error durante el proceso, datos no guardados</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                    }
                });
            }
        }
    });
}

function guardarVisitanteFuncionario() {
    var IDvisitantef=$('#IDvisitantef').val(),
        cedulaf=$('#cedulaf').val(),
        nombref=$('#nombref').val(),
        apellidof=$('#apellidof').val(),
        funcionario=$('#funcionario').val(),
        razon=$('#razon').val(),
        telefonof=$('#telefonof').val(),
        correof=$('#correof').val(),
        direccionf=$('#direccionf').val();
    $.ajax({
        url: './includes/visitante/visitantes_model.php?opcion=guardaDatosVisitanteFuncionario',
        datetype: "json",
        type: 'POST',
        data: {IDvisitantef:IDvisitantef,cedulaf:cedulaf,nombref:nombref,apellidof:apellidof,funcionario:funcionario,razon:razon,telefonof:telefonof,correof:correof,direccionf:direccionf},
        success: function(res) {
            if (res === '1') {
                $.smallBox({
                    title: "Visitante Almacenado",
                    content: "<i class='fa fa-clock-o'></i> <i>Visitante Agregado correctamente...</i>",
                    color: "#659265",
                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                    timeout: 4000
                });
                $("#frmVisitaFuncionarioModal").modal('hide');
                recargarVisitantesFuncionarios();
            }
        }
    });
}