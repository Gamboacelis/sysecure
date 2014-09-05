$(document).ready(function() {
    $('#listaPplTraspaso').dataTable({
        "bPaginate": true,
        "iDisplayLength": 5,
        "bServerSide": true,
        "sAjaxSource": "includes/traspaso/traspaso_dataTable.php",
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

function aplicarTraspaso(cod,ppl) 
{
     var url = './includes/traspaso/traspaso_model.php?opcion=enviarDatosPabellon';

    $.ajax({

        url: url,

        datetype: "json",

        type: 'POST',

        data: {codigo: cod},

        success: function(res) {

            $('#pabellonActual').html('<strong>Pabellon actual:</strong> Pabellon '+res);
            listarPabellones();
            $('#IDppl').val(ppl);
            $('#frmAplicarTraspaso').modal('show');

            
            $('#smart-form-register >header').text('Traspaso realizado con exito');

        }

    });

    

}    

function listarPabellones()
{
    var url = './includes/traspaso/traspaso_model.php?opcion=enviarDatosPabellones';

    $.ajax({

        url: url,

        datetype: "json",

        type: 'POST',

        success: function(res) {

           $("#nuevoPabellon").html(res);

        }

    });

    
} 


function guardarTraspaso()
{
    var url = './includes/traspaso/traspaso_model.php?opcion=guardarTraspaso';
    var ppl = $('#IDppl').val();
    var pabellon = $('#nuevoPabellon').val();

    $.ajax({

        url: url,

        datetype: "json",

        type: 'POST',

        data: {codigo: ppl,codigoPabellon:pabellon},

        success: function(res) {

             if (res === '1') {

                    $.smallBox({

                        title: "Traspaso realizado",

                        content: "<i class='fa fa-clock-o'></i> <i>Traspaso realizado correctamente...</i>",

                        color: "#659265",

                        iconSmall: "fa fa-check fa-2x fadeInRight animated",

                        timeout: 4000

                    });

          
                    location.reload();

             }            

        }

    });


}