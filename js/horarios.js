$(document).ready(function() {
//    $('#horaIngreso').timepicker({ timeFormat: 'HH:mm' });
    $('#horaIngreso').clockpicker({placement: 'top', donetext: 'Cancelar'});
    $('#horaSalida').clockpicker({placement: 'top', donetext: 'Cancelar'});
    parametrosCalendario();
    var $cambioClaveForm = $("#smart-form-horarios").validate({
        rules: {
            dias: {required: true},
            descripcion: {required: true},
            horaIngreso: {required: true},
            horaSalida: {required: true},
            tipoVisitas: {required: true}
        },
        messages: {
            dias: {required: 'Por favor seleccione el Día de Visita'},
            descripcion: {required: 'Por favor, introduzca el nombre del Horario'},
            horaIngreso: {required: 'Por favor, Indique desde que hora la Visita'},
            horaSalida: {required: 'Por favor, Indique hasta que hora la Visita'},
            tipoVisitas: {required: 'Por favor, Indique que Tipos de Visita pueden Acceder en ese Horario'}
        },
        errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });

    $("#fechaHorario").datepicker({
//        defaultDate: "+1w",
        changeMonth: true,
        dateFormat: "yy-mm-dd"
    });
});
function mostrarHoraiosPabellon(pabellon, cantidad) {
    $('#IDpabellon').val(pabellon);
    $('#IDpabellonFrm').val(pabellon);
    $('#listaPabellones').children('tbody').children('tr').each(function() {
        $(this).removeClass('info');
    });
    $('#' + pabellon).addClass('info');
    $.ajax({
        url: "./includes/horarios/horarios_model.php?opcion=buscarHorariosPabellon",
        type: 'post',
        data: {pabellon: pabellon},
        success: function(resultado) {
            $('#tbPabellonesHorarios >tbody').html(resultado);
            $('#cantidadPpl').text(cantidad);
        }
    });
}
function asignarPPLHorario() {
    var codPabellon = $('#IDpabellon').val();
    if (codPabellon !== '') {
        $('#muestraHorarios >tbody').empty();
        $.ajax({
            url: "./includes/horarios/horarios_model.php?opcion=asignarHorariosPpl",
            type: 'post',
            data: {pabellon: codPabellon},
            success: function(resultado) {
                var json_obj = $.parseJSON(resultado);
                $('#txtAsignaPabellon').html(json_obj.datosPabellon.PAB_DESCRIPCION);
                $('#txtAsignaCantidad').html(json_obj.datosPabellon.PAB_PPL);
                $('#txtAsignaAlas').html(json_obj.datosPabellon.PAB_ALAS);
                $('#txtAsignaPisos').html(json_obj.datosPabellon.PAB_PISOS);
                $('#txtAsignaCeldas').html(json_obj.datosPabellon.PAB_CELDAS);
                $.each(json_obj.datosPplHorarios, function(key, value){
                    $('#muestraHorarios >tbody').append('<tr style="border-bottom: 1px dashed #ccc;font-size:0.8em;">\n\
                                                    <td><div style="padding: 5px;">'+json_obj.datosPplHorarios[key].HOR_DESCRIPCION+'</div></td>\n\
                                                    <td><div style="padding: 5px;">'+json_obj.datosPplHorarios[key].HOR_FECHA+'</div></td>\n\
                                                    <td><div style="padding: 5px;"><span class="badge bg-color-blue txt-color-white" style="padding: 5px">'+json_obj.datosPplHorarios[key].HOR_CANT_PPL+'</span></div></td>\n\
                                                </tr>');
                });
                $('#frmAsignarModal').modal('show');
                $('#formAsignar >header').text('Asignar Ppls a Horarios');
            }
        });
    } else {
        $.smallBox({
            title: "Error..!!",
            content: "<i class='fa fa-clock-o'></i> <i>Seleccione un Pabellon</i>",
            color: "#C46A69",
            iconSmall: "fa fa-times fa-2x fadeInRight animated",
            timeout: 4000
        });
    }
}
function guardarAsignacionHorarios() {

}
function nuevoHorario() {
    var codPabellon = $('#IDpabellon').val();
    $('.checkbox').hide();
    if (codPabellon !== '') {

        $('#frmHorariosModal').modal('show');
        limpiarFormularioHorario();
        $('#smart-form-horarios >header').text('Registro Nuevo Horario')
        $('#IDhorario').val('');

    } else {
        $.smallBox({
            title: "Error..!!",
            content: "<i class='fa fa-clock-o'></i> <i>Seleccione un Pabellon</i>",
            color: "#C46A69",
            iconSmall: "fa fa-times fa-2x fadeInRight animated",
            timeout: 4000
        });
    }
}
function abrirCalendario() {
    $('#frmCalendarioModal').modal('show');
}
function guardarHorario() {
    var horario = $('#IDhorario').val();
    var pabellon = $('#IDpabellon').val();
    if (horario === '') {
        $.ajax({
            url: './includes/horarios/horarios_model.php?opcion=guardaDatosHorario',
            datetype: "json",
            type: 'POST',
            data: $("#smart-form-horarios").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "Usuario Almacenado",
                        content: "<i class='fa fa-clock-o'></i> <i>Usuario Agregado correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioHorario();
                    $('#frmHorariosModal').modal('hide');
                    $.ajax({
                        url: "./includes/horarios/horarios_model.php?opcion=buscarHorariosPabellon",
                        type: 'post',
                        data: {pabellon: pabellon},
                        success: function(resultado) {
                            $('#tbPabellonesHorarios >tbody').html(resultado);
                        }
                    });
                } else {
                    if (res === '2') {
                        $.smallBox({
                            title: 'Duplicado...',
                            content: "<i class='fa fa-clock-o'></i> <i>El horario ingresado ya Existef</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                    }
                }
            }
        });
    } else {
        $.ajax({
            url: './includes/horarios/horarios_model.php?opcion=actualizarDatosHorario',
            datetype: "json",
            type: 'POST',
            data: $("#smart-form-horarios").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "Actualización",
                        content: "<i class='fa fa-clock-o'></i> <i>Usuario Actualizado correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioHorario();
                    $('#frmHorariosModal').modal('hide');
                    $.ajax({
                        url: "./includes/horarios/horarios_model.php?opcion=buscarHorariosPabellon",
                        type: 'post',
                        data: {pabellon: pabellon},
                        success: function(resultado) {
                            $('#tbPabellonesHorarios >tbody').html(resultado);
                        }
                    });
                } else {
                    if (res === '2') {
                        $.smallBox({
                            title: 'Duplicado...',
                            content: "<i class='fa fa-clock-o'></i> <i>El horario ingresado ya Existef</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                    }
                }
            }
        });
    }
    $('#frmUsuarioModal').modal('hide');
}
function editarHorario(horario) {
    var url = './includes/horarios/horarios_model.php?opcion=enviarDatosHorario';
    $.ajax({
        url: url,
        datetype: "json",
        type: 'POST',
        data: {horario: horario},
        success: function(res) {
            var json_obj = $.parseJSON(res);
            limpiarFormularioHorario();
            carga_DatosIncialesHorario(json_obj);
            $('#frmHorariosModal').modal('show');
            $(".checkbox").show();
            $('#smart-form-horarios >header').text('Actualización de Datos Horario')
            $('#IDhorario').val(horario);

        }
    });

}
function eliminarHorario(codPar, nomCod, codPab) {

    $.SmartMessageBox({
        title: "Confirmación!",
        content: "Esta seguro de eliminar al Horario <span class='txt-color-orangeDark'><strong>" + nomCod + " </strong></span>?",
        buttons: '[No][Si]'
    }, function(ButtonPressed) {
        if (ButtonPressed === "Si") {
            $.ajax({
                url: "./includes/horarios/horarios_model.php?opcion=eliminarHorario",
                type: 'post',
                data: {codigo: codPar},
                success: function(respuesta) {
                    if (respuesta === '1') {
                        $.ajax({
                            url: "./includes/horarios/horarios_model.php?opcion=buscarHorariosPabellon",
                            type: 'post',
                            data: {pabellon: codPab},
                            success: function(resultado) {
                                $('#tbPabellonesHorarios >tbody').html(resultado);
                            }
                        });
                        $.smallBox({
                            title: nomCod,
                            content: "<i class='fa fa-clock-o'></i> <i>Horario Eliminado...</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                    }
                }
            });

        }
        if (ButtonPressed === "No") {
        }
    });
}
function carga_DatosIncialesHorario(edt) {
    $("#descripcion").val(edt.datosHorario.HOR_DESCRIPCION);  /*Descripcion*/
    $("#horaIngreso").val(edt.datosHorario.HOR_HORA_ING);  /*Hora de Ingreso*/
    $("#horaSalida").val(edt.datosHorario.HOR_HORA_SAL);  /*Hora de Salida*/
    $('#tipoVisitas').prop('selectedIndex', edt.datosHorario.TPV_COD);
    $('#fechaHorario').val(edt.datosHorario.HOR_FECHA);/*Tipo de Usuario*/
    edt.datosHorario.HOR_ESTADO == 'A' ? $("#estado").prop("checked", true) : $("#estado").prop("checked", false);

}
function limpiarFormularioHorario() {
    $('#dias').prop('selectedIndex', 0);  /*Dias*/
    $("#descripcion").val('');  /*Descripcion*/
    $("#horaIngreso").val('');  /*Hora de Ingreso*/
    $("#horaSalida").val('');  /*Hora de Salida*/
}
function parametrosCalendario() {
    "use strict";

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    var hdr = {
        left: 'title',
        center: 'month,agendaWeek,agendaDay',
        right: 'prev,today,next'
    };

    /* initialize the calendar
     -----------------------------------------------------------------*/

    $('#calendar').fullCalendar({
        header: hdr,
        buttonText: {
            prev: '<i class="fa fa-chevron-left"></i>',
            next: '<i class="fa fa-chevron-right"></i>'
        },
        editable: true,
        droppable: true, // this allows things to be dropped onto the calendar !!!
        drop: function(date, allDay) { // this function is called when something is dropped
            // retrieve the dropped element's stored Event Object
            var originalEventObject = $(this).data('eventObject');
            // we need to copy it, so that multiple events don't have a reference to the same object
            var copiedEventObject = $.extend({}, originalEventObject);
            // assign it the date that was reported
            copiedEventObject.start = date;
            copiedEventObject.allDay = allDay;
            // render the event on the calendar
            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
            $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);
            // is the "remove after drop" checkbox checked?
            if ($('#drop-remove').is(':checked')) {
                // if so, remove the element from the "Draggable Events" list
                $(this).remove();
            }
        },
        select: function(start, end, allDay) {
            var title = prompt('Event Title:');
            if (title) {
                calendar.fullCalendar('renderEvent', {
                    title: title,
                    start: start,
                    end: end,
                    allDay: allDay
                }, true // make the event "stick"
                        );
            }
            calendar.fullCalendar('unselect');
        },
        events: [{
                title: 'Familiares',
                start: new Date(y, m, 5, 11, 13),
                description: '50 ppl',
                allDay: false,
                className: ["event", "bg-color-blue"],
                icon: 'fa-clock-o'
            }, {
                title: 'Conyugal',
                start: new Date(y, m, 5, 12, 0),
                description: '50 ppl',
                allDay: false,
                className: ["event", "bg-color-blue"],
                icon: 'fa-clock-o'
            }],
        eventRender: function(event, element, icon) {
            if (!event.description == "") {
                element.find('.fc-event-title').append("<br/><span class='ultra-light'>" + event.description +
                        "</span>");
            }
            if (!event.icon == "") {
                element.find('.fc-event-title').append("<i class='air air-top-right fa " + event.icon +
                        " '></i>");
            }
        },
        windowResize: function(event, ui) {
            $('#calendar').fullCalendar('render');
        }
    });
    /* hide default buttons */
    $('.fc-header-right, .fc-header-center').hide();
    $('#calendar-buttons #btn-prev').click(function() {
        $('.fc-button-prev').click();
        return false;
    });
    $('#calendar-buttons #btn-next').click(function() {
        $('.fc-button-next').click();
        return false;
    });
    $('#calendar-buttons #btn-today').click(function() {
        $('.fc-button-today').click();
        return false;
    });
    $('#mt').click(function() {
        $('#calendar').fullCalendar('changeView', 'month');
    });
    $('#ag').click(function() {
        $('#calendar').fullCalendar('changeView', 'agendaWeek');
    });
    $('#td').click(function() {
        $('#calendar').fullCalendar('changeView', 'agendaDay');
    });
}