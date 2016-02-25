$(function() {
    onButtonClickAction('#benefits-button');
    onButtonClickAction('#overview-button');
});

function onButtonClickAction(buttonClass) {
    $(buttonClass).on('click', function() {
        if($(this).hasClass('selected')) {
            return;
        }
        $('#benefits').toggleClass('hide');
        $('#overview').toggleClass('hide');
        $('#overview-button').toggleClass('selected');
        $('#benefits-button').toggleClass('selected');
    });
}