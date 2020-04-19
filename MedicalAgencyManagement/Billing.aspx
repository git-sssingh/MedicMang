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
                            <h3 class="box-title" style="margin-left:-12px; margin-top:2px">New Billing</h3>
                        </div>
                        <div class="col-sm-6">
                            <div style="text-align:right; margin-top:-8px">
                            <button type="button" style="margin-right:-14px" class="btn bg-maroon margin" data-toggle="modal" data-target="#modal-default"><i class="glyphicon glyphicon-plus"></i> New Billing</button>
                        </div>
                        </div>
                    </div>
                    <div class="box-body">
                        <div class="col-lg-10">
                            <span>Medicine Name - MG - Brand Name - Price</span>
                            <input id="SearchBox" class="form-control" type="text"  />
                        </div>
                        <div class="col-lg-2">
                            <button type="button" class="btn btn-block btn-outline-primary btn-sm"><i class="glyphicon glyphicon-plus"></i> Add</button>
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
