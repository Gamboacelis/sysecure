$(document).ready(function() {
   revisarMenu 
});
function revisarMenu(codigo){
//    alert(codigo);
//    $('#sysMenu').children('li').each(function(){
//        $(this).removeClass('active');
//    });
//    $('#sysMenu').children('li').children('ul').children('li').each(function(){
//        $(this).removeClass('active');
//    });
    $('#'+codigo).addClass('active');
}