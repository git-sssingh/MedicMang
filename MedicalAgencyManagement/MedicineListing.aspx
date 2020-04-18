<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="MedicineListing.aspx.cs" Inherits="MedicalAgencyManagement.MedicineListing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="modal fade" id="modal-default">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Add Medicine</h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="inputEmail3" class="col-sm-4 control-label">Name</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="name" placeholder="Medicine Name"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-4 control-label">Manufacturer</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="manufacturer" placeholder="Manufacturer"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-4 control-label">Medical Representative</label>

                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="mr" placeholder="Medical Representative"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-4 control-label">Expity Date</label>

                                <div class="col-sm-8">
                                    <input type="datetime" class="form-control" id="expiryDate" placeholder="Expiry Date"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-4 control-label">Mg</label>

                                <div class="col-sm-8">
                                    <input type="number" class="form-control" id="mg" placeholder="MG"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputPassword3" class="col-sm-4 control-label">Price</label>

                                <div class="col-sm-8">
                                    <input type="number" class="form-control" id="price" placeholder="Price"/>
                                </div>
                            </div>
                             <div class="form-group">
                                <label for="inputPassword3" class="col-sm-4 control-label">Current Quantity</label>

                                <div class="col-sm-8">
                                    <input type="number" class="form-control" id="quantity" placeholder="Quantity" />
                                </div>
                            </div>
                             <div class="form-group">
                                <label for="inputPassword3" class="col-sm-4 control-label">Description</label>

                                <div class="col-sm-8">
                                    <textarea class="form-control" id="medicineDescription" placeholder="Description" ></textarea>
                                 
                                </div>
                            </div>
                        </div>
                      
                       
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
           
        </div>
        
    </div>
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <div class="col-sm-6">
                            <h3 class="box-title" style="margin-left:-12px; margin-top:2px">Medicine</h3>
                        </div>
                        <div class="col-sm-6">
                            <div style="text-align:right; margin-top:-8px">
                            <button type="button" style="margin-right:-14px" class="btn bg-maroon margin" data-toggle="modal" data-target="#modal-default"><i class="glyphicon glyphicon-plus"></i> Add Medicine</button>
                        </div>
                        </div>
                    </div>
                    <div class="box-body">
                        <table id="example2" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Sr.No.</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Mg</th>
                                    <th>Manufacturer</th>
                                    <th>Expiry Date</th>
                                    <th>MR</th>
                                    <th>Description</th>
                                     <th>Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Sr.No.</th>
                                    <th>Name</th>
                                    <th>Price</th>
                                    <th>Mg</th>
                                    <th>Manufacturer</th>
                                    <th>Expiry Date</th>
                                    <th>MR</th>
                                    <th>Description</th>
                                     <th>Edit</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script src="Scripts/Medicine.js"></script>
</asp:Content>
