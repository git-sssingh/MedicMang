var customerId;
var hidePrice = false;
var hideTotal = true;
var vehicleNo;
var selectedDate;
var getInvoice;
var subTotal =0;
var sGst;
var cGst;
$(document).ready(function () {
  getInvoice = function () {
    var sPageURL = window.location.search.substring(0);
    console.log(sPageURL);
    if (sPageURL) {
      var sURLVariables = sPageURL.split('=');
      customerId = sURLVariables[1];
      hidePrice = sURLVariables[2];
      hideTotal = sURLVariables[3];
      vehicleNo = sURLVariables[4].replace(/%20/g, " ");
      selectedDate = sURLVariables[5].replace(/%20/g, " ");
      console.log(customerId, hidePrice, hideTotal, vehicleNo, selectedDate);
      if (customerId && customerId.length === 36) {
        $.ajax({
          type: "POST",
          url: '/VehicleHistory.aspx/GetInvoiceBillingDetails',
          data: "{customerId : '" + customerId
            + "', vehicleNumber : '" + vehicleNo + "',createdDate :'" + selectedDate + "'}",
          contentType: "application/json; charset=utf-8",
          success: function (data) {
            console.log(data.d);
            var details = data.d;
            // Invoice

            var d = new Date();
            var n = d.getTime();
            $('#invoiceNumber').text("Invoice: "+n);
            $('#genrationDate').text(new Date().toLocaleString());
            // agency Details
            $('#agencyname').text(details.Agency.Name);
            $('#addressAgencyName').text(details.Agency.Name);
            $('#addressAgencyPhone').text(details.Agency.PrimaryPhoneNo + ", " + details.Agency.SecondaryPhoneNo);
            $('#addressAgencyEmail').text(details.Agency.EmailId);
            $('#addressAgency1').text(details.Agency.Address);
            $('#addressAgency2').text(details.Agency.City + "," + details.Agency.State + ", " + details.Agency.Pin);
            $('#agencyLogo').attr("src","MediaUploader/" + details.Agency.Logo);
            sGst = details.Agency.StateGst;
            cGst = details.Agency.CenterGst;
            // Custoemr Details
            $('#customerName').text(details.Customer.Name);
            $('#addressCustomerPhone').text(details.Customer.PhoneNo );
            $('#addressCustomerEmail').text(details.Customer.EmailId);
            $('#addressCustomer1').text(details.Customer.Address);
            $('#addressCustomer2').text(details.Customer.City + "," + details.Customer.State + ", " + details.Customer.Pin);

            // Service details table
            $.each(details.ServiceDetails, function (index, value) {
              $('#productTable tbody').append('<tr><td>' + value.Quantity + '</td><td>' + value.CustomInfo + '</td><td>' + value.Comment + '</td><td>' + value.Price + '</td><td>' + (value.Price * value.Quantity) + '</td>tr>');
              subTotal = subTotal + (value.Price * value.Quantity);
            });
            $('#subTotalTable tbody').append('<tr><th style="width:50%">Subtotal:</th><td>' + subTotal + '<td></tr>');
            if (cGst > 0) {
              $('#subTotalTable tbody').append('<tr><th>Center GST:</th><td>' + cGst + '<td></tr>')
            }
            if (sGst > 0) {
              $('#subTotalTable tbody').append('<tr><th>State GST:</th><td>' + sGst + '<td></tr>')
            }

            var taxValue = ((subTotal / 100) * (parseInt(cGst) + parseInt(sGst)));
            var totalData = (taxValue) + subTotal;
           
            $('#subTotalTable tbody').append('<tr><th>Total:</th><td>' + totalData + '<td></tr>')
            if (hideTotal == "true") {
              $('#totalSection').hide();
            }
            if (hidePrice == "true") {
              $('td:nth-child(4),th:nth-child(4)').hide();
              $('td:nth-child(5),th:nth-child(5)').hide();
            }
          },
          failure: function (response) {
            alert(response.d);
          }
        });
      }
      else {
        alert("Wrong Customer value!");
      }
    }
  }
  getInvoice();
  $('#printSection').on('click', function () { window.print(); });
});