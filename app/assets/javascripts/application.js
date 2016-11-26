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
//= require turbolinks
//= require jquery_ujs
//= require_tree .
//= require materialize.min

$(document).ready(function(){
  $('.modal').modal();

  $(document).on("click", "#recipe_ingredients_table .pagination a", function() {
    $.getScript(this.href);
    return false;
  });
  // $("#recipe_ingredients_search input").keyup(function() {
  //   $.get($("#recipe_ingredients_search").attr("action"), $("#recipe_ingredients_search").serialize(), null, "script");
  //   return false;
  // });

  $(document).on("click", "#ingredients .pagination a", function() {
    $.getScript(this.href);
    return false;
  });
  $("#ingredients_search input").keyup(function() {
    $.get($("#ingredients_search").attr("action"), $("#ingredients_search").serialize(), null, "script");
    return false;
  });
});
