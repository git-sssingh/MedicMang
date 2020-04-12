<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="MedicineManufacturer.aspx.cs" Inherits="MedicalAgencyManagement.MedicineManufacturer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="modal fade" id="modal-default">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Add Manufacturer</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-2 control-label">Name</label>

                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="Customername" placeholder="Customer Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Mobile No.</label>

                                <div class="col-sm-10">
                                    <input type="number" class="form-control" id="CustomerMobileNo" placeholder="Mobile No.">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-2 control-label">Email Id</label>

                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="inputPassword3" placeholder="Email Id">
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
                    <button type="button" class="btn btn-primary">Save changes</button>
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
                            <h3 class="box-title" style="margin-left:-12px; margin-top:2px">Medicine Manufacturer</h3>
                        </div>
                        <div class="col-sm-6">
                            <div style="text-align:right; margin-top:-8px">
                            <button type="button" style="margin-right:-14px" class="btn bg-maroon margin" data-toggle="modal" data-target="#modal-default"><i class="glyphicon glyphicon-plus"></i> Add Manufacturer</button>
                        </div>
                        </div>
                    </div>
                    <div class="box-body">
                        <table id="example2" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Sr.No.</th>
                                    <th>Manufacturer Name</th>
                                    <th>Address</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Sr.No.</th>
                                     <th>Manufacturer Name</th>
                                    <th>Address</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="Scripts/MedicineManufacturer.js"></script>
</asp:Content>
