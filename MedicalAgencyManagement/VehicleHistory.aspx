<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="VehicleHistory.aspx.cs" Inherits="MedicalAgencyManagement.VehicleHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <div class="col-sm-6">
                            <h3 id="newHead" class="box-title" style="margin-left: -12px; margin-top: 2px">Customer Vehicle Details</h3>
                        </div>
                        <div class="col-sm-6">
                            <div style="text-align: right; margin-top: -8px">
                            </div>
                        </div>
                        <div id="selectedCustomerArea">
                            <div class="col-sm-12">
                                <h3>Cutomer Details: <i data-toggle="modal" data-target="#modal-default" class="fa fa-edit" onclick='getCustomerById()'></i></h3>
                            </div>
                            <div class="col-sm-3" id="Customername"><b>Name: </b><i style="color: gainsboro"></i></div>
                            <div class="col-sm-3" id="Customeremail"><b>Email Id: </b><i style="color: gainsboro"></i></div>
                            <div class="col-sm-3" id="Customerphone"><b>Contact No.: </b><i style="color: gainsboro"></i></div>
                            <div class="col-sm-3" id="VehicleDropDown">
                                <select class="form-control" onchange="SelectModel(this)" id="customerVehicle">
                                        <option selected="true" disabled="disabled" >Select Vehicle</option>
                                    </select>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="col-lg-3">
                            <i style="color: darkgray">Brand</i>
                            
                        </div>
                        <div class="col-lg-3">
                            <i style="color: darkgray">Model</i>
                            
                        </div>
                        <div class="col-lg-3">
                            <i style="color: darkgray">Servicing Data</i>
                            
                        </div>
                        <div class="col-lg-3">
                            <i style="color: darkgray">Total Amount</i>
                            
                        </div>
                       
                        <br />
                        <br />
                        <div class="col-lg-12">
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Service</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Comment</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Service</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Comment</th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                            </table>
                            <div style="text-align: right; margin-top: -31px">
                                <span id="messageAfterSuccess"></span>
                                <button id="BillingButton" type="button" style="margin-top: 20px;" class="btn bg-maroon margin"><i class="glyphicon glyphicon-pencil"></i>Click To Generate Bill</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </section>
    <script src="Scripts/Billing.js"></script>
</asp:Content>
