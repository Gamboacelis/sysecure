$(document).ready(function() {
//    pageSetUp();
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
