$(document).ready(function () {
    $('#contacts_person_company_id').on('change', function (e) {
        e.preventDefault();
        if (this.value == '') {
            $('#company_subform').show();
            $('#company_subform').find('input, textarea').val("");
        } else {
            $('#company_subform').hide();
        }
    });
});
