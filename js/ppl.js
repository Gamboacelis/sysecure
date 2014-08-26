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
});
function nuevoPpl() {
    alert('987');
    $('#frmPPLModal').modal('show');
//    limpiarFormularioPabellon();
//    $('#smart-form-pabellon >header').text('Registro Nuevo Pabellon')
//    $('#IDpabellon').val('');
}