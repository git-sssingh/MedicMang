<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="MedicalAgencyManagement.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Settings for Agency</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="col-xs-12">
                            <label>Name</label>
                            <input id="agencyName" class="form-control" type="text" />
                        </div>
                        <div class="col-xs-12"><br />
                            <label>Address to be printed on invoice</label>
                            <textarea id="agencyInvoiceAddress" class="form-control" cols="20" rows="4"></textarea>
                        </div>
                        <div class="col-xs-6"><br />
                            <label>City</label>
                            <input id="agencyCity" class="form-control" type="text" />
                        </div>
                        <div class="col-xs-6"><br />
                            <label>State</label>
                            <input id="agencyState" class="form-control" type="text" />
                        </div>
                        <div class="col-xs-6"><br />
                            <label>PIN Code</label>
                            <input id="agencyPin" class="form-control" type="text" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Primary Contact Number</label>
                            <input id="agencyContactNoPrimary" class="form-control" type="text" />
                        </div>
                        <div class="form-group">
                            <label>Secondary Contact Number</label>
                            <input id="agencyContactNoSecondary" class="form-control" type="text" />
                        </div>
                        <div class="form-group">
                            <label>Email Id</label>
                            <input id="agencyEmailId" class="form-control" type="text" />
                        </div>
                        <div class="form-group">
                            <input id="GeneraButton" class="btn btn-default pull-right" type="button" value="Save Changes" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="box-footer">
            </div>
        </div>
    </div>
    <div>
        <div class="box box-default">
            <div class="box-header with-border">
                <h3 class="box-title">Settings for Agency</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>GST Number</label>
                            <input id="agencyGstId" class="form-control" type="text" />
                        </div>
                        <div class="form-group">
                            <label>GST Rate</label>
                            <input id="agencyGstRate" class="form-control" type="text" />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Primary Contact Number</label>
                            <input id="agencyContactNoPrimary2" class="form-control" type="text" />
                        </div>
                        <div class="form-group">
                            <label>Secondary Contact Number</label>
                            <input id="agencyContactNoSecondary2" class="form-control" type="text" />
                        </div>
                        <div class="form-group">
                            <label>Email Id</label>
                            <input id="agencyEmailId2" class="form-control" type="text" />
                        </div>
                        <div class="form-group">
                            <input id="GeneraButton2" class="btn btn-default pull-right" type="button" value="Save Changes" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="box-footer">
            </div>
        </div>
    </div>
</asp:Content>
