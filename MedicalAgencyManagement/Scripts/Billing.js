var originalData = [];
var medicineList = [];
var addedMedicines = [];
var changeData;
var deleteData;
var sumCalculator;
var getUrlParameter;
var getCustomerById;
$(document).ready(function () {
    getUrlParameter = function getUrlParameter() {
        var sPageURL = window.location.search.substring(0);
        if (sPageURL) {
            var sURLVariables = sPageURL.split('=');
            if (sURLVariables[1]) {
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
    deleteData = function (id) {
        $.each(originalData, function (index, value) {
            if (value.Id === id) {
                $('#row'+id).remove();
            }
        });
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
                            + '</td><td><div data-toggle="modal" data-target="#modal-default" id=' + index + ' onclick=deleteData(' + "'" + value.Id + "'" + ')><i class="fa fa-trash" style="font-size: 1.5em; color: Mediumslateblue;"></i></div></td></tr>');
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
        console.log(originalData);
        console.log(addedMedicines);
        //console.log(originalData);
    });
});