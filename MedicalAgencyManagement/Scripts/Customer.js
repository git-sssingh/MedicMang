// Scope related issue, so need to declare it first and then use it.
// https://stackoverflow.com/questions/41527655/uncaught-referenceerror-function-is-not-defined-at-htmlbuttonelement-onclick

var editCustomer;
var CustomerList;
var SelectedCustomerId;
var customerGoingToBeEdit = false;
var table = $('#example2 tbody');
$(document).ready(function () {
  editCustomer = function editCustomer(CustomerId) {
    customerGoingToBeEdit = true;
    SelectedCustomerId = CustomerId;
        $.each(CustomerList, function (index, value) {
            if (value.Id === CustomerId) {
                $('#CustomerName').val(value.Name);
                $('#CustomerPhoneNo').val(value.PhoneNo);
                $('#CustomerEmailId').val(value.EmailId);
                $('#CustomerAddress').val(value.Address);
                $('#CustomerCreateDate').val(value.CreateDate);
                $('#CustomerCity').val(value.City);
                $('#CustomerState').val(value.State);
                $('#CustomerPin').val(value.Pin);
            }
        });
    };
    var getCustomers = function (isAdd) {
        $.ajax({
            type: "POST",
            url: '/Customers.aspx/GetCustomerList',
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                CustomerList = data.d;
                $.each(data.d, function (index, value) {
                  table.append('<tr><td>'
                            + (index + 1)
                            + '</td><td>'
                            + value.Name
                            + '</td><td>'
                            + value.EmailId
                            + '</td><td>'
                            + value.PhoneNo
                            + '</td><td>'
                            + value.Address
                            + '</td><td>'
                            + value.CreateDate
                    + '</td><td><span data-toggle="modal" data-target="#modal-default" id=' + index + ' onclick=editCustomer(' + "'" + value.Id + "'" + ')><i class="fa fa-pencil" style="font-size: 1.5em; color: Mediumslateblue;"></i></span><span style="margin-left:5px" id=' + index + ' onclick=editCustomer(' + "'" + value.Id + "'" + ')><a href="billing.aspx?customerId=' + value.Id + '"><i class="fa fa-wrench" style="font-size: 1.5em; color: #c70039;"></i></a><span style="margin-left:5px" ><a href="billing.aspx?customerId=' + value.Id +'"><i class="fa fa-bicycle" style="font-size: 1.5em; color: #c70039;"></i></a></span></span></td></tr>');
                });
                $('#example2').DataTable({
                    'paging': true,
                    'lengthChange': true,
                    'searching': true,
                    'ordering': true,
                    'info': true,
                  'autoWidth': true,
                  'bRetrieve': true
                });

            },
            failure: function (response) {
                alert(response.d);
            }
        });
    };

  var addCustomers = function () {
    var postCustomerData = {};
    postCustomerData.Name = $('#CustomerName').val();
    postCustomerData.PhoneNo = $('#CustomerPhoneNo').val();
    postCustomerData.EmailId = $('#CustomerEmailId').val();
    postCustomerData.Address = $('#CustomerAddress').val();
    postCustomerData.City = $('#CustomerCity').val();
    postCustomerData.State = $('#CustomerState').val();
    postCustomerData.Pin = $('#CustomerPin').val();

    var urlToPint = customerGoingToBeEdit ? "/Customers.aspx/UpdateCustomer" : "/Customers.aspx/AddCustomer";
    var customerDate;
    if (customerGoingToBeEdit) {
      customerDate = "{Name : '" + postCustomerData.Name + "', PhoneNo : '" + postCustomerData.PhoneNo
        + "',EmailId :'" + postCustomerData.EmailId
        + "',Address :'" + postCustomerData.Address
        + "',City:'" + postCustomerData.City
        + "',State:'" + postCustomerData.State
        + "',Pin :'" + postCustomerData.Pin
        + "',CustomerId:'" + SelectedCustomerId + "'}";
    }
    else {
      customerDate = "{Name: '" + postCustomerData.Name
        + "', PhoneNo : '" + postCustomerData.PhoneNo
        + "',EmailId :'" + postCustomerData.EmailId
        + "',Address :'" + postCustomerData.Address
        + "',City:'" + postCustomerData.City
        + "',State:'" + postCustomerData.State
        + "',Pin :'" + postCustomerData.Pin + "'}";
    }
    $.ajax({
      type: "POST",
      url: urlToPint,
      data: customerDate,
      contentType: "application/json; charset=utf-8",
      success: function (data) {
        table.append('');
        customerGoingToBeEdit = false;
        customerDate = null;
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
