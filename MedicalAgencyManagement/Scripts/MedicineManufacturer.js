// Scope related issue, so need to declare it first and then use it.
// https://stackoverflow.com/questions/41527655/uncaught-referenceerror-function-is-not-defined-at-htmlbuttonelement-onclick

var editManufacturer;
var manufacturerList;

$(document).ready(function () {
    editManufacturer = function editManufacturer(manufacturerId) {
        $.each(manufacturerList, function (index, value) {
            if (value.Id === manufacturerId) {
                $('#ManfufacturerName').val(value.Name); 
                $('#ManfufacturerDescription').val(value.Address); 
            }
        });
    };
    var getManufacturers = function (isAdd) {
        $.ajax({
            type: "POST",
            url: '/MedicineManufacturer.aspx/GetManufacturerList',
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                manufacturerList = data.d;
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
                        + value.Address + '</td><td><div data-toggle="modal" data-target="#modal-default" id=' + index + ' onclick=editManufacturer(' + "'" + value.Id + "'" + ')><i class="fa fa-edit" style="font-size: 1.5em; color: Mediumslateblue;"></i></div></td></tr>');
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
    var addManufacturers = function () {
        var manufacturername = $('#ManfufacturerName').val();
        var manufacturerdescription = $('#ManfufacturerDescription').val();
        $.ajax({
            type: "POST",
            url: '/MedicineManufacturer.aspx/AddManufacturer',
            data: '{name : "' + manufacturername + '", description : "' + manufacturerdescription+'"}',
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                getManufacturers(true);
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    };
    getManufacturers(false);
    $("#AddManufacturerButton").click(function () {
        addManufacturers();
    });
});
