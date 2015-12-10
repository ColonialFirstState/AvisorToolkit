//= require_tree .
$(document).ready(function() {
  $(window).swipeleft(function(e){
    e.preventDefault();
    $('.next a')[0].click();
  });

  $(window).swiperight(function (e) {
    e.preventDefault();
    $('.previous a')[0].click();
  });
});

var startup = function() {
  resize_static_images();
};

window.onload = startup;
