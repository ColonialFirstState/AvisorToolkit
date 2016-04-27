$(document).ready(function() {
  buttonClickAction('#conservative', '.low-risk',    'An example of a conservative portfolio');
  buttonClickAction('#balanced',     '.medium-risk', 'An example of a balanced portfolio');
  buttonClickAction('#growth',       '.high-risk',   'An example of a growth portfolio');
});

function buttonClickAction(button, risk, titleText) {
  $(button).on('click', function(e) {
    e.preventDefault();
    $('.rating').removeClass('rating-yes');
    $('.button').removeClass('selected');
    $(button).addClass('selected');
    $(risk).addClass('rating-yes');
    $('#risk-profile-title').text(titleText);
  });
}
