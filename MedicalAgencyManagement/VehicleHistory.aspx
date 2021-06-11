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
                                <h3>Cutomer Details</h3>
                            </div>
                            <div class="col-sm-3" id="Customername"><b>Name: </b><i style="color: gainsboro"></i></div>
                            <div class="col-sm-3" id="Customeremail"><b>Email Id: </b><i style="color: gainsboro"></i></div>
                            <div class="col-sm-2" id="Customerphone"><b>Contact No.: </b><i style="color: gainsboro"></i></div>
                            <div class="col-sm-2" id="VehicleDropDown">
                                <select class="form-control" onchange="SelectModel(this)" id="customerVehicle">
                                        <option selected="true" disabled="disabled" >Select Vehicle</option>
                                    </select>
                            </div>
                            <div class="col-sm-2" id="VehicleDate">
                                <select class="form-control" onchange="SelectServicingDetails(this)" id="VehicleDropDownDate">
                                        <option selected="true" disabled="disabled" >Select Date</option>
                                    </select>
                            </div>
                        </div>
                        <div>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="col-lg-3" id="brand">
                            <b>Brand: </b><i style="color: darkgray"></i>
                            
                        </div>
                        <div class="col-lg-3" id="model">
                             <b>Model: </b><i style="color: darkgray"></i>
                            
                        </div>
                        <div class="col-lg-3" id="vehicleType">
                            <b>Type: </b> <i style="color: darkgray"></i>
                            
                        </div>
                       <div class="col-lg-3" id="totalAmount">
                            <b>Total: </b> <i style="color: darkgray"></i>
                            
                        </div>
                        <br />
                        <div class="col-lg-12">
                            <h3>Service Details</h3>
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Service</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                        <th>Comment</th>
                                       
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                
                            </table>
                            <div style="text-align: right; margin-top: -31px">
                                <button id="BillingButton" type="button" style="margin-top: 20px;" class="btn bg-maroon margin"><i class="glyphicon glyphicon-add"></i>Click To Print Bill</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </section>
    <script src="Scripts/VehicleHistory.js"></script>
</asp:Content>
