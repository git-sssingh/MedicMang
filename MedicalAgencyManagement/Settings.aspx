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
                        <div class="col-xs-12">
                            <label>Primary Contact Number</label>
                            <input id="agencyContactNoPrimary" class="form-control" type="tel" />
                        </div>
                        <div class="col-xs-12"><br />
                            <label>Secondary Contact Number</label>
                            <input id="agencyContactNoSecondary" class="form-control" type="tel" />
                        </div>
                        <div class="col-xs-12"><br />
                            <label>Email Id</label>
                            <input id="agencyEmailId" class="form-control" type="email" />
                        </div>
                        <div class="col-xs-12"><br />
                            <label>GST Number</label>
                            <input id="agencyGstId" class="form-control" type="text" />
                        </div>
                          <div class="col-xs-6"><br />
                            <label>Center GST Rate</label>
                            <input id="agencyCenterGstRate" class="form-control" type="text" />
                        </div>
                         <div class="col-xs-6"><br />
                            <label>State GST Rate</label>
                            <input id="agencyStateGstRate" class="form-control" type="text" />
                        </div>
                        <div class="col-xs-12"><br />
                            <div id='loader' class="btn btn-default pull-left" style='display: none; text-align: center'>
                                <img src='dist/img/ajax-loader.gif'>
                            </div>
                             <label id="msgFirst" style="color:forestgreen"></label>
                            <input id="GeneraButton" class="btn btn-default pull-right" type="button" value="Save Changes" />
                        </div>
                        <div class="col-xs-12"><br />
                          
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
                <h3 class="box-title">Logo for Agency</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                </div>
            </div>
            <div class="box-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="col-xs-6">
                            <label>Logo</label>
                            <input id="logo" type="file" /><label id="msgSecond" style="color:forestgreen"></label>
                        </div>
                        <div class="col-xs-6">
                            <input id="GeneraButton2" class="btn btn-default pull-right" type="button" value="Upload Logo" />
                        </div>
                        <div class="col-xs-12"><br />
                            <img id="agencyLogo" alt="" style="height:150px; width:150px" src="dist/img/defaultlogo2.png" />
                        </div>
                        
                        <div class="col-xs-12"><br />
                           
                        </div>
                    </div>
                </div>
            </div>
            <div class="box-footer">
            </div>
        </div>
    </div>
    <script src="Scripts/Settings.js"></script>
</asp:Content>
