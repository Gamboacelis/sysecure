$(document).ready(function() {
    var start = new Date;
    setInterval(function() {
        $('.Timer').text((new Date - start) / 1000 + " Seconds");
    }, 1000);

    $('#listaPpl').dataTable({
        "bServerSide": true,
        "sAjaxSource": "includes/ppl/ppl_dataTable.php",
        "oLanguage": {
            "sEmptyTable": "No hay datos disponibles en la tabla",
            "sInfo": "Existen _TOTAL_ registros en total, mostrando (_START_ a _END_)",
            "sInfoEmpty": "No hay entradas para mostrar",
            "sInfoFiltered": " - Filtrado de registros _MAX_",
//            "sSearch": "Buscar: ",
            "sZeroRecords": "No hay registros que mostrar"
        }
    });
    $("#imgPpl").click(function() {
        $("#imgCambio").css({display: "block"});
    });
var $registerForm = $("#smart-form-ppl").validate({
        rules: {
            pabellon: {required: true},
            celda: {required: true},
            nombre: {required: true},
            apellido: {required: true},
            cedula: {required: true},
            fileImagen: {required: true},
            huella: {required: true}
        },
        // Messages for form validation
        messages: {
            nivel: {
                required: 'Seleecione el Nivel del Pabellon'
            },
            ala: {
                required: 'Indique el Ala en el que se encuentra',
            },
            descripcion: {
                required: 'Coloque una descripción Valida'
            }
        },
        // Do not change code below
        errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });
});
function nuevoPpl() {
    $('#frmPPLModal').modal('show');
    limpiarFormularioPpl();
//    $('#smart-form-pabellon >header').text('Registro Nuevo Pabellon')
//    $('#IDpabellon').val('');
}
function handleFileSelectImagen(evt) {
    var files = evt.target.files; // FileList object
    // Loop through the FileList and render image files as thumbnails.
    $(".cargar_btn").hide();
//    var output = [];
    $("#cargar_txt").show(); 
    if (document.getElementById('image_X')) {
        var image_x = document.getElementById('image_X');
        image_x.parentNode.removeChild(image_x);
    }
    for (var i = 0, f; f = files[i]; i++) {
        // Only process image files.
        if (!f.type.match('image.*')) {
            continue;
        }
        var reader = new FileReader();
        reader.onload = (function(theFile) {
            return function(e) {
               
                var span = document.createElement('p');
                span.innerHTML = ['<img id="image_X" class="thumb" src="', e.target.result,'" title="', escape(theFile.name), '" style="position: relative;top: 0px;width: 75px;"/>'].join('');
                document.getElementById('cargar_txt').insertBefore(span, null);
            };
        })(f);
        // Read in the image file as a data URL.
        reader.readAsDataURL(f);
    }
}
if (document.getElementById('fileImagen')) {
    document.getElementById('fileImagen').addEventListener('change', handleFileSelectImagen, false);
}
function agregarImagen(){
    
}
function cancelarImagen(){
    $("#imgCambio").hide();
    $('#fileImagen').val('');
    $(".cargar_btn").show();
    $("#cargar_txt >p").remove();
    
}

function guardarPpl(){
    var pabellon = $('#IDppl').val();
    if (pabellon === '') {
        $.ajax({
            url: './includes/ppl/ppl_model.php?opcion=guardaDatosPpl',
            datetype: "json",
            type: 'POST',
            data: $("#smart-form-ppl").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "PPL Almacenado",
                        content: "<i class='fa fa-clock-o'></i> <i>PPL Agregado correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioPpl();
                    location.reload();
                }
            }
        });
    } else {
        $.ajax({
            url: '/includes/ppl/ppl_model.php?opcion=actualizarDatosPpl',
            datetype: "json",
            type: 'POST',
            data: $("#smart-form-pabellon").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "Actualización",
                        content: "<i class='fa fa-clock-o'></i> <i>Pabellon Actualizado correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioPpl();
                    location.reload();
                }
            }
        });
    }
    $('#frmPabellonModal').modal('hide');
}

function limpiarFormularioPpl() {
    $("#nombre").val('');  /*Ala*/
    $("#apellido").val('');  /*Descripcion*/
    $("#cedula").val('');  /*Capacidad*/
    $("#fileImagen").val('');  /*Detalles*/
    $('#pabellon').prop('selectedIndex', 0);/*Nivel*/
    $('#celda').prop('selectedIndex', 0);/*Nivel*/
}