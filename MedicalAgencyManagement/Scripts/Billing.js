var medicineList =[];
$(document).ready(function () {
    var getMedicines = function () {
        $.ajax({
            type: "POST",
            url: '/MedicineListing.aspx/GetMedicineList',
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                $.each(data.d, function (index, value) {
                    medicineList.push(value.Name + " - " + value.Mg + " MG - " + "(" + value.Manufacturer + ")" + " - Rs. : " + value.Price  );
                });
                console.log(medicineList);
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    };
    getMedicines();
    console.log(medicineList);
    $("#SearchBox").autocomplete({
        source: medicineList
    });
    $("#SearchBox").on("change", function (e) {
        console.log(e.target.value);
    });
});