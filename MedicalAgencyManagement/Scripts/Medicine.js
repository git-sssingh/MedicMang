// Scope related issue, so need to declare it first and then use it.
// https://stackoverflow.com/questions/41527655/uncaught-referenceerror-function-is-not-defined-at-htmlbuttonelement-onclick

var editMedicine;
var MedicineList;

$(document).ready(function () {
    editMedicine = function editMedicine(MedicineId) {
        $.each(MedicineList, function (index, value) {
            if (value.Id === MedicineId) {
                $('#ManfufacturerName').val(value.Name);
                $('#ManfufacturerDescription').val(value.Address);
            }
        });
    };
    var getMedicines = function (isAdd) {
        $.ajax({
            type: "POST",
            url: '/MedicineListing.aspx/GetMedicineList',
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                MedicineList = data.d;
                if (isAdd) {
                    $('#example2').DataTable().destroy();
                }
                $.each(data.d, function (index, value) {
                    $('#example2 tbody')
                        .append('<tr><td>'
                            + (index + 1)
                            + '</td><td>'
                            + value.Name
                            + '</td><td>'
                            + value.Address + '</td><td><div data-toggle="modal" data-target="#modal-default" id=' + index + ' onclick=editMedicine(' + "'" + value.Id + "'" + ')><i class="fa fa-edit" style="font-size: 1.5em; color: Mediumslateblue;"></i></div></td></tr>');
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
    var addMedicines = function () {
        var Medicinename = $('#ManfufacturerName').val();
        var Medicinedescription = $('#ManfufacturerDescription').val();
        $.ajax({
            type: "POST",
            url: '/MedicineListing.aspx/AddMedicine',
            data: '{name : "' + Medicinename + '", description : "' + Medicinedescription + '"}',
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                getMedicines(true);
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    };
    getMedicines(false);
    $("#AddMedicineButton").click(function () {
        addMedicines();
    });
});