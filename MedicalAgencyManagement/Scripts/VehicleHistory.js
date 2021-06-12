var originalData = [];
var medicineList = [];
var addedServicingDetails = [];
var addedServices = [];
var changeData;
var deleteData;
var sumCalculator;
var getUrlParameter;
var getCustomerById;
var newArray = [];
var getBrands;
var SelectModel;
var SelectVehicleNumber;
var customerId;
var getCustomerVehicelList;
var SelectServicingDetails;
var selectedDate;
$(document).ready(function () {
  getUrlParameter = function getUrlParameter() {
    var sPageURL = window.location.search.substring(0);
    if (sPageURL) {
      var sURLVariables = sPageURL.split('=');
      if (sURLVariables[1]) {
        customerId = sURLVariables[1];
        $.ajax({
          type: "POST",
          url: '/Customers.aspx/GetCustomerById',
          data: '{cutomerId : "' + sURLVariables[1] + '"}',
          contentType: "application/json; charset=utf-8",
          success: function (data) {
            $("#Customername i").text(data.d.Name);
            $("#Customeremail i").text(data.d.EmailId);
            $("#Customerphone i").text(data.d.PhoneNo);
          },
          failure: function (response) {
            alert(response);
          }
        });
      }
    }
    else {
      $("#selectedCustomerArea").hide();
    }
  };

  getCustomerVehicelList = function (customerId) {
    console.log('Get Vehciel List');
    $.ajax({
      type: "POST",
      url: '/VehicleHistory.aspx/GetVehicleByCustomer',
      data: '{customerId : "' + customerId + '"}',
      contentType: "application/json; charset=utf-8",
      success: function (data) {
        $.each(data.d, function (index, value) {
          $('#customerVehicle').append('<option value="' + value + '">' + value + '</option>');
        });
      },
      failure: function (response) {
        alert(response.d);
      }
    });
  }
  getUrlParameter();
  getCustomerVehicelList(customerId);
  SelectModel = function (control) {
    SelectVehicleNumber = control.value;
    $.ajax({
      type: "POST",
      url: '/VehicleHistory.aspx/GetVehicleServiceBillingDate',
      data: "{vehicleNumber : '" + control.value + "'}",
      contentType: "application/json; charset=utf-8",
      success: function (data) {
        addedServicingDetails = data.d;
        $('#VehicleDropDownDate').empty();
        $('#VehicleDropDownDate').append('<option selected="true" disabled="disabled" >Select Date</option>');
        $.each(data.d, function (index, value) {
          $('#VehicleDropDownDate').append('<option value="' + value.CreatedDate + '">' + value.CreatedDate + '</option>');
        });
      },
      failure: function (response) {
        alert(response.d);
      }
    });
  }
  SelectServicingDetails = function (control) {
    var selectedServicing = {};
    var vType;
    $.each(addedServicingDetails, function (index, value) {
      if (value.CreatedDate === control.value) {
        selectedServicing = value;
      }
    });
    console.log(selectedServicing);
    if (selectedServicing.VehicleType == "0") {
      vType = "Two Wheeler";
    }
    if (selectedServicing.VehicleType == "1") {
      vType = "Three Wheeler";
    }
    if (selectedServicing.VehicleType == "2") {
      vType = "Four Wheeler";
    }
    if (selectedServicing.VehicleType == "3") {
      vType = "Heavy Vehicle";
    }
    selectedDate = selectedServicing.CreatedDate;
    $.ajax({
      type: "POST",
      url: '/VehicleHistory.aspx/GetCustomerBilling',
      data: "{vehicleNumber : '" + SelectVehicleNumber + "',createdDate:'" + selectedServicing.CreatedDate + "'}",
      contentType: "application/json; charset=utf-8",
      success: function (data) {
        console.log(data.d);
        var totalAmount = 0;
        $("#example2 tbody tr").remove();
        $.each(data.d, function (index, value) {
          totalAmount = totalAmount + (value.Price * value.Quantity);
            $('#example2 tbody')
              .append('<tr id=row' + value.CustomInfo + '><td>'
              + value.CustomInfo
                + '</td><td>'
              + value.Price
                + '</td><td>'
              + value.Quantity
                + '</td><td>'
              + (value.Price * value.Quantity)
                + '</td><td>'
              + value.Comment
                + '</td>'
                
                + '</tr>');

        });
        $("#brand i").text(selectedServicing.BrandName);
        $("#model i").text(selectedServicing.SubBrand);
        $("#vehicleType i").text(vType);
        $("#totalAmount i").text(totalAmount);
        console.log(totalAmount);
      },
      failure: function (response) {
        alert(response.d);
      }
    });
   
  }

  $('#BillingButton').on('click', function () {
    window.location = "invoice.aspx?=" + customerId + "=" + $('#hidePrice').is(":checked") + "=" + $('#hideTotal').is(":checked") + "=" + SelectVehicleNumber + "=" + selectedDate;
  });
});