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
function mostrarCelda(){
    $('#pabellon').val();
    $.ajax({
            url: './includes/ppl/ppl_model.php?opcion=mostrarCelda',
            datetype: "json",
            type: 'POST',
            data: $("#smart-form-ppl").serialize(),
            success: function(res) {
                $('#celda').html(res);
            }
        });
}
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
    var ppl = $('#IDppl').val();
    if (ppl === '') {
        $.ajax({
            url: './includes/ppl/ppl_model.php?opcion=guardaDatosPpl',
            datetype: "json",
            type: 'POST',
            data: $("#smart-form-ppl").serialize(),
            success: function(res) {
                switch (res){
                    case '0':
                        $.smallBox({
                            title: "Error..!!",
                            content: "<i class='fa fa-clock-o'></i> <i>Problemas con el Almacenamiento, contáctese con su proveedor</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                        break;
                    case '1':
                        $.smallBox({
                            title: "PPL Almacenado",
                            content: "<i class='fa fa-clock-o'></i> <i>PPL Agregado correctamente...</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                        limpiarFormularioPpl();
                        location.reload();
                        break;
                    case '2':
                        $.smallBox({
                            title: "Error..!!",
                            content: "<i class='fa fa-clock-o'></i> <i>Huella Dactilar Existente, Revice la Huella</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 7000
                        });
                        break;
                    case '3':
                        $.smallBox({
                            title: "Error..!!",
                            content: "<i class='fa fa-clock-o'></i> <i>Ya existe un PPL con esos Datos(Nombre, Apellido, Cedula y Huella)</i>",
                            color: "#C46A69",
                            iconSmall: "fa fa-times fa-2x fadeInRight animated",
                            timeout: 7000
                        });
                        break;
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
function revisarVisitantesDisponibles(codPpl){
    $('#IDpplNew').val(codPpl);
    $.ajax({
            url: './includes/ppl/ppl_model.php?opcion=mostrarVisitantesPpl',
            datetype: "json",
            type: 'POST',
            data: {codPpl:codPpl},
            success: function(res) {
                $('#litaVisitantesPpl >tbody').html(res);
                $('#frmVisitantesModal').modal('show');
            }
        });
}
function editarVisita(cod){
    $('#vis'+cod).children('td').children('.txtVisDatos').hide();
    $('#vis'+cod).children('td').children('.visDatos').show();
    $('#vis'+cod).children('td').children('.visBtnGuardar').show();
    $('#vis'+cod).children('td').children('.visBtnDatos').hide();
}
function GuardarCambioVisita(cod,tipo){
    if(tipo==='N'){
        var url='./includes/ppl/ppl_model.php?opcion=guardarListaVisitante';
        var codigo=$('#IDpplNew').val();
        var nombre=$('#new').children('td').children('#visNombre').val();
        var apellido=$('#new').children('td').children('#visApellido').val();
        var parentesco=$('#new').children('td').children('#visParentesco').val();
    }else{
        var url='./includes/ppl/ppl_model.php?opcion=actualizaListaVisitante';
        var codigo=cod;
        var nombre=$('#vis'+cod).children('td').children('#visNombre').val();
        var apellido=$('#vis'+cod).children('td').children('#visApellido').val();
        var parentesco=$('#vis'+cod).children('td').children('#visParentesco').val();
    }
    $.ajax({
            url: url,
            datetype: "json",
            type: 'POST',
            data: {visCod:codigo,nombre:nombre,apellido:apellido,parentesco:parentesco},
            success: function(res) {
                if(res!='0'){
                    var json_obj = $.parseJSON(res);
                    if(tipo==='N'){
                        $('#new').children('td').children('#txtVisNombre').text(json_obj.datosActualizados.nombre);
                        $('#new').children('td').children('#txtVisApellido').text(json_obj.datosActualizados.apellido);
                        $('#new').children('td').children('#txtVisParentesco').text(json_obj.datosActualizados.parentesco);
                    }else{
                        $('#vis'+cod).children('td').children('#txtVisNombre').text(json_obj.datosActualizados.nombre);
                        $('#vis'+cod).children('td').children('#txtVisApellido').text(json_obj.datosActualizados.apellido);
                        $('#vis'+cod).children('td').children('#txtVisParentesco').text(json_obj.datosActualizados.parentesco);
                    }
                }
                if(tipo==='N'){
                    revisarVisitantesDisponibles(json_obj.datosActualizados.codigoPPL);
                }else{
                    $('#vis'+cod).children('td').children('#visNombre').val(json_obj.datosActualizados.nombre);
                    $('#vis'+cod).children('td').children('#visApellido').val(json_obj.datosActualizados.apellido);
                    $('#vis'+cod).children('td').children('#visParentesco').prop('selectedIndex', parentesco);
                    $('#vis'+cod).children('td').children('.txtVisDatos').show();
                    $('#vis'+cod).children('td').children('.visDatos').hide();
                    $('#vis'+cod).children('td').children('.visBtnGuardar').hide();
                    $('#vis'+cod).children('td').children('.visBtnDatos').show();
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
function nuevoVisitantePpl(){
    var codigo=$('#IDpplNew').val();
    $.ajax({
        url: './includes/ppl/ppl_model.php?opcion=validarCantidadVisitante',
        datetype: "json",
        type: 'POST',
        data: {codigo:codigo},
        success: function(res) {
            if(res==='1'){
                var tds=$("#litaVisitantesPpl tr:first td").length; // Obtenemos el total de columnas (tr) del id "tabla" 
                var trs=$("#litaVisitantesPpl tr").length; 
                var alerta=1;
                var tr = $("tr#new").attr("id");
                if(tr === undefined){
                var nuevaFila='<tr id="new">'; 
                        nuevaFila+="<td>"+(trs); 
                        nuevaFila+='<td><img src="img/avatars/male.png" class="img-thumbnail" style="width: 60px" />'; 
                        nuevaFila+='<td><div class="txtVisDatos" id="txtVisNombre"></div><input type="text" id="visNombre" name="visNombre" class="visDatos">'; 
                        nuevaFila+='<td><div class="txtVisDatos" id="txtVisApellido"></div><input type="text" id="visApellido" name="visApellido" class="visDatos">'; 
                        nuevaFila+='<td><div class="txtVisDatos" id="txtVisParentesco"></div><select id="visParentesco" name="visParentesco" class="visDatos"></select>'; 
                         $.ajax({
                            url: './includes/ppl/ppl_model.php?opcion=comboParentesco',
                            datetype: "json",
                            type: 'POST',
                            data: {alerta:alerta},
                            success: function(res) {
                                $('#new').children('td').children('#visParentesco').html(res); 
                            }
                        });
                        var valida='N',nada='';
                    nuevaFila+='<td><a class="btn btn-primary btn-xs visBtnGuardar" title="Guardar Cambio" href="javascript:GuardarCambioVisita(\''+nada+'\',\''+valida+'\')"><i class="fa fa-save"></i></a>'; 
                    nuevaFila+="</tr>"; 
                 $("#litaVisitantesPpl").append(nuevaFila); 
                 $('#new').children('td').children('.visDatos').show();
                 $('#new').children('td').children('.visBtnGuardar').show();   
             }
            }else{
                $.smallBox({
                    title: "Error..!!",
                    content: "<i class='fa fa-clock-o'></i> <i>Limite máximo de Visitantes Asignados</i>",
                    color: "#C46A69",
                    iconSmall: "fa fa-times fa-2x fadeInRight animated",
                    timeout: 6000
                });
            }
        }
    });
        
        
}
function eliminarVisitantePpl(codPar, nomCod) {

    $.SmartMessageBox({
        title: "Confirmación!",
        content: "Esta seguro de eliminar al Visitante <span class='txt-color-orangeDark'><strong>" + nomCod + " </strong></span>?",
        buttons: '[No][Si]'
    }, function(ButtonPressed) {
        if (ButtonPressed === "Si") {
            $.ajax({
                url: "./includes/ppl/ppl_model.php?opcion=eliminarVisitantePpl",
                type: 'post',
                data: {codigo: codPar},
                success: function(respuesta) {
                    if (respuesta === '1') {
                        $('.' + codPar).parent('td').parent('tr').addClass('paraEliminarUsuario');
                        $('.paraEliminarUsuario').fadeOut('tr');
                        $.smallBox({
                            title: nomCod,
                            content: "<i class='fa fa-clock-o'></i> <i>Visitante Eliminado...</i>",
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
function limpiarFormularioPpl() {
    $("#nombre").val('');  /*Ala*/
    $("#apellido").val('');  /*Descripcion*/
    $("#cedula").val('');  /*Capacidad*/
    $("#fileImagen").val('');  /*Detalles*/
    $('#pabellon').prop('selectedIndex', 0);/*Nivel*/
    $('#celda').prop('selectedIndex', 0);/*Nivel*/
}