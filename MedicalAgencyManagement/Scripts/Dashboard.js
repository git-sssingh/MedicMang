// Scope related issue, so need to declare it first and then use it.
// https://stackoverflow.com/questions/41527655/uncaught-referenceerror-function-is-not-defined-at-htmlbuttonelement-onclick

var manufacturerList;

$(document).ready(function () {

    var getSummery = function () {
        $.ajax({
            type: "POST",
            url: '/Dashboard.aspx/GetSummery',
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                console.log(data.d);
                $.each(data.d, function (index, value) {
                    var htmlSummery = "<div class='col-lg-3 col-6' >"
                        + "<div class='small-box bg-info'>"
                        + "<div class='inner'>"
                        + "<h3>" + value.Count+"</h3>"
                        + "<p>" + value.Name+"</p>"
                        + "</div>"
                        + "<div class='icon'>"
                        + "<i class='ion " + value.Icon+"'></i>"
                        + "</div>"
                        + "<a href='#' class='small-box-footer'>More info <i class='fa fa-arrow-circle-right'></i></a>"
                        + "</div></div >";
                    $("#summeryContainer").append(htmlSummery);
                });
                
            },
            failure: function (response) {
                alert(response.d);
            }
        });
    };
    getSummery();
});
