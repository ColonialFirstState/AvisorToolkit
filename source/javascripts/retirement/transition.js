$(function() {
    onButtonClickAction('#benefits-button');
    onButtonClickAction('#strategy-button');
});

function onButtonClickAction(buttonClass) {
    $(buttonClass).on('click', function() {
        if($(this).hasClass('selected')) {
            return;
        }
        $('#benefits').toggleClass('hide');
        $('#strategy').toggleClass('hide');
        $('#strategy-button').toggleClass('selected');
        $('#benefits-button').toggleClass('selected');
    });
}