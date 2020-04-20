<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="MedicalAgencyManagement.Billing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                        <div class="col-sm-12"><h3>Cutomer Details: </h3></div>
                        <div class="col-sm-4" id="Customername"><b>Name: </b><i style="color:gainsboro"></i></div>
                        <div class="col-sm-4" id="Customeremail"><b>Email Id: </b><i style="color:gainsboro"></i></div>
                        <div class="col-sm-4" id="Customerphone"><b>Contact No.: </b><i style="color:gainsboro"></i></div>
                        
                    </div>
                    <div class="box-body">
                        <div class="col-lg-8">
                            <i style="color:darkgray">Search Medicine by Name (Medicine Name - MG - Brand Name - Price)</i>
                            <input id="SearchBox" class="form-control" type="text" placeholder="Search Medicine by Name"  />
                        </div>
                        <div class="col-lg-4">
                            <h3 id="totalAmount"></h3> 
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
