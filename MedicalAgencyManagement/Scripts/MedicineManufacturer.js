// Scope related issue, so need to declare it first and then use it.
// https://stackoverflow.com/questions/41527655/uncaught-referenceerror-function-is-not-defined-at-htmlbuttonelement-onclick

var editManufacturer;
var manufacturerList;

$(document).ready(function () {
  editManufacturer = function editManufacturer(manufacturerId) {
    console.log(manufacturerList);
    console.log(manufacturerId);
        $.each(manufacturerList, function (index, value) {
            if (value.Id === manufacturerId) {
              $('#BrandName').val(value.BrandName);
              $('#VehicleModel').val(value.SubBrand);
              
              $('#VehicelTypes').val(value.VehicleType);
            }
        });
    };
    var getManufacturers = function (isAdd) {
        $.ajax({
            type: "POST",
            url: '/VehicleBrands.aspx/GetBrandsDetail',
            contentType: "application/json; charset=utf-8",
            success: function (data) {
              manufacturerList = data.d;
              $("#example2 tbody tr").remove();
                $.each(data.d, function (index, value) {
                    $('#example2 tbody')
                        .append('<tr><td>'
                            + (index + 1)
                            + '</td><td>'
                            + value.BrandName
                            + '</td><td>'
                            + value.SubBrand
                            + '</td><td>'
                        + value.VehicleType + '</td><td><div data-toggle="modal" data-target="#modal-default" id=' + index + ' onclick=editManufacturer(' + "'" + value.Id + "'" + ')><i class="fa fa-edit" style="font-size: 1.5em; color: Mediumslateblue;"></i></div></td></tr>');
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

    // Add Method
    var addManufacturers = function () {
      var brandName = $('#BrandName').val();
      var modelName = $('#VehicleModel').val();
      var vehicelType = $('#VehicelTypes').val();
      var vehicelTypeInt = 0;
      if (vehicelType == "Three Wheeler") {
        vehicelTypeInt = 1;
      }
      if (vehicelType == "Four Wheeler") {
        vehicelTypeInt = 2;
      }
      if (vehicelType == "Heavy Vehicle") {
        vehicelTypeInt = 3;
      }
        $.ajax({
            type: "POST",
            url: '/VehicleBrands.aspx/AddBrands',
            data: '{brandName : "' + brandName + '", modelName : "' + modelName + '", vehicleType : "' + vehicelTypeInt +'"}',
            contentType: "application/json; charset=utf-8",
          success: function (data) {
            console.log(data);
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
