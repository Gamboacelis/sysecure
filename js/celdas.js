$(document).ready(function() {
    var $registerForm = $("#formCeldas").validate({
        rules: {
            pabellon: {required: true},
            ala: {required: true},
            descripcion: {required: true}
        },errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });
});
function nuevoCelda() {
    limpiarFormularioCeldas();
    $('#formCeldas >header').text('Registro Nuevo Piso');
    $('#IDceldas').val('');
    $('#frmCeldasModal').modal('show');
}
function limpiarFormularioCeldas() {
    $("#descripcion").val('');  /*Descripcion*/
    $('#pabellon').prop('selectedIndex', 0);/*Nivel*/
    $('#ala').prop('selectedIndex', 0);/*Nivel*/
    $('#piso').prop('selectedIndex', 0);/*Nivel*/
    $('#pabellon option[value=""]').attr("selected", true);
    $('#ala option[value=""]').attr("selected", true);
    $('#piso option[value=""]').attr("selected", true);
    
}
function guardarCeldas() {
    var pabellon = $('#IDceldas').val();
    if (pabellon === '') {
        $.ajax({
            url: './includes/celdas/celdas_model.php?opcion=guardaDatosCeldas',
            datetype: "json",
            type: 'POST',
            data: $("#formCeldas").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "Etapa Almacenada",
                        content: "<i class='fa fa-clock-o'></i> <i>Ala Agregada correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioCeldas();
                    location.reload();
                }
            }
        });
    } else {
        $.ajax({
            url: './includes/celdas/celdas_model.php?opcion=actualizarDatosCeldas',
            datetype: "json",
            type: 'POST',
            data: $("#formCeldas").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "Actualización",
                        content: "<i class='fa fa-clock-o'></i> <i>Ala Actualizada correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioCeldas();
                    location.reload();
                }
            }
        });
    }
    $('#frmAlasModal').modal('hide');
}
function editarCeldas(celdas) {
    $.ajax({
        url: './includes/celdas/celdas_model.php?opcion=enviarDatosCeldas',
        datetype: "json",
        type: 'POST',
        data: {celdas: celdas},
        success: function(res) {
            var json_obj = $.parseJSON(res);
            limpiarFormularioCeldas();
            carga_DatosIncialesCeldas(json_obj);
            $('#frmCeldasModal').modal('show');
            $('#formCeldas >header').text('Actualización de Datos Celdas');
            $('#IDceldas').val(celdas);
        }
    });

}
function llenaPiso(pab,ala,piso){
    var pabellon=(pab==undefined)?$('#pabellon').val():pab;
    var codAla=(ala==undefined)?$('#ala').val():ala;
    var codPiso=(piso==undefined)?$('#piso').val():piso;
    $.post("./includes/pisos/pisos_model.php?opcion=comboPiso", { pabellon: pabellon,ala:codAla,piso:codPiso }, function(data){
       $("#comboPiso").html(data);
    });
}
function carga_DatosIncialesCeldas(edt) {
    llenaAla(edt.datosCeldas.PAB_COD,edt.datosCeldas.ALA_COD,edt.datosCeldas.CEL_COD);
    $("#IDceldas").val(edt.datosCeldas.CEL_COD);  /*Nombre*/
    $('#pabellon option[value="' + edt.datosCeldas.PAB_COD + '"]').attr("selected", true);
    $('#ala option[value="' + edt.datosCeldas.ALA_COD + '"]').attr("selected", true);
    $('#piso option[value="' + edt.datosCeldas.PIS_COD + '"]').attr("selected", true);
    $("#descripcion").val(edt.datosCeldas.CEL_DESCRIPCION);  /*Apellido*/
    llenaPiso(edt.datosCeldas.PAB_COD,edt.datosCeldas.ALA_COD,edt.datosCeldas.PIS_COD);
}
function eliminarCeldas(codPab, nomPab) {
    $.SmartMessageBox({
        title: "Confirmación!",
        content: "Esta seguro de eliminar el Piso <span class='txt-color-orangeDark'><strong>" + nomPab + " </strong></span>?",
        buttons: '[No][Si]'
    }, function(ButtonPressed) {
        if (ButtonPressed === "Si") {
            $.ajax({
                url: "./includes/celdas/celdas_model.php?opcion=eliminarCeldas",
                type: 'post',
                data: {codigo: codPab},
                success: function(respuesta) {
                    if (respuesta === '1') {
                        $('.' + codPab).parent('td').parent('tr').addClass('paraEliminarUsuario');
                        $('.paraEliminarUsuario').fadeOut('tr');
                        $.smallBox({
                            title: 'Piso: '+nomPab,
                            content: "<i class='fa fa-clock-o'></i> <i>Piso Eliminada...</i>",
                            color: "#659265",
                            iconSmall: "fa fa-check fa-2x fadeInRight animated",
                            timeout: 4000
                        });
                    }else{
                        if (respuesta === '2') {
                            $.smallBox({
                                title: 'Error...!',
                                content: "<i class='fa fa-clock-o'></i> <i>El Piso esta siendo usada en algun Piso, No puede ser eliminada</i>",
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