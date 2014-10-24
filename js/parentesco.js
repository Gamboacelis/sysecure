$(document).ready(function() {
    $( "#main" ).css( "height","750");
    $('#listaParentesco').dataTable({
        "bPaginate": true,
        "iDisplayLength": 10,
        "oLanguage": {
            "sEmptyTable": "No hay datos disponibles en la tabla",
            "sInfo": "Existen _TOTAL_ registros en total, mostrando (_START_ a _END_)",
            "sInfoEmpty": "No hay entradas para mostrar",
            "sInfoFiltered": " - Filtrado de registros _MAX_",
            "sZeroRecords": "No hay registros que mostrar"
        }
    });
    var $registerForm = $("#formParentesco").validate({
        rules: {
            tpparentesco: {required: true},
            descripcion: {required: true}
        },errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });
});
function nuevoParentesco() {
    $('#frmParentescoModal').modal('show');
    limpiarFormularioParentesco();
    $('#formParentesco >header').text('Registro Nuevo Parentesco')
    $('#IDParentesco').val('');
}
function limpiarFormularioParentesco() {
    $("#descripcion").val('');  /*Descripcion*/
    $('#tpparentesco').prop('selectedIndex', 0);/*Nivel*/
}
function guardarParentesco() {
    var parentesco = $('#IDparentesco').val();
    if (parentesco === '') {
        $.ajax({
            url: './includes/parentesco/parentesco_model.php?opcion=guardaDatosParentesco',
            datetype: "json",
            type: 'POST',
            data: $("#formParentesco").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "Parentesco Almacenado",
                        content: "<i class='fa fa-clock-o'></i> <i>Parentesco Agregado correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioParentesco();
                    $( "#main" ).css( "min-height","+=680");
                   location.reload();
                }
            }
        });
    } else {
        $.ajax({
            url: './includes/parentesco/parentesco_model.php?opcion=actualizarDatosParentesco',
            datetype: "json",
            type: 'POST',
            data: $("#formParentesco").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "Actualización",
                        content: "<i class='fa fa-clock-o'></i> <i>Parentesco Actualizado correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioParentesco();
                    $( "#main" ).css( "min-height","+=880");
                    location.reload();
                    $('#frmParentescoModal').modal('hide');
                }
            }
        });
    }
}
function editarParentesco(parentesco) {
    var url = './includes/parentesco/parentesco_model.php?opcion=enviarDatosParentesco';
    $.ajax({
        url: url,
        datetype: "json",
        type: 'POST',
        data: {parentesco: parentesco},
        success: function(res) {
            var json_obj = $.parseJSON(res);
            limpiarFormularioParentesco();
            carga_DatosIncialesParentesco(json_obj);
            $('#frmParentescoModal').modal('show');
            $('#formParentesco >header').text('Actualización de Datos Parentesco')
            $('#IDparentesco').val(parentesco);

        }
    });

}
function carga_DatosIncialesParentesco(edt) {
    $("#descripcion").val(edt.datosParentesco.PAR_DESCRIPCION);
    $('#tpparentesco').prop('selectedIndex', edt.datosParentesco.TPV_COD);
}
function eliminarParentesco(codPab, nomPab) {

    $.SmartMessageBox({
        title: "Confirmación!",
        content: "Esta seguro de eliminar el Parentesco <span class='txt-color-orangeDark'><strong>" + nomPab + " </strong></span>?",
        buttons: '[No][Si]'
    }, function(ButtonPressed) {
        if (ButtonPressed === "Si") {
            $.ajax({
                url: "./includes/parentesco/parentesco_model.php?opcion=eliminarParentesco",
                type: 'post',
                data: {codigo: codPab},
                success: function(respuesta) {
                    if (respuesta === '1') {
                        $('.' + codPab).parent('td').parent('tr').addClass('paraEliminarUsuario');
                        $('.paraEliminarUsuario').fadeOut('tr');
                        $.smallBox({
                            title: 'Parentesco: '+nomPab,
                            content: "<i class='fa fa-clock-o'></i> <i>Parentesco Eliminado...</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                    }else{
                         if (respuesta === '2') {
                             $.smallBox({
                                title: "Error..!!",
                                content: "<i class='fa fa-clock-o'></i> <i>Este Parentesco esta siendo usado no se puede eliminar</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-times fa-2x fadeInRight animated",
                                timeout: 7000
                            });
                         }
                    }
                }
            });

        }
    });
}