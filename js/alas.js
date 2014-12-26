$(document).ready(function() {
    var $registerForm = $("#formAlas").validate({
        rules: {
            descripcion: {required: true}
        },errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });
});
function nuevaAla() {
    limpiarFormularioEtapa();
    $('#formAlas >header').text('Registro Nueva Ala')
    $('#IDalas').val('');
    $('#frmAlasModal').modal('show');
}
function limpiarFormularioAla() {
    $("#descripcion").val('');  /*Descripcion*/
    $('#pabellon').prop('selectedIndex', 0);/*Nivel*/
}
function guardarAlas() {
    var pabellon = $('#IDalas').val();
    if (pabellon === '') {
        $.ajax({
            url: './includes/alas/alas_model.php?opcion=guardaDatosAlas',
            datetype: "json",
            type: 'POST',
            data: $("#formAlas").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "Etapa Almacenada",
                        content: "<i class='fa fa-clock-o'></i> <i>Ala Agregada correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioAla();
                    location.reload();
                }
            }
        });
    } else {
        $.ajax({
            url: './includes/alas/alas_model.php?opcion=actualizarDatosAlas',
            datetype: "json",
            type: 'POST',
            data: $("#formAlas").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "Actualización",
                        content: "<i class='fa fa-clock-o'></i> <i>Ala Actualizada correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioAla();
                    location.reload();
                }
            }
        });
    }
    $('#frmAlasModal').modal('hide');
}
function editarAlas(alas) {
    var url = './includes/alas/alas_model.php?opcion=enviarDatosAlas';
    $.ajax({
        url: url,
        datetype: "json",
        type: 'POST',
        data: {alas: alas},
        success: function(res) {
            var json_obj = $.parseJSON(res);
            limpiarFormularioAla();
            carga_DatosIncialesAlas(json_obj);
            $('#frmAlasModal').modal('show');
            $('#formAlas >header').text('Actualización de Datos Alas')
            $('#IDalas').val(alas);
        }
    });

}
function carga_DatosIncialesAlas(edt) {
    $("#IDalas").val(edt.datosAlas.ALA_COD);  /*Nombre*/
    $('#pabellon option[value="' + edt.datosAlas.PAB_COD + '"]').attr("selected", true);
    $("#descripcion").val(edt.datosAlas.ALA_DESCRIPCION);  /*Apellido*/
}
function eliminarAlas(codPab, nomPab) {
    $.SmartMessageBox({
        title: "Confirmación!",
        content: "Esta seguro de eliminar el Ala <span class='txt-color-orangeDark'><strong>" + nomPab + " </strong></span>?",
        buttons: '[No][Si]'
    }, function(ButtonPressed) {
        if (ButtonPressed === "Si") {
            $.ajax({
                url: "./includes/alas/alas_model.php?opcion=eliminarAlas",
                type: 'post',
                data: {codigo: codPab},
                success: function(respuesta) {
                    if (respuesta === '1') {
                        $('.' + codPab).parent('td').parent('tr').addClass('paraEliminarUsuario');
                        $('.paraEliminarUsuario').fadeOut('tr');
                        $.smallBox({
                            title: 'Ala: '+nomPab,
                            content: "<i class='fa fa-clock-o'></i> <i>Ala Eliminada...</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                    }else{
                        if (respuesta === '2') {
                            $.smallBox({
                                title: 'Error...!',
                                content: "<i class='fa fa-clock-o'></i> <i>El Ala esta siendo usada en algun Piso, No puede ser eliminada</i>",
                                color: "#C46A69",
                                iconSmall: "fa fa-check fa-2x fadeInRight animated",
                                timeout: 4000
                            });
                        }
                    }
                }
            });
        }
    });
}