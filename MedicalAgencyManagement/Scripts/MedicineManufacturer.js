$(document).ready(function () {
    $.ajax({
        type: "POST",
        url: '/MedicineManufacturer.aspx/GetManufacturerList',
        data: '{agencyId: "376B5EAE-6705-4FF4-B152-E8EC6F0E260D" }',
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            $.each(data.d, function (index, value) {
                $('#example2 tbody').append('<tr><td>' + (index + 1) + '</td><td>' + value.Name + '</td><td>' + value.Address + '</td></tr>');
            });
            $('#example2').DataTable({
                'paging': true,
                'lengthChange': true,
                'searching': true,
                'ordering': true,
                'info': false,
                'autoWidth': false
            });
        },
        failure: function (response) {
            alert(response.d);
        }
    });
});