var customerId;
var hidePrice = false;
var hideTotal = true;
var getInvoice;
$(document).ready(function () {
  getInvoice = function () {
    var sPageURL = window.location.search.substring(0);
    console.log(sPageURL);
    if (sPageURL) {
      var sURLVariables = sPageURL.split('/');
      customerId = sURLVariables[1];
      hidePrice = sURLVariables[2];
      hideTotal = sURLVariables[3];
      console.log(sURLVariables);
      if (sURLVariables[1]) {

      }
    }
  }
  getInvoice();
});