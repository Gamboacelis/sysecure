$(document).ready(function() {
//    pageSetUp();
    $('#listaTipoSanciones').dataTable({
        "bServerSide": true,
        "sAjaxSource": "includes/sanciones/mantenimiento/sancion_dataTable.php",
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


function editarTipoSancion(codigoTipoSancion)
{
    var url = './includes/sanciones/mantenimiento/sancion_model.php?opcion=enviarDatosTipoSanciones';
    $.ajax({
        url: url,
        datetype: "json",
        type: 'POST',
        data: {codigoTipoSancion: codigoTipoSancion},
        success: function(res) {
            var json_obj = $.parseJSON(res);
            limpiarFormularioPpl();
            cargaDatosIncialesTipoSancion(json_obj);
            $('#IDtipoSancion').val(codigoTipoSancion);
            $('#frmTipoSancion').modal('show');
            $('#smart-form-ppl >header').text('Actualización de tipo de sancion');
            
        }
    });

}

function limpiarFormulario() {
    $("#IDtipoSancion").val('');  /*Nombre*/
    $("#tipoSancion").val('');  /*Apellido*/
 
}


function cargaDatosIncialesTipoSancion(edt) {
   
    $("#tipoSancion").val(edt.datosTipoSancion.TPS_DESCRIPCION);  

}


function guardarTipoSancion() {


    var tipoSancion = $('#IDtipoSancion').val();

    if (tipoSancion != '') {

        $.ajax({
            

            url: './includes/sanciones/mantenimiento/sancion_model.php?opcion=editaDatosTipoSancion',

            datetype: "json",

            type: 'POST', 

            data: $("#smart-form-register").serialize(),  

            success: function(res) { 

                if (res === '1') {

                    $.smallBox({

                        title: "Tipo de sancion actualizada",

                        content: "<i class='fa fa-clock-o'></i> <i>Tipo de sancion actualizada correctamente...</i>",

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

            url: './includes/sanciones/mantenimiento/sancion_model.php?opcion=guardaDatosTipoSancion',

            datetype: "json",

            type: 'POST',

            data: $("#smart-form-register").serialize(),

            success: function(res) {

                if (res === '1') {

                    $.smallBox({

                        title: "Creacion",

                        content: "<i class='fa fa-clock-o'></i> <i>Tipo de sancion Creado correctamente...</i>",

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

    $('#frmTipoSancion').modal('hide');

}

function nuevoTipoSancion()
{
    limpiarFormularioPpl();
    $('#frmTipoSancion').modal('show');
}

function gestionarSancion()
{
     $('#frmSancionesModal').modal('show');
}