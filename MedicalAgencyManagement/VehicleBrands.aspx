<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="VehicleBrands.aspx.cs" Inherits="MedicalAgencyManagement.MedicineManufacturer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="modal fade" id="modal-default">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Add Vehicle Brands</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-3 control-label">Brand Name</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="BrandName" placeholder="Brand Name emp: Mahindra, Hero Honda" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-3 control-label">Model</label>

                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="VehicleModel" placeholder="Model exmp: Passion plus or S Series" />
                                </div>
                            </div>
                            <div class="form-group">
                                <lebel class="col-sm-3 control-label">Vehicel Type</lebel>
                                <div class="col-sm-9">
                                    <select name="VehicelTypes" class="form-control" id="VehicelTypes">
                                        <option value="Two Wheeler">Two Wheeler</option>
                                        <option value="Three Wheeler">Three Wheeler</option>
                                        <option value="Four Wheeler">Four Wheeler</option>
                                        <option value="Heavy Vehicle">Heavy Vehicle</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                        <!-- /.box-body -->

                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="AddManufacturerButton">Save changes</button>
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
                            <h3 class="box-title" style="margin-left: -12px; margin-top: 2px">Vehicle Manufacturer</h3>
                        </div>
                        <div class="col-sm-6">
                            <div style="text-align: right; margin-top: -8px">
                                <button type="button" style="margin-right: -14px" class="btn bg-maroon margin" data-toggle="modal" data-target="#modal-default"><i class="glyphicon glyphicon-plus"></i>Add Manufacturer</button>
                            </div>
                        </div>
                    </div>
                    <div class="box-body">
                        <div id='loader' style='display: none; text-align: center'>
                            <img src='dist/img/ajax-loader.gif'>
                        </div>
                        <table id="example2" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Sr.No.</th>
                                    <th>Brand Name</th>
                                    <th>Model</th>
                                    <th>Type</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Sr.No.</th>
                                    <th>Brand Name</th>
                                    <th>Model</th>
                                    <th>Type</th>
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
