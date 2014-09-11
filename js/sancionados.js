$(document).ready(function() {
    
});


function editarSancion(visitante,sancion) {

    var url = './includes/sanciones/sancion_model.php?opcion=enviarDatosTipoSanciones';

    $.ajax({

        url: url,

        datetype: "json",

        type: 'POST',

        success: function(res) {



                $('#sancion').html(res);

                tipo_sancion = $('#sancion').val();
                editarSancionItem(tipo_sancion)
                $('#frmAsignarSancion').modal('show');


                $('#smart-form-register >header').text('Actualización de Visitante');

                $('#IDvisitante').val(visitante);
                $('#IDsancion').val(sancion);
        }

    });
}

function seleccionSancion()
{
    tipo_sancion = $('#sancion').val();

    editarSancionItem(tipo_sancion);
}



function editarSancionItem(sancion) {

    var url = './includes/sanciones/sancion_model.php?opcion=enviarDatosSanciones';

    $.ajax({

        url: url,

        datetype: "json",

        type: 'POST',

         data: {tipo_sancion:sancion},

        success: function(res) {


                $('#sancionItem').html(res);
                tiempoSancion();

        }

    });
}


function seleccionTiempo()
{
    sancion = $('#sancionItem').val();

    tiempoSancion(sancion);
}

function tiempoSancion()
{

    sancion = $('#sancionItem').val();
    var url = './includes/sanciones/sancion_model.php?opcion=enviarDatosTiempo';

    $.ajax({

        url: url,

        datetype: "json",

        type: 'POST',

         data: {sancion:sancion},

        success: function(res) {


               $('#tiempo_sancion small').html(res);

        }

    });

}


function guardarSancion() {


 $.ajax({
            

    url: './includes/sanciones/sancion_model.php?opcion=guardarDatosSanciones',

    datetype: "json",

    type: 'POST',

    data: $("#smart-form-register").serialize(),

    success: function(res) {  
        if (res === '1') {

            $.smallBox({

                title: "Sancion actualizada",

                content: "<i class='fa fa-clock-o'></i> <i>Sancion actualizada...</i>",

                color: "#659265",

                iconSmall: "fa fa-check fa-2x fadeInRight animated",

                timeout: 4000

            });


            location.reload();

        }


    },
    error: function (res)
    {
        alert("error al guardar la informacion en la base de datos.")
    }
            

});




}

function eliminarSancion(codigo)
{
    
    $.SmartMessageBox({
    title: "Confirmación!",
    content: "Esta seguro que desea eliminar la sacion?",
    buttons: '[No][Si]'
    }, function(ButtonPressed) {

        if (ButtonPressed === "Si") {
            $.ajax({
                    

                url: './includes/sanciones/sancion_model.php?opcion=eliminarSancion',

                datetype: "json",

                type: 'POST',

                data:{IDvisitante:codigo},

                success: function(res) {  
                    if (res === '1') {

                        $.smallBox({

                            title: "Sancion eliminada",

                            content: "<i class='fa fa-clock-o'></i> <i>Sancion eliminada...</i>",

                            color: "#659265",

                            iconSmall: "fa fa-check fa-2x fadeInRight animated",

                            timeout: 4000

                        });


                        location.reload();

                    }


                },
                error: function (res)
                {
                    alert("error al guardar la informacion en la base de datos.")
                }
            });
        }
        if (ButtonPressed === "No") {
        }
    });
            
}   