var originalData = [];
var medicineList = [];
var addedMedicines = [];
var addedServices = [];
var changeData;
var deleteData;
var sumCalculator;
var getUrlParameter;
var getCustomerById;
var newArray = [];
var getBrands;
var SelectModel;
var customerId;
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
                        alert(response.d);
                    }
                });
            }
        }
        else {
            $("#selectedCustomerArea").hide();
        }     
    };
    getUrlParameter();
    changeData = function (id) {
        $.each(originalData, function (index, value) {
            if (value.Id === id) {
                var currentQuantity = $('#' + id).val();
                if (currentQuantity <= 0) {
                    alert("Quantity of " + value.Name + " is less than zero");
                }
                else {
                    var currentPrice = $("input[name='"+id+"']").val();
                    $('#total' + id).text(currentPrice * currentQuantity);
                }
            }
        });
        sumCalculator();
    };
  deleteData = function (id, customeData) {
    for (var i = 0; i < addedServices.length; i++) {
      if (addedServices[i].CustomInfo === customeData) {
        addedServices.splice(i, 1);
      }
    }
    console.log(addedServices);
    var row = id.parentNode.parentNode;
    row.parentNode.removeChild(row);
        sumCalculator();
    };
    var getMedicines = function () {
        $.ajax({
            type: "POST",
            url: '/MedicineListing.aspx/GetMedicineList',
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                originalData = data.d;
                $.each(data.d, function (index, value) {
                    medicineList.push(value.Name + "~" + value.Mg +"~" + value.Manufacturer + "~" + value.Price);
                });
                
                $('#example2').DataTable({
                    'paging': false,
                    'lengthChange': false,
                    'searching': false,
                    'ordering': false,
                    'autoWidth': true,
                    'totalCol': true,
                    'language': {
                        "zeroRecords": " "
                    }
                });
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    };
    getMedicines();
    $("#SearchBox").autocomplete({
        source: medicineList
    });
  $('#BillingButton').on("click", function () {
    if (addedServices && addedServices.length>0) {
      if (!addedServices[0].VehicleBrandId) {
        $('#customerVehicleBrand').focus();
        $('#messageAfterSuccess').text("Vehicle Brand require! Delete added service and again try!");
        return;
      }
      if (!addedServices[0].VehicleNo) {
        $('#customerNewVehicleNo').focus();
        $('#messageAfterSuccess').text("Vehicle No. require! Delete added service and again try!");
        return;
      }
      var dataToSend = JSON.stringify({ 'data': addedServices });
      $.ajax({
        type: "POST",
        url: '/Billing.aspx/AddBilling',
        contentType: "application/json; charset=utf-8",
        data: dataToSend,
        success: function (data) {
        },
        failure: function (response) {
          alert(response.d);
        }
      });
    }
    else {
      $('#messageAfterSuccess').text("Service Details require!");
    }
  });

  $('#AddDetails').on("click", function () {
    if (!$('#ServiceDetails').val()) {
      $('#messageAfterSuccess').text("Service Details require!");
      $('#ServiceDetails').focus();
      return;
    }
    if (!$('#prince').val()) {
      $('#messageAfterSuccess').text("prince require!");
      $('#prince').focus();
      return;
    }
    if (!$('#quantity').val()) {
      $('#messageAfterSuccess').text("quantity require!");
      $('#quantity').focus();
      return;
    }
    var currentArrau = [];
    var dateObject = {};
    dateObject.CustomInfo = $('#ServiceDetails').val();
    dateObject.Price = $('#prince').val();
    dateObject.Quantity = $('#quantity').val();
    dateObject.Comment = $('#customeComment').val();
    dateObject.CustomerId = customerId;
    dateObject.VehicleNo = $('#customerNewVehicleNo').val();
    dateObject.VehicleBrandId = $('#customerVehicleBrand').val();
    dateObject.VehicleType = $('#CustomerVehicelTypes').val();
    currentArrau.push(dateObject);
    addedServices.push(dateObject);
    $.each(currentArrau, function (index, value) {
        $('#example2 tbody')
          .append('<tr id=row' + index + '><td>'
          + value.CustomInfo
            + '</td><td>'
          + value.Price
            + '</td><td>'
          + value.Quantity
          + '</td><td>'
          + '<span class="individualTotal" id=total' + value.Price + '>' +parseInt(value.Quantity) * parseInt(value.Price)+'</span>'
          + '</td><td>'
          + value.Comment 
          + '</td><td><div id=' + index + ' onclick=deleteData(this,"' + value.CustomInfo+'")><i class="fa fa-trash" style="font-size: 1.5em; color: Mediumslateblue;"></i></div></td></tr>');
        sumCalculator();
      
    });
  });
    $("#SearchBox").on("change", function (e) {
        var currentData = e.target.value.split('~');
        if (currentData) {
            $.each(originalData, function (index, value) {
                if (currentData[0] === value.Name && currentData[1] === value.Mg && currentData[2] === value.Manufacturer) {
                    $('#example2 tbody')
                        .append('<tr id=row' + value.Id + '><td>'
                            + value.Name
                            + '</td><td>'
                        + '<input type="number" name=' + value.Id + ' class="mytextbox" value=' + value.Price + ' onkeyup=changeData(' + "'" + value.Id + "'" + ') onclick=changeData(' + "'" + value.Id + "'" + ') />'
                            + '</td><td>'
                            + value.Mg
                            + '</td><td>'
                            + value.Manufacturer
                        + '</td><td>'
                        + '<input type="number" id=' + value.Id + ' class="mytextbox" value="1" onkeyup=changeData(' + "'" + value.Id + "'" + ') onclick=changeData(' + "'" + value.Id + "'" + ') />'
                        + '</td><td>'
                        + '<span class="individualTotal" id=total' + value.Id + '>' + value.Price+'</span>'
                            + '</td><td><div id=' + index + ' onclick=deleteData(' + "'" + index + "'" + ')><i class="fa fa-trash" style="font-size: 1.5em; color: Mediumslateblue;"></i></div></td></tr>');
                    sumCalculator();
                }
            });
        }
    });
    sumCalculator = function () {
        var sum = 0;
        $('tr').each(function () {
            $(this).find('.individualTotal').each(function () {
                var combat = $(this)[0].innerText;
                sum += parseInt(combat);
            });
            $('#totalAmount').html("Total Amount: &#x20b9; <b style='color:#d81b60'>"+sum+"</b>");
        });
    };

    getCustomerById = function () {
        var sPageURL = window.location.search.substring(0);
        if (sPageURL) {
            var sURLVariables = sPageURL.split('=');
            if (sURLVariables[1]) {
                $.ajax({
                    type: "POST",
                    url: '/Customers.aspx/GetCustomerById',
                    data: "{cutomerId : '" + sURLVariables[1] + "'}",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        $('#CustomerName').val(data.d.Name);
                        $('#CustomerPhoneNo').val(data.d.PhoneNo);
                        $('#CustomerEmailId').val(data.d.EmailId);
                        $('#CustomerAddress').val(data.d.Address);
                        $('#CustomerCreateDate').val(data.d.CreateDate);
                        $('#CustomerCity').val(data.d.City);
                        $('#CustomerState').val(data.d.State);
                        $('#CustomerPin').val(data.d.Pin);
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
        }
    };

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
                window.location.href = "/billing.aspx?customerId=" + data.d;
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    };
    $("#AddCustomerButton").click(function () {
        addCustomers();
    });
    $("#goToInvoice").click(function (){

    });
  getBrands = function () {
    $.ajax({
      type: "POST",
      url: '/Billing.aspx/GetBrands',
      contentType: "application/json; charset=utf-8",
      success: function (data) {
        $.each(data.d, function (index, value) {
          console.log('appending...');
          $('#customerVehicleBrand').append('<option value="' + value.Id + '">' + value.BrandName + '</option>');
        });
      },
      failure: function (response) {
        alert(response.d);
      }
    });
  };

  getBrands();
  console.log($('#customerVehicleBrand').value);
  SelectModel = function (control) {
    $.ajax({
      type: "POST",
      url: '/Billing.aspx/GetModels',
      data: "{brandId : '" + control.value + "'}",
      contentType: "application/json; charset=utf-8",
      success: function (data) {
        $('#customerVehicleSubBrand').empty();
        $.each(data.d, function (index, value) {
          $('#customerVehicleSubBrand').append('<option value="' + value.Id + '">' + value.BrandName + '</option>');
        });
      },
      failure: function (response) {
        alert(response.d);
      }
    });
  }
});