//= require jquery3
//= require bootstrap-sprockets

$(function() {
  $('.close').on('click', function() {
    $('.alert').fadeOut();
  });
});