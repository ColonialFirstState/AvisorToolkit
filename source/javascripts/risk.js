$(document).ready(function() {
  buttonClickAction('#conservative', '.low-risk',    'Conservative portfolio');
  buttonClickAction('#balanced',     '.medium-risk', 'Balanced portfolio');
  buttonClickAction('#growth',       '.high-risk',   'Growth portfolio');
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
