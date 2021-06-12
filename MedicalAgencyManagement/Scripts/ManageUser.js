// Scope related issue, so need to declare it first and then use it.
// https://stackoverflow.com/questions/41527655/uncaught-referenceerror-function-is-not-defined-at-htmlbuttonelement-onclick

var editUser;
var UserList;
var SelectedUserId;
var userGoingToBeEdit = false;
var getUsers;
$(document).ready(function () {
  editUser = function editUser(UserId) {
    userGoingToBeEdit = true;
    SelectedUserId = UserId;
    $.each(UserList, function (index, value) {
      if (value.Id === UserId) {
        $('#UserName').val(value.Name);
        $('#UserPhoneNo').val(value.PhoneNo);
        $('#UserEmailId').val(value.EmailId);
        $('#UserAddress').val(value.Address);
        $('#UserCreateDate').val(value.CreateDate);
        $('#UserCity').val(value.City);
        $('#UserState').val(value.State);
        $('#UserPin').val(value.Pin);
      }
    });
  };
  getUsers = function () {
    console.log('calling again user get');
    $.ajax({
      type: "POST",
      url: '/ManageUsers.aspx/GetUserList',
      contentType: "application/json; charset=utf-8",
      success: function (data) {
        UserList = data.d;
        //$("#example2 tbody tr").remove();
        $.each(data.d, function (index, value) {
          $('#example2 tbody')
            .append('<tr><td>'
              + (index + 1)
              + '</td><td>'
              + value.Name
              + '</td><td>'
              + value.EmailId
              + '</td><td>'
              + value.PhoneNo
              + '</td><td>'
              + value.Address
              + '</td><td>'
            + value.Password
            + '</td><td>'
            + value.IsActive
              + '</td><td><span data-toggle="modal" data-target="#modal-default" id=' + index + ' onclick=editUser(' + "'" + value.Id + "'" + ')><i class="fa fa-pencil" style="font-size: 1.5em; color: Mediumslateblue;"></i></span></td></tr>');
        });
        $('#example2').DataTable({
          'paging': true,
          'lengthChange': true,
          'searching': true,
          'ordering': true,
          'info': true,
          'autoWidth': true,
          "destroy": true
        });

      },
      failure: function (response) {
        alert(response.d);
      }
    });
  };

  // Add Method
  var addUsers = function () {
    var postUserData = {};
    postUserData.Name = $('#UserName').val();
    postUserData.PhoneNo = $('#UserPhoneNo').val();
    postUserData.EmailId = $('#UserEmailId').val();
    postUserData.Address = $('#UserAddress').val();
    postUserData.City = $('#UserCity').val();
    postUserData.State = $('#UserState').val();
    postUserData.Pin = $('#UserPin').val();
    var urlToPint = userGoingToBeEdit ? "/ManageUsers.aspx/UpdateUser" : "/ManageUsers.aspx/AddUser";
    var UserDate;
    if (userGoingToBeEdit) {
      UserDate = "{Name : '" + postUserData.Name + "', PhoneNo : '" + postUserData.PhoneNo
        + "',EmailId :'" + postUserData.EmailId
        + "',Address :'" + postUserData.Address
        + "',City:'" + postUserData.City
        + "',State:'" + postUserData.State
        + "',Pin :'" + postUserData.Pin
        + "',UserId:'" + SelectedUserId + "'}";
    }
    else {
      UserDate = "{Name: '" + postUserData.Name
        + "', PhoneNo : '" + postUserData.PhoneNo
        + "',EmailId :'" + postUserData.EmailId
        + "',Address :'" + postUserData.Address
        + "',City:'" + postUserData.City
        + "',State:'" + postUserData.State
        + "',Pin :'" + postUserData.Pin + "'}";
    }
    $.ajax({
      type: "POST",
      url: urlToPint,
      data: UserDate,
      contentType: "application/json; charset=utf-8",
      success: function (data) {
        $('#manageUserClose').trigger('click');
        userGoingToBeEdit = false;
        UserDate = null;
        location.reload();
      },
      failure: function (response) {
        alert(response.d);
      }
    });
  };
  getUsers();
  $("#AddUserButton").click(function () {
    addUsers();
  });
});
