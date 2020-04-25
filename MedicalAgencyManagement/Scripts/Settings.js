// Scope related issue, so need to declare it first and then use it.
// https://stackoverflow.com/questions/41527655/uncaught-referenceerror-function-is-not-defined-at-htmlbuttonelement-onclick

var editCustomer;
var settings;

$(document).ready(function () {
    editGenralSetting = function editCustomer(CustomerId) {
        $.each(CustomerList, function (index, value) {
            if (value.Id === CustomerId) {
                $('#agencyName').val(value.Name);
                $('#agencyInvoiceAddress').val(value.PhoneNo);
                $('#agencyCity').val(value.EmailId);
                $('#agencyState').val(value.Address);
                $('#agencyPin').val(value.CreateDate);
                $('#agencyContactNoPrimary').val(value.City);
                $('#agencyContactNoSecondary').val(value.State);
                $('#agencyEmailId').val(value.Pin);

                $('#agencyGstId').val(value.CreateDate);
                $('#agencyCenterGstRate').val(value.City);
                $('#agencyStateGstRate').val(value.State);
                $('#agencyLogo').val(value.Pin);
            }
        });
    };
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
                    $('#agencyLogo').attr("src", settings.Logo);
                }
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    };

    // Add Method
    var addCustomers = function () {
        var postSustomerData = {};
        postSustomerData.Name = $('#CustomerName').val();
        postSustomerData.PhoneNo = $('#CustomerPhoneNo').val();
        postSustomerData.EmailId = $('#CustomerEmailId').val();
        postSustomerData.Address = $('#CustomerAddress').val();
        postSustomerData.City = $('#CustomerCity').val();
        postSustomerData.State = $('#CustomerState').val();
        postSustomerData.Pin = $('#CustomerPin').val();
        $.ajax({
            type: "POST",
            url: '/Customers.aspx/AddCustomer',
            data: "{Name : '" + postSustomerData.Name
                + "', PhoneNo : '"
                + postSustomerData.PhoneNo
                + "',EmailId :'"
                + postSustomerData.EmailId
                + "',Address :'"
                + postSustomerData.Address
                + "',City:'"
                + postSustomerData.City
                + "',State:'"
                + postSustomerData.State
                + "',Pin :'"
                + postSustomerData.Pin + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                getCustomers(true);
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    };
    getSettings();
});
