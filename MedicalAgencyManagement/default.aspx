<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="MedicalAgencyManagement._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
      <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
      <title>Portal : MediMang</title>
      <!-- Tell the browser to be responsive to screen width -->
      <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
      <!-- Bootstrap 3.3.7 -->
      <link rel="stylesheet" href="../../bower_components/bootstrap/dist/css/bootstrap.min.css" />
      <!-- Font Awesome -->
      <link rel="stylesheet" href="../../bower_components/font-awesome/css/font-awesome.min.css" />
      <!-- Ionicons -->
      <link rel="stylesheet" href="../../bower_components/Ionicons/css/ionicons.min.css" />
      <!-- Theme style -->
      <link rel="stylesheet" href="../../dist/css/AdminLTE.min.css" />
      <!-- iCheck -->
      <link rel="stylesheet" href="../../plugins/iCheck/square/blue.css" />

      <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic" />
</head>
<body class="hold-transition login-page" style="background: url(/dist/img/mediMang-backgroundImage-2.jpg) no-repeat center center fixed; background-size: cover">
<div class="login-box">
  <div class="login-logo">
    <a href="#"><b>Admin</b>MediMang</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>
      
    <form id="form1" runat="server">
        <div class="alert alert-danger" runat="server" id="errorMessageDiv" hidden="true">
            <strong>Error!</strong> <span runat="server" id="messageErrorDynamic"></span>
        </div>
        <div class="alert alert-info" runat="server" id="successMessageDiv" hidden="true">
            <strong>Success!</strong> <span runat="server" id="messageSuccessDynamic"></span>
        </div>
      <div class="form-group has-feedback">
          <asp:TextBox ID="Username" TextMode="SingleLine" runat="server" class="form-control" placeholder="UserName"></asp:TextBox>
        
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
          <asp:TextBox ID="Password" TextMode="Password" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
       
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
              <asp:Label ID="lblmsg" runat="server" style="color:red" Text=""></asp:Label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
            <asp:Button ID="SignInButton" runat="server" Text="Sign In" class="btn btn-primary btn-block btn-flat" OnClick="SignInButton_Click"   />
        </div>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">

    </div>

  </div>
  <!-- /.login-box-body -->
</div>
    <!-- jQuery 3 -->
<script src="../../bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../../plugins/iCheck/icheck.min.js"></script>
    <script src="Scripts/defaultPage.js"></script>
</body>
</html>

