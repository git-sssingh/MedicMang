// Scope related issue, so need to declare it first and then use it.
// https://stackoverflow.com/questions/41527655/uncaught-referenceerror-function-is-not-defined-at-htmlbuttonelement-onclick

var settings;

$(document).ready(function () {
    var getSettings = function () {
        $.ajax({
            type: "POST",
            url: '/Settings.aspx/GetSettings',
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                settings = data.d;
                if (data.d) {
                    $('#agencyName').val(settings.Name);
                    $('#agencyInvoiceAddress').val(settings.Address);
                    $('#agencyCity').val(settings.City);
                    $('#agencyState').val(settings.State);
                    $('#agencyPin').val(settings.Pin);
                    $('#agencyContactNoPrimary').val(settings.PrimaryPhoneNo);
                    $('#agencyContactNoSecondary').val(settings.SecondaryPhoneNo);
                    $('#agencyEmailId').val(settings.EmailId);
                    $('#agencyGstId').val(settings.GstNo);
                    $('#agencyCenterGstRate').val(settings.CenterGst);
                    $('#agencyStateGstRate').val(settings.StateGst);
                    $('#agencyLogo').attr("src", "MediaUploader/" + settings.Logo);
                }
                
                
            },
            failure: function (response) {
                alert(response.d);
                
            }
        });
    };

    // Add Method
    var updateSetting = function () {
        var settingData = {};
        settingData.Name = $('#agencyName').val();
        settingData.Address = $('#agencyInvoiceAddress').val();
        settingData.PrimaryPhoneNo = $('#agencyContactNoPrimary').val();
        settingData.SecondaryPhoneNo = $('#agencyContactNoSecondary').val();
        settingData.EmailId = $('#agencyEmailId').val();
        settingData.City = $('#agencyCity').val();
        settingData.Pin = $('#agencyPin').val();
        settingData.State = $('#agencyState').val();
        settingData.StateGst = $('#agencyStateGstRate').val();
        settingData.CenterGst = $('#agencyCenterGstRate').val();
        settingData.GstNo = $('#agencyGstId').val();
        $.ajax({
            type: "POST",
            url: '/Settings.aspx/UpdateSettings',
            beforeSend: function () {
                $("#loader").show();
            },
            data: "{Name : '" + settingData.Name
                + "', PrimaryPhoneNo : '"
                + settingData.PrimaryPhoneNo
                + "', SecondaryPhoneNo : '"
                + settingData.SecondaryPhoneNo
                + "',EmailId :'"
                + settingData.EmailId
                + "',Address :'"
                + settingData.Address
                + "',City:'"
                + settingData.City
                + "',State:'"
                + settingData.State
                + "',StateGst :'"
                + settingData.StateGst
                + "',CenterGst :'"
                + settingData.CenterGst
                + "',GstNo :'"
                + settingData.GstNo
                + "',Pin :'"
                + settingData.Pin + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                getSettings();
                $("#loader").hide();
                $('#msgFirst').text("Updated successfully!");
                setTimeout(function () { $('#msgFirst').text(""); }, 5000);
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    };
    getSettings();
    $("#GeneraButton").click(function () {
        updateSetting();
    });




    function sendFile() {

        var formData = new FormData();
        if ($('#logo')[0].files[0]) {
            if ($('#logo')[0].files[0].type === 'image/png' || $('#logo')[0].files[0].type === 'image/jpeg') {
                formData.append('file', $('#logo')[0].files[0]);
                console.log($('#logo')[0].files[0]);
                $.ajax({
                    type: 'POST',
                    url: 'fileUploader.ashx',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (status) {
                        if (status !== 'error') {
                            $('#msgSecond').text("Logo Uploaded!");
                            $('#msgSecond').css('color', 'forestgreen');
                            setTimeout(function () { $('#msgSecond').text(""); }, 5000);
                            var my_path = "MediaUploader/" + status;
                            $("#agencyLogo").attr("src", my_path);
                        }
                    },
                    error: function () {
                        alert("Whoops something went wrong!");
                    }
                });
            }
            else {
                $('#msgSecond').text("only jpg or png image is accepted!");
                $('#msgSecond').css('color', 'red');
                return false;
            }
        }
    }

    $("#GeneraButton2").click(function () {
        sendFile();
    });
});
