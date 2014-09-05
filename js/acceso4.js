$(document).ready(function() {
    var myTable = $('#listaAcceso4').dataTable({
        "bServerSide": true,
        "sAjaxSource": "includes/controles/acceso4/acceso4_dataTable.php",
        "oLanguage": {
            "sEmptyTable": "No hay datos disponibles en la tabla",
            "sInfo": "Existen _TOTAL_ registros en total, mostrando (_START_ a _END_)",
            "sInfoEmpty": "No hay entradas para mostrar",
            "sInfoFiltered": " - Filtrado de registros _MAX_",
            "sZeroRecords": "No hay registros que mostrar"
        }
    });
        $('#listaAcceso4').on('click', 'tr', function(event) {
            $('#frmTerminarModal').modal('show');
        });

//    $('#listaAcceso4').children('tbody').children('tr').addClass('terminarVisita');
    window.setInterval(function() {
        intervaloTranscurrido();
    }, 1000);
});

function intervaloTranscurrido() {
    $('#listaAcceso4 >tbody >tr').each(function() {
        var cod = $(this).find("td").eq(0).children('input').val();
        $.ajax({
            url: "./includes/controles/acceso4/acceso4_model.php?opcion=intervalo",
            type: 'post',
            data: {codigo: cod},
            success: function(numero) {
                var valor = Math.round(numero);
                switch (valor) {
                    case valor < 0:
                        $("#progresoTiempo" + cod).html('0 %');
                        $("#progresoTiempo" + cod).removeClass('bg-color-redLight');
                        $("#progresoTiempo" + cod).addClass('progress-bar-success');
                        break;
                    case valor >= 95:
                        $("#progresoTiempo" + cod).removeClass('progress-bar-success');
                        $("#progresoTiempo" + cod).addClass('bg-color-redLight');
                        break;
                    case valor === 100:
                        $("#progresoTiempo" + cod).html(valor + ' %');
                        break;
                    case valor > 100:
                        $("#progresoTiempo" + cod).html('100 %');
                        $("#progresoTiempo" + cod).removeClass('progress-bar-success');
                        $("#progresoTiempo" + cod).addClass('bg-color-redLight');
                        break;
                    default:
                        $("#progresoTiempo" + cod).html(valor + ' %');
                        $("#progresoTiempo" + cod).css({"width": (valor + "%")});
                        break;
                }
            }
        });

    });

}

function cerrarSesion(){
    $.SmartMessageBox({
        title: "Confirmación!",
        content: "Esta seguro que desea terminar la Sesion del Visitante?",
        buttons: '[No][Si]'
    }, function(ButtonPressed) {
        if (ButtonPressed === "Si") {
//            $.ajax({
//                url: "./includes/controles/acceso3/acceso3_model.php?opcion=permitirAcceso3",
//                type: 'post',
//                data: {vipcontrol: vipcontrol, pplcod: pplcod, codControl: codControl, horario: horario},
//                success: function(respuesta) {
//                    if (respuesta === '1') {
//                        $.smallBox({
//                            title: nombre,
//                            content: "<i class='fa fa-clock-o'></i> <i>Acceso del visitante Permitido...</i>",
//                            color: "#659265",
//                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
//                            timeout: 4000
//                        });
//                        location.reload();
//                    }
//                }
//            });
        }
    });
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
                    if (respuesta === '1') {
                        $.smallBox({
                            title: nombre,
                            content: "<i class='fa fa-clock-o'></i> <i>Acceso del visitante Permitido...</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                        location.reload();
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

function negarAcceso3(codVisita, codVisitante) {

    var mensaje = "Describa la razón de la sanción: ";
    $.SmartMessageBox({
        title: "Alerta..!",
        content: mensaje,
        buttons: "[Aceptar][Cancelar]",
        input: "text",
        placeholder: "Describa la razón"
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
                            location.reload();
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