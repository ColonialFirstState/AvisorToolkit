$(document).ready(function() {
    $('#all-assets').on('click', function(e) {
        e.preventDefault();
        $("#managed-funds-chart").attr("src","/images/managed_funds/all_assets.svg");
        $('#all-assets').addClass('selected');
        $('#property-mix').removeClass('selected');
        $('#share-mix').removeClass('selected');
        $('#cash-mix').removeClass('selected');
        $('#fixed-income-mix').removeClass('selected');
    });

    $('#property-mix').on('click', function(e) {
        e.preventDefault();
        $("#managed-funds-chart").attr("src","/images/managed_funds/property_mix.svg");
        $('#all-assets').removeClass('selected');
        $('#property-mix').addClass('selected');
        $('#share-mix').removeClass('selected');
        $('#cash-mix').removeClass('selected');
        $('#fixed-income-mix').removeClass('selected');
    });

    $('#share-mix').on('click', function(e) {
        e.preventDefault();
        $("#managed-funds-chart").attr("src","/images/managed_funds/share_mix.svg");
        $('#all-assets').removeClass('selected');
        $('#property-mix').removeClass('selected');
        $('#share-mix').addClass('selected');
        $('#cash-mix').removeClass('selected');
        $('#fixed-income-mix').removeClass('selected');
    });

    $('#cash-mix').on('click', function(e) {
        e.preventDefault();
        $("#managed-funds-chart").attr("src","/images/managed_funds/cash_mix.svg");
        $('#all-assets').removeClass('selected');
        $('#property-mix').removeClass('selected');
        $('#share-mix').removeClass('selected');
        $('#cash-mix').addClass('selected');
        $('#fixed-income-mix').removeClass('selected');
    });
    $('#fixed-income-mix').on('click', function(e) {
        e.preventDefault();
        $("#managed-funds-chart").attr("src","/images/managed_funds/fixed_income_mix.svg");
        $('#all-assets').removeClass('selected');
        $('#property-mix').removeClass('selected');
        $('#share-mix').removeClass('selected');
        $('#cash-mix').removeClass('selected');
        $('#fixed-income-mix').addClass('selected');
    });
});
