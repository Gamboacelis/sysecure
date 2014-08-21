 $(document).ready(function() {
    

 });
function mostrarHoraiosPabellon(pabellon) {
    $('#IDpabellon').val(pabellon);
    $.ajax({
        url: "./includes/horarios/horarios_model.php?opcion=buscarHorariosPabellon",
        type: 'post',
        data: {pabellon: pabellon},
        success: function(resultado) {
            $('#tbPabellonesHorarios >tbody').html(resultado);
        }
    });
}
function nuevoPabellon() {
    var codPabellon=$('#IDpabellon').val();
    if(codPabellon!==''){
        $('#frmHorariosModal').modal('show');
    //    limpiarFormulario();
        $('#smart-form-horarios >header').text('Registro Nuevo Horario')
        $('#IDhorario').val('');
    }else{
        $.smallBox({
            title: "Error..!!",
            content: "<i class='fa fa-clock-o'></i> <i>Seleccione un Pabellon</i>",
            color: "#C46A69",
            iconSmall: "fa fa-times fa-2x fadeInRight animated",
            timeout: 4000
        });
    }
}
function mostrarArchivosProducto(codProd) {
    $("#dialog-Archivos").dialog({
        autoOpen: false,
        closeOnEscape: false,
        show: {
            effect: "fold",
            duration: 100
        },
        hide: {
            effect: "fold",
            duration: 100
        },
        height: 500,
        width: 680,
        modal: true,
//                cache : false,
        close: function() {
            $("#dialog-Archivos").dialog("close");
        }
    });
    $.ajax({
        url: "./includes/archivos.php?funcion=buscarArchivosProducto",
        type: 'post',
        data: {codigo: codProd},
        success: function(resultado) {
            $(".modal-dialog-archivo").html(resultado);
            $("#dialog-Archivos").dialog("open");
            $(".logoPdf").click(function(e) {
                var visualizarPdf = $(this).parent("td").siblings(".nombreArchivos").text();
                window.open("uploads/archivos/" + visualizarPdf + "", "AbrirPdf", "toolbar=0");
                e.preventDefault();
            });
        }
    });
}
function agregarNuevoProducto(nombreProd) {
    nombreProd = $('.nomDescripcionArchivo').val();
    var nom = 'val_' + nombreProd;
    if (nom !== "val_undefined") {
        $.ajax({
            url: "./includes/archivos.php?funcion=listarProductos",
            type: 'post',
            data: {nombre: nombreProd},
            success: function(resultado) {
                $(".modal-dialog-archivoProducto").html(resultado);
                $('#reporteProductos').dataTable({
                    "sPaginationType": "bootstrap",
                    "bPaginate": true,
                    "iDisplayLength": 5
                });
                $("#dialog-NuevosArchivos").dialog("open");
            }
        });
    } else {
        $.smallBox({
            title: "Error..!!",
            content: "<i class='fa fa-clock-o'></i> <i>Seleccione un Documento</i>",
            color: "#C46A69",
            iconSmall: "fa fa-times fa-2x fadeInRight animated",
            timeout: 4000
        });
    }
}
function eliminarArchivo(codArchivo) {
    $.cookie("test",1);
    
    $.ajax({
        url: "./includes/archivos.php?funcion=eliminarArchivos",
        type: 'post',
        data: {codigo: codArchivo},
        success: function(resultado) {
            $(".modal-dialog-archivo").html(resultado);
        }
    });
}

function agregarProductosArchivo(nombre) {
    var productos = '', x = 0, referProducto = '';
    var archivo = nombre;
    $("input[name='checkbox-inline']").each(function(i) {
        if ($(this).is(':checked')) {
            x = x + 1;
            productos += ';' + $(this).val();
            referProducto += $(this).parent('label').parent('td').siblings('.referenciaProducto').text() + ' ,';
        }
    });
    if (x !== 0) {
        var cant = (x === 1) ? ' El Producto ' : ' Estos ' + x + ' Productos ';
        $.SmartMessageBox({
            title: "Confirmación!",
            content: "Esta seguro de vincular " + cant + "<span class='txt-color-orangeDark'><strong>" + referProducto + "</strong></span> al Archivo " + archivo + "?",
            buttons: '[No][Si]'
        }, function(ButtonPressed) {
            if (ButtonPressed === "Si") {
                $.ajax({
                    url: "./includes/archivos.php?funcion=validaDatosArchivo",
                    type: 'post',
                    data: {productos: productos, archivo: archivo},
                    success: function(respuesta) {
                        if (respuesta !== '') {
                            $("#dialog-NuevosArchivos").dialog("close");
                            $.ajax({
                                url: "./includes/archivos.php?funcion=buscarProductoArchivo",
                                type: 'post',
                                data: {nombre: archivo},
                                success: function(resultado) {
                                    $('#dt_productosArchivo >tbody').html(resultado);
                                }
                            });
                            $.bigBox({
                                title: "Productos Agregados",
                                content: "<i class='fa fa-clock-o'></i> <i>" + respuesta + "</i>",
                                color: "#739E73",
                                timeout: 8000,
                                icon: "fa fa-check animated",
                                number: "1"
                            }, function() {
                                closedthis();
                            });
                        }
                    }
                });
            }
        });
    }
}
function closedthis() {
    $.smallBox({
        title: "Excelente.! ",
        content: "Transaccion realizada con Éxito.",
        color: "#739E73",
        iconSmall: "fa fa-cloud",
        timeout: 5000
    });
}
function eliminarArchivo(archivo, nomArchivo) {
    
    $.SmartMessageBox({
        title: "Confirmación!",
        content: "Esta seguro de Eliminar el archivo <span class='txt-color-orangeDark'><strong>" + nomArchivo + "</strong></span>?",
        buttons: '[No][Si]'
    }, function(ButtonPressed) {
        if (ButtonPressed === "Si") {
            $.ajax({
                url: "./includes/archivos.php?funcion=eliminarArchivo",
                type: 'post',
                data: {archivo: archivo,nomArchivo:nomArchivo},
                success: function(res) {
                    if(res===''){
                        $.bigBox({
                            title: "Archivo No Eliminado",
                            content: "<i class='fa fa-clock-o'></i> <i> El Archivo contiene productos vinculados, desvincule esos productos antes de continuar</i>",
                            color : "#C46A69",
                            timeout: 8000,
                            icon : "fa fa-warning shake animated",
                            number: "1"
                        }, function() {
                            closedthis();
                        });
                    }else{
                        $.smallBox({
                            title: "Eliminado.! ",
                            content: "Archivo eliminado con Éxito.",
                            color: "#739E73",
                            iconSmall: "fa fa-cloud",
                            timeout: 5000
                        });
                    }
                }
            });
        }
    });
}