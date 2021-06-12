<%@ Page Title="" Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="MedicalAgencyManagement.Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="invoice">
        <!-- title row -->
        <div class="row">
            <div class="col-xs-12">
                <h2 class="page-header">
                    <i class="fa fa-globe"></i>  <span id="agencyname"></span>
                    <small class="pull-right" id="genrationDate"></small>
                </h2>
            </div>
            <!-- /.col -->
        </div>
        <!-- info row -->
        <div class="row invoice-info">
            
            <div class="col-sm-4 invoice-col">
                From
          <address>
              <strong id="addressAgencyName"></strong>
              <br>
              <span id="addressAgency1"></span>
              <br>
              <span id="addressAgency2"></span>
              <br>
              Phone: <span id="addressAgencyPhone"></span>
              <br>
              Email: <span id="addressAgencyEmail"></span>
          </address>
            </div>
            <!-- /.col -->
            <div class="col-sm-4 invoice-col">
                To
          <address>
              <strong id="customerName"></strong>
              <br>
              <span id="addressCustomer1"></span>
              <br>
              <span id="addressCustomer2"></span>
              <br>
              Phone: <span id="addressCustomerPhone"></span>
              <br>
              Email: <span id="addressCustomerEmail"></span>
          </address>
            </div>
            <!-- /.col -->
            <div class="col-sm-4 invoice-col">
                <b id="invoiceNumber"></b>
                <br />
                <img id="agencyLogo" style="height: 100px; width: auto" />
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

        <!-- Table row -->
        <div class="row">
            <div class="col-xs-12 table-responsive">
                <table class="table table-striped" id="productTable">
                    <thead>
                        <tr>
                            <th>Qty</th>
                            <th>Product</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

        <div class="row">
            <!-- accepted payments column -->
            <div class="col-xs-6">
                <p class="lead">Accepted Payment Methods:</p>
                <img src="../../dist/img/credit/vsa.png" alt="Visa">
                <img src="../../dist/img/credit/mcard.png" alt="Mastercard">
                <img src="../../dist/img/credit/gpay.png" alt="Google Pay">
                <img src="../../dist/img/credit/paytm.png" alt="Paytm">

                <p class="text-muted well well-sm no-shadow" style="margin-top: 10px; height: 100px">
                </p>
            </div>
            <!-- /.col -->
            <div class="col-xs-6" id="totalSection">
                <p class="lead">Total Amount</p>

                <div class="table-responsive">
                    <table class="table" id="subTotalTable">
                        <tbody>
                        </tbody>

                    </table>
                </div>
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->

        <!-- this row will not appear when printing -->
        <div class="row no-print">
            <div class="col-xs-12">
                <a id="printSection" target="void(0)" class="btn btn-default"><i class="fa fa-print"></i>Print</a>

            </div>
        </div>
    </section>
    <script src="Scripts/Invoice.js"></script>
</asp:Content>
