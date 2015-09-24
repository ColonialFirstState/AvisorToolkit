var resize_static_images = function() {
  var images = document.getElementsByClassName('static-image');
  if(images.length > 0) {
    var screen_height = document.documentElement.clientHeight;
    var screen_width = document.documentElement.clientWidth;;

    images[0].style.position = 'absolute';
    images[0].style.height = "" + (document.documentElement.clientHeight * 0.97) + "px";
    var gap = screen_width - images[0].clientWidth;
    images[0].style.left = "" + (gap/2) + "px";
  }
};
