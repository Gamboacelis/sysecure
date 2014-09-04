$(document).ready(function() {
//    pageSetUp();
    $('#listaVisitantes').dataTable({
        "bServerSide": true,
        "sAjaxSource": "includes/visitante/visitantes_dataTable.php",
        "oLanguage": {
            "sEmptyTable": "No hay datos disponibles en la tabla",
            "sInfo": "Existen _TOTAL_ registros en total, mostrando (_START_ a _END_)",
            "sInfoEmpty": "No hay entradas para mostrar",
            "sInfoFiltered": " - Filtrado de registros _MAX_",
//            "sSearch": "Buscar: ",
            "sZeroRecords": "No hay registros que mostrar"
        }
    });
});

         
function editarVisitante(visitante) {

    var url = './includes/visitante/visitantes_model.php?opcion=enviarDatosVisitante';

    $.ajax({

        url: url,

        datetype: "json",

        type: 'POST',

        data: {codigoVis: visitante},

        success: function(res) {

            var json_obj = $.parseJSON(res);

            limpiarFormulario();

            carga_DatosIncialesUsuarios(json_obj);

            $('#frmVisitanteModal').modal('show');


            $('#smart-form-register >header').text('Actualización de Visitante');

            $('#IDvisitante').val(visitante);



        }

    });



}

function carga_DatosIncialesUsuarios(edt) {

    $("#nombre").val(edt.datosVisitante.VIS_NOMBRE);  

    $("#apellido").val(edt.datosVisitante.VIS_APELLIDO);  

    $("#telefono").val(edt.datosVisitante.VIS_TELEFONO); 

    $("#cedula").val(edt.datosVisitante.VIS_CEDULA);  

    $("#huella").val(edt.datosVisitante.VIS_HUELLA);  

    $("#direccion").val(edt.datosVisitante.VIS_DIRECCION); 

    $("#correo").val(edt.datosVisitante.VIS_CORREO);  



}

function guardarVisitante() {


    var visitante = $('#IDvisitante').val();

    if (visitante === '') {

        $.ajax({
            

            url: './includes/visitante/visitantes_model.php?opcion=guardaDatosVisitante',

            datetype: "json",

            type: 'POST',

            data: $("#smart-form-register").serialize(),

            success: function(res) { 

                if (res === '1') {

                    $.smallBox({

                        title: "Visitante Almacenado",

                        content: "<i class='fa fa-clock-o'></i> <i>Visitante Agregado correctamente...</i>",

                        color: "#659265",

                        iconSmall: "fa fa-check fa-2x fadeInRight animated",

                        timeout: 4000

                    });

                    limpiarFormulario();

                    location.reload();

                }


            },
            error: function (res)
            {
                alert("error al guardar la informacion en la base de datos.")
            }
            

        });

    } else {


        $.ajax({

            url: './includes/visitante/visitantes_model.php?opcion=actualizarDatosVisitante',

            datetype: "json",

            type: 'POST',

            data: $("#smart-form-register").serialize(),

            success: function(res) {

                if (res === '1') {

                    $.smallBox({

                        title: "Actualización",

                        content: "<i class='fa fa-clock-o'></i> <i>Visitante Actualizado correctamente...</i>",

                        color: "#659265",

                        iconSmall: "fa fa-check fa-2x fadeInRight animated",

                        timeout: 4000

                    });

                    limpiarFormulario();

                    location.reload();

                }

            }

        });

    }

    $('#frmVisitanteModal').modal('hide');

}

function nuevoVisitante() {

    $('#frmVisitanteModal').modal('show');

    limpiarFormulario();

    $('#smart-form-register >header').text('Registro Nuevo Usuario')

    $('#IDvisitante').val('');

}


function eliminarVisitante(cod)
{
    $.SmartMessageBox({
    title: "Confirmación!",
    content: "Esta seguro de eliminar al Visitante",
    buttons: '[No][Si]'
    }, function(ButtonPressed) {
        if (ButtonPressed === "Si") {
            $.ajax({
                url: "./includes/visitante/visitantes_model.php?opcion=eliminarVisitante",
                type: 'post',
                data: {codigo: cod},
                success: function(respuesta) {

                    if (respuesta === '1') {

                        $.smallBox({
                            title: cod,
                            content: "<i class='fa fa-clock-o'></i> <i>Visitante Eliminado...</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });

                        location.reload();

                    }
                }

                
            });


        }
        if (ButtonPressed === "No") {
        }
    });
}


function limpiarFormulario() {
    $("#nombre").val('');  /*Nombre*/
    $("#apellido").val('');  /*Apellido*/
    $("#correo").val('');  /*Usuario*/
    $("#direccion").val('');  /*E-Mail*/
    $("#telefono").val('');/*Celular*/
    $("#cedula").val('');/*Cedula*/
    $("#huella").val('');/*Cedula*/    
}