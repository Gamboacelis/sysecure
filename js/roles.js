function mostrarPermisosUsuario(rol) {
    $('#IDRol').val(rol);
    $('#IDRolFrm').val(rol);
    $('#listaRoles').children('tbody').children('tr').each(function() {
        $(this).removeClass('info');
    });
    $('#' + rol).addClass('info');
    $.ajax({
        url: "./includes/roles/roles_model.php?opcion=buscarPermisosUsuario",
        type: 'post',
        data: {rol: rol},
        success: function(resultado) {
            $('#tbPermisosUsuarios >tbody').html(resultado);
        }
    });
}
function eliminarPermiso(codPar, nomCod, codRol) {

    $.SmartMessageBox({
        title: "Confirmación!",
        content: "Esta seguro de eliminar el Permiso de Acceso:  <span class='txt-color-orangeDark'><strong>" + nomCod + " </strong></span>?",
        buttons: '[No][Si]'
    }, function(ButtonPressed) {
        if (ButtonPressed === "Si") {
            $.ajax({
                url: "./includes/roles/roles_model.php?opcion=eliminarPermisoAcceso",
                type: 'post',
                data: {codigo: codPar,codRol:codRol},
                success: function(respuesta) {
                    if (respuesta === '1') {
                        mostrarPermisosUsuario(codRol);
                        $.smallBox({
                            title: nomCod,
                            content: "<i class='fa fa-clock-o'></i> <i>Permiso de Acceso Eliminado...</i>",
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
function nuevoPermiso() {
    var codRol = $('#IDRol').val();
    $('.checkbox').hide();
    if (codRol !== '') {
        $.ajax({
        url: "./includes/roles/roles_model.php?opcion=mostrarPermisosDisponibles",
        type: 'post',
        data: {codRol: codRol},
        success: function(resultado) {
            $('#tbPermisosDisponibles >tbody').html(resultado);
            $('#frmPermisosModal').modal('show');
            $('#smart-form-permisos >header').text('Asignación de Permisos por Rol')
        }
    });
        
        
        
    } else {
        $.smallBox({
            title: "Error..!!",
            content: "<i class='fa fa-clock-o'></i> <i>Seleccione un Rol</i>",
            color: "#C46A69",
            iconSmall: "fa fa-times fa-2x fadeInRight animated",
            timeout: 4000
        });
    }
}

function guardarAsignaPermisos(){
    var permisos='';
    var codRol=$('#codRol').val();
    $("input[name='asignar']").each(function(i) {
         if($(this).is(':checked')) {
            permisos += ';'+$(this).val();
        }
     });
    $.ajax({
        url: "./includes/roles/roles_model.php?opcion=guardarAsignaPermisos",
        type: 'post',
        data: {permisos: permisos,codRol:codRol},
        success: function(respuesta) {
            if (respuesta === '1') {
                mostrarPermisosUsuario(codRol);
                $('#frmPermisosModal').modal('hide');
                $.smallBox({
                    title: 'Permisos Agregados',
                    content: "<i class='fa fa-clock-o'></i> <i>Permiso del Rol Asignados...</i>",
                    color: "#659265",
                    iconSmall: "fa fa-check fa-2x fadeInRight animated",
                    timeout: 4000
                });
            }
        }
    });
}