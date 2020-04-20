var originalData = [];
var medicineList = [];
var addedMedicines = [];
var changeData;
var deleteData;
var sumCalculator;
var getUrlParameter;
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
                        console.log(data.d);
                       
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
                    $('#total' + id).text(value.Price * currentQuantity);
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
                            + value.Price
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
            $('#totalAmount').html("Total Amount: "+sum);
        });
    };
});