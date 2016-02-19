$(document).ready(function() {
    onClickAction('#all-assets', '/images/managed_funds/all_assets.svg')
    onClickAction('#property-mix', '/images/managed_funds/property_mix.svg')
    onClickAction('#share-mix', '/images/managed_funds/share_mix.svg')
    onClickAction('#cash-mix', '/images/managed_funds/cash_mix.svg')
    onClickAction('#fixed-income-mix', '/images/managed_funds/fixed_income_mix.svg')
});

function onClickAction(buttonID, image) {
  $(buttonID).on('click', function(e) {
    e.preventDefault();
    $("#managed-funds-chart").attr("src", image);
    $('.button').removeClass('selected');
    $(buttonID).addClass('selected');
  });
}
