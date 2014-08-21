$(document).ready(function() {
   revisarMenu 
});
function revisarMenu(codigo){
    $('#sysMenu').children('li').each(function(){
        $(this).removeClass('active');
    });
    $('#sysMenu').children('li').children('ul').children('li').each(function(){
        $(this).removeClass('active');
    });
    $('#'+codigo).parent('li').addClass('active');
}