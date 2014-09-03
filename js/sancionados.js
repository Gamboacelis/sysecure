$(document).ready(function() {
//    pageSetUp();
    $('#listaSanciones').dataTable({
        "bServerSide": true,
        "sAjaxSource": "includes/sanciones/sancion_dataTable.php",
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


function editarSancion(visitante,sancion) {

    var url = './includes/sanciones/sancion_model.php?opcion=enviarDatosSanciones';

    $.ajax({

        url: url,

        datetype: "json",

        type: 'POST',

        success: function(res) {



                $('#sancion').html(res);

                $('#frmAsignarSancion').modal('show');


                $('#smart-form-register >header').text('Actualización de Visitante');

                $('#IDvisitante').val(visitante);
                $('#IDsancion').val(sancion);



        }

    });



}

function guardarSancion(visitante) {


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