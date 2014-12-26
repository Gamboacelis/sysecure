$(document).ready(function() {
    var $registerForm = $("#formEtapas").validate({
        rules: {
            descripcion: {required: true}
        },errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });
});
function nuevaEtapa() {
    limpiarFormularioEtapa();
    $('#formEtapas >header').text('Registro Nueva Etapa')
    $('#IDetapa').val('');
    $('#frmEtapasModal').modal('show');
}
function limpiarFormularioEtapa() {
    $("#descripcion").val('');  /*Descripcion*/
}
function guardarEtapas() {
    var pabellon = $('#IDetapa').val();
    if (pabellon === '') {
        $.ajax({
            url: './includes/etapas/etapas_model.php?opcion=guardaDatosEtapas',
            datetype: "json",
            type: 'POST',
            data: $("#formEtapas").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "Etapa Almacenada",
                        content: "<i class='fa fa-clock-o'></i> <i>Etapa Agregada correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioEtapa();
                    location.reload();
                }
            }
        });
    } else {
        $.ajax({
            url: './includes/etapas/etapas_model.php?opcion=actualizarDatosEtapas',
            datetype: "json",
            type: 'POST',
            data: $("#formEtapas").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "Actualización",
                        content: "<i class='fa fa-clock-o'></i> <i>Etapa Actualizado correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioEtapa();
                    location.reload();
                }
            }
        });
    }
    $('#frmEtapasModal').modal('hide');
}
function editarEtapas(etapas) {
    var url = './includes/etapas/etapas_model.php?opcion=enviarDatosEtapas';
    $.ajax({
        url: url,
        datetype: "json",
        type: 'POST',
        data: {etapas: etapas},
        success: function(res) {
            var json_obj = $.parseJSON(res);
            limpiarFormularioEtapa();
            carga_DatosIncialesEtapas(json_obj);
            $('#frmEtapasModal').modal('show');
            $('#formEtapas >header').text('Actualización de Datos Etapas')
            $('#IDetapa').val(etapas);
        }
    });

}
function carga_DatosIncialesEtapas(edt) {
    $("#IDetapa").val(edt.datosEtapas.NVL_COD);  /*Nombre*/
    $("#descripcion").val(edt.datosEtapas.NVL_DESCRIPCION);  /*Apellido*/
}
function eliminarEtapas(codPab, nomPab) {
    $.SmartMessageBox({
        title: "Confirmación!",
        content: "Esta seguro de eliminar la Etapa <span class='txt-color-orangeDark'><strong>" + nomPab + " </strong></span>?",
        buttons: '[No][Si]'
    }, function(ButtonPressed) {
        if (ButtonPressed === "Si") {
            $.ajax({
                url: "./includes/etapas/etapas_model.php?opcion=eliminarEtapas",
                type: 'post',
                data: {codigo: codPab},
                success: function(respuesta) {
                    if (respuesta === '1') {
                        $('.' + codPab).parent('td').parent('tr').addClass('paraEliminarUsuario');
                        $('.paraEliminarUsuario').fadeOut('tr');
                        $.smallBox({
                            title: 'Etapa: '+nomPab,
                            content: "<i class='fa fa-clock-o'></i> <i>Etapa Eliminada...</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                    }else{
                        if (respuesta === '2') {
                            $.smallBox({
                                title: 'Error...!',
                                content: "<i class='fa fa-clock-o'></i> <i>La Etapa esta siendo usada en algun Pabellon, No puede ser eliminada</i>",
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