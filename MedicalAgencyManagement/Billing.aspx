<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="MedicalAgencyManagement.Billing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="modal fade" id="modal-default">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Add Customer</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">Name</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="CustomerName" placeholder="Customer Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Mobile No.</label>

                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="CustomerPhoneNo" placeholder="Mobile No.">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Email Id</label>

                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="CustomerEmailId" placeholder="Email Id">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Address</label>

                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="CustomerAddress" placeholder="Address">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">City</label>

                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="CustomerCity" placeholder="City">
                                </div>
                            </div>
                             <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">State</label>

                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="CustomerState" placeholder="State">
                                </div>
                            </div>
                             <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Pin Code</label>

                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="CustomerPin" placeholder="Pin Code">
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                       
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                    <button type="button" id="AddCustomerButton" class="btn btn-primary">Save changes</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <div class="col-sm-6">
                            <h3 id="newHead" class="box-title" style="margin-left: -12px; margin-top: 2px">New Billing</h3>
                        </div>
                        <div class="col-sm-6">
                            <div style="text-align: right; margin-top: -8px">
                                <button type="button" style="margin-right: -14px" class="btn bg-maroon margin" data-toggle="modal" data-target="#modal-default"><i class="glyphicon glyphicon-plus"></i>New Customer</button>
                            </div>
                        </div>
                        <div id="selectedCustomerArea">
                            <div class="col-sm-12"><h3>Cutomer Details: <i data-toggle="modal" data-target="#modal-default" class="fa fa-edit" onclick='getCustomerById()'></i></h3></div>
                            <div class="col-sm-4" id="Customername"><b>Name: </b><i style="color:gainsboro"></i></div>
                            <div class="col-sm-4" id="Customeremail"><b>Email Id: </b><i style="color:gainsboro"></i></div>
                            <div class="col-sm-4" id="Customerphone"><b>Contact No.: </b><i style="color:gainsboro"></i></div>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="col-lg-6">
                            <i style="color:darkgray">Search Medicine by Name (Medicine Name - MG - Brand Name - Price)</i>
                            <input id="SearchBox" class="form-control" type="text" placeholder="Search Medicine by Name"  />
                        </div>
                        <div class="col-lg-4">
                            <h3 id="totalAmount"></h3> 
                        </div>
                        <div class="col-lg-2"><br />
                            <input class="btn btn-block btn-primary btn-flat" id="goToInvoice" type="button" value="Generate Bill" />
                        </div>
                        <br /><br />
                        <div class="col-lg-12">
                            <table id="example2" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Mg</th>
                                    <th>Manufacturer</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Mg</th>
                                    <th>Manufacturer</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </tfoot>
                        </table>

                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
        
    </section>
    <script src="Scripts/Billing.js"></script>
</asp:Content>
