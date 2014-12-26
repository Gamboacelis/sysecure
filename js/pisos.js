$(document).ready(function() {
    var $registerForm = $("#formPisos").validate({
        rules: {
            pabellon: {required: true},
            ala: {required: true},
            descripcion: {required: true}
        },errorPlacement: function(error, element) {
            error.insertAfter(element.parent());
        }
    });
});
function nuevoPiso() {
    limpiarFormularioPisos();
    $('#formPisos >header').text('Registro Nuevo Piso');
    $('#IDpisos').val('');
    $('#frmPisosModal').modal('show');
}
function llenaAla(codPabellon,codAla,codPiso){
    $("#comboAla").empty();
    var pabellon='';
    
    if(codPabellon==undefined){
        pabellon=$('#pabellon').val();
        $.post("./includes/alas/alas_model.php?opcion=comboAlas", { pabellon: pabellon,ala:codAla }, function(data){
            $("#comboAla").html(data);
        }); 
    }else{
        pabellon=codPabellon;
        $.post("./includes/alas/alas_model.php?opcion=comboAlas", { pabellon: pabellon,ala:codAla,piso:codPiso }, function(data){
            $("#comboAla").html(data);
        }); 
    }
}
function limpiarFormularioPisos() {
    $("#descripcion").val('');  /*Descripcion*/
    $('#pabellon').prop('selectedIndex', 0);/*Nivel*/
    $('#ala').prop('selectedIndex', 0);/*Nivel*/
}
function guardarPisos() {
    var pabellon = $('#IDpisos').val();
    if (pabellon === '') {
        $.ajax({
            url: './includes/pisos/pisos_model.php?opcion=guardaDatosPisos',
            datetype: "json",
            type: 'POST',
            data: $("#formPisos").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "Etapa Almacenada",
                        content: "<i class='fa fa-clock-o'></i> <i>Ala Agregada correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioPisos();
                    location.reload();
                }
            }
        });
    } else {
        $.ajax({
            url: './includes/pisos/pisos_model.php?opcion=actualizarDatosPisos',
            datetype: "json",
            type: 'POST',
            data: $("#formPisos").serialize(),
            success: function(res) {
                if (res === '1') {
                    $.smallBox({
                        title: "Actualización",
                        content: "<i class='fa fa-clock-o'></i> <i>Ala Actualizada correctamente...</i>",
                        color: "#659265",
                        iconSmall: "fa fa-check fa-2x fadeInRight animated",
                        timeout: 4000
                    });
                    limpiarFormularioPisos();
                    location.reload();
                }
            }
        });
    }
    $('#frmAlasModal').modal('hide');
}
function editarPisos(pisos) {
    $.ajax({
        url: './includes/pisos/pisos_model.php?opcion=enviarDatosPisos',
        datetype: "json",
        type: 'POST',
        data: {pisos: pisos},
        success: function(res) {
            var json_obj = $.parseJSON(res);
            limpiarFormularioPisos();
            carga_DatosIncialesPisos(json_obj);
            $('#frmPisosModal').modal('show');
            $('#formPisos >header').text('Actualización de Datos Pisos')
            $('#IDpisos').val(pisos);
        }
    });

}
function carga_DatosIncialesPisos(edt) {
    llenaAla(edt.datosPisos.PAB_COD,edt.datosPisos.ALA_COD);
    $("#IDpisos").val(edt.datosPisos.PIS_COD);  /*Nombre*/
    $('#pabellon option[value="' + edt.datosPisos.PAB_COD + '"]').attr("selected", true);
    $('#ala option[value="' + edt.datosPisos.ALA_COD + '"]').attr("selected", true);
    $("#descripcion").val(edt.datosPisos.PIS_DESCRIPCION);  /*Apellido*/
}
function eliminarPisos(codPab, nomPab) {
    $.SmartMessageBox({
        title: "Confirmación!",
        content: "Esta seguro de eliminar el Piso <span class='txt-color-orangeDark'><strong>" + nomPab + " </strong></span>?",
        buttons: '[No][Si]'
    }, function(ButtonPressed) {
        if (ButtonPressed === "Si") {
            $.ajax({
                url: "./includes/pisos/pisos_model.php?opcion=eliminarPisos",
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