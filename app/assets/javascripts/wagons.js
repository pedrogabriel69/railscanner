$(document).ready(function(){
  $("#wagon_type" ).change(function(e) {
    e.preventDefault();
    alert($("select option:selected").val());
    var id = $("select option:selected").val();
    
    $('.change_type_wagon').hide();     
    $('.change_type_wagon.' + id).show();   
  });  
}); 