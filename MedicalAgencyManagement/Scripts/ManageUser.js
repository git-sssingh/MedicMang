﻿// Scope related issue, so need to declare it first and then use it.
// https://stackoverflow.com/questions/41527655/uncaught-referenceerror-function-is-not-defined-at-htmlbuttonelement-onclick

var editUser;
var UserList;
var SelectedUserId;
var userGoingToBeEdit = false;
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
  var getUsers = function (isAdd) {
    $.ajax({
      type: "POST",
      url: '/ManageUsers.aspx/GetUserList',
      contentType: "application/json; charset=utf-8",
      success: function (data) {
        UserList = data.d;

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
              + value.EmailId
              + '</td><td>'
              + value.PhoneNo
              + '</td><td>'
              + value.Address
              + '</td><td>'
            + value.Password
            + '</td><td>'
            + value.IsActive
              + '</td><td><span data-toggle="modal" data-target="#modal-default" id=' + index + ' onclick=editUser(' + "'" + value.Id + "'" + ')><i class="fa fa-pencil" style="font-size: 1.5em; color: Mediumslateblue;"></i></span><span style="margin-left:5px" id=' + index + ' onclick=editUser(' + "'" + value.Id + "'" + ')><a href="billing.aspx?UserId=' + value.Id + '"><i class="fa fa-paperclip" style="font-size: 1.5em; color: #c70039;"></i></a></span></td></tr>');
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
    console.log('....post user data...');
    console.log(postUserData);
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
        userGoingToBeEdit = false;
        UserDate = null;
        getUsers(true);
      },
      failure: function (response) {
        alert(response.d);
      }
    });
  };
  getUsers(false);
  $("#AddUserButton").click(function () {
    addUsers();
  });
});