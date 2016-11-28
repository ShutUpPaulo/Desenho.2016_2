// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize.min
//= require dataTables/jquery.dataTables
//= require_tree .

$(document).ready(function(){
  $('.modal').modal();

  $(document).on("click", "#ingredients .pagination a", function() {
    $.getScript(this.href);
    return false;
  });

  $(document).keyup("#ingredients_search input", function() {
    $.get($("#ingredients_search").attr("action"), $("#ingredients_search").serialize(), null, "script");
    return false;
  });

  $('#recipe_ingredients').DataTable({
    columnDefs: [{
      targets: [ 0, 1, 2 ],
      className: 'mdl-data-table__cell--non-numeric'
    }]
  });
});
