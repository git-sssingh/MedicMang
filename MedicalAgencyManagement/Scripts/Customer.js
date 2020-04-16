// Scope related issue, so need to declare it first and then use it.
// https://stackoverflow.com/questions/41527655/uncaught-referenceerror-function-is-not-defined-at-htmlbuttonelement-onclick

var editCustomer;
var CustomerList;

$(document).ready(function () {
    editCustomer = function editCustomer(CustomerId) {
        $.each(CustomerList, function (index, value) {
            $('#CustomerName').val(value.Name);
            $('#CustomerPhoneNo').val(value.PhoneNo); 
            $('#CustomerEmailId').val(value.EmailId); 
            $('#CustomerAddress').val(value.Address); 
            $('#CustomerCreateDate').val(value.CreateDate); 
            $('#CustomerCity').val(value.City); 
            $('#CustomerState').val(value.State); 
            $('#CustomerPin').val(value.Pin); 
        });
    };
    var getCustomers = function (isAdd) {
        $.ajax({
            type: "POST",
            url: '/Customers.aspx/GetCustomerList',
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                CustomerList = data.d;
                if (isAdd) {
                    $('#example2 tbody').empty();
                }
                $.each(data.d, function (index, value) {
                    $('#example2 tbody')
                        .append('<tr><td>'
                            + (index + 1)
                            + '</td><td>'
                            + value.Name
                            + '</td><td>'
                            + value.EmailId
                            + '</td><td>'
                            + value.PhoneNo
                            + '</td><td>'
                            + value.Address                            + '</td><td>'                            + value.CreateDate
                            + '</td><td><div data-toggle="modal" data-target="#modal-default" id=' + index + ' onclick=editCustomer(' + "'" + value.Id + "'" + ')><i class="fa fa-edit" style="font-size: 1.5em; color: Mediumslateblue;"></i></div></td></tr>');
                });
                $('#example2').DataTable({
                    'paging': true,
                    'lengthChange': true,
                    'searching': true,
                    'ordering': true,
                    'info': true,
                    'autoWidth': true
                });

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
                + "', PhoneNo : '" + postSustomerData.PhoneNo + "',EmailId :'" + postSustomerData.EmailId + "',Address :'" + postSustomerData.Address + "',City:'" + postSustomerData.City + "',State:'" + postSustomerData.State + "',Pin :'" + postSustomerData.Pin + "'}",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                getCustomers(true);
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    };
    getCustomers(false);
    $("#AddCustomerButton").click(function () {
        addCustomers();
    });
});
