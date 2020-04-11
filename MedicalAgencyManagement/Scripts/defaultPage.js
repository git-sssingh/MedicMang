$(document).ready(function () {
    // Initial setup for error and Success message div element
    $('#SignInButton').click(function (e) {

        var userName = $('#Username').val();
        var password = $('#Password').val();
        if (!userName || !password) {
            $('#successMessageDiv').hide();
            $('#errorMessageDiv').show();
            $('#messageErrorDynamic').text('Please enter correct value');
            e.preventDefault();
        }
        else {
            $('#errorMessageDiv').hide();
            $('#successMessageDiv').show();
            $('#messageSuccessDynamic').text('Please wait....');
            //var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            //if (emailReg.test(userName)) {
            //    $('#errorMessageDiv').hide();
            //    $('#successMessageDiv').show();
            //    $('#messageSuccessDynamic').text('Please wait....');
            //}
            //else {
            //    $('#successMessageDiv').hide();
            //    $('#errorMessageDiv').show();
            //    $('#messageErrorDynamic').text('Incorrect EmailId');
            //    e.preventDefault();
            //}
        }
    });
});
