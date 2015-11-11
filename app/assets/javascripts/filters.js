$(document).ready(function () {

    $('.filters_form').on('change', 'input, select', function (e) {
        e.preventDefault();
        $(this).closest('.filters_form').submit();
    });

});
