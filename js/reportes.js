$(document).ready(function() {
    // Date Range Picker
    $("#fdesde").datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        formatDate: "yy-m-d"
        
    });
    $("#fhasta").datepicker({
        defaultDate: "+1w",
        changeMonth: true
    });
    if ($('#bar-graph').length) {
        Morris.Bar({
            element: 'bar-graph',
            data: [{
                    x: '2011 Q1',
                    y: 0
                }, {
                    x: '2011 Q2',
                    y: 1
                }, {
                    x: '2011 Q3',
                    y: 2
                }, {
                    x: '2011 Q4',
                    y: 3
                }, {
                    x: '2012 Q1',
                    y: 4
                }, {
                    x: '2012 Q2',
                    y: 5
                }, {
                    x: '2012 Q3',
                    y: 6
                }, {
                    x: '2012 Q4',
                    y: 7
                }, {
                    x: '2013 Q1',
                    y: 8
                }],
            xkey: 'x',
            ykeys: ['y'],
            labels: ['Y'],
            barColors: function(row, series, type) {
                if (type === 'bar') {
                    var red = Math.ceil(150 * row.y / this.ymax);
                    return 'rgb(' + red + ',0,0)';
                } else {
                    return '#000';
                }
            }
        });
    }
});

function reporteSancion(){
    var fdesde=$('#fdesde').val();
    var fhasta=$('#fhasta').val();
    $.ajax({
            url: './includes/reportes/sanciones/Rsanciones_model.php?opcion=reporteSancion',
            datetype: "json",
            type: 'POST',
            data: {fdesde:fdesde,fhasta:fhasta},
            success: function(res) {
                    $('#muestraReporteSancion').html(res);
            }
        });
}

function reporteVisitas(){
    var fdesde=$('#fdesde').val();
    var fhasta=$('#fhasta').val();
    $.ajax({
            url: './includes/reportes/visitas/Rvisitas_model.php?opcion=reporteVisitas',
            datetype: "json",
            type: 'POST',
            data: {fdesde:fdesde,fhasta:fhasta},
            success: function(res) {
                    $('#muestraReporteVisitas').html(res);
            }
        });
}