<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Seller/SellerMaster.Master" AutoEventWireup="true" CodeBehind="Selling.aspx.cs" Inherits="OnlineBookShopShopTuto.Views.Seller.Selling" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function PrintBill() {
            var PGrid = document.getElementById('<%=BillingList.ClientID%>');
            PGrid.bordr = 0;
            var PWin = window.open('', 'PrintGrid', 'left=100,top=100,width=1024,height=768,tollbar=0,scrollbar=1,status=0,resizable=1');
            PWin.document.write(PGrid.outerHTML);
            PWin.document.close();
            PWin.focus();
            PWin.print();
            PWin.close();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContent" runat="server">
    
    <div class="container-fluid">
        <div class="row">

        </div>

        <div class="row">
            <div class="col-md-5">
                        <h3 class="text-center" style="color:teal;">Book Details</h3>
                <div class="row">
                    <div class="col">
                        <div class="mt-3">
                        <label for="" class="form-label text-success">Book Name</label>
                        <input type="text" placeholder="Your Book Name Here" autocomplete="off" runat="server" class="form-control" id="BNameTb" />

                        </div>
                    </div>
                      <div class="col">
                        <div class="mt-3">
                        <label for="" class="form-label text-success">Book Price</label>
                        <input type="text" placeholder="Price" autocomplete="off" runat="server" class="form-control" id="BPriceTb" />

                        </div>
                    </div>
                </div>
                 <div class="row">
                    <div class="col">
                        <div class="mt-3">
                        <label for="" class="form-label text-success">Quantity</label>
                        <input type="text" placeholder="Quantity" autocomplete="off" runat="server" class="form-control" id="BQtyTb" />

                        </div>
                    </div>
                      <div class="col">
                        <div class="mt-3">
                        <label for="" class="form-label text-success">Billing Date</label>
                            <input type="date" runat="server" class="form-control" id="DateTb" />

                        </div>
                    </div>
                     <div class="row mt-3 mb-3">
                         <div class="col d-grid">
                             <asp:Button Text="Add To Bill" runat="server" ID="AddToBillBtn" class="btn-warning btn-block btn" OnClick="AddToBillBtn_Click"/>
                         </div>

                     </div>
                </div>
                <div class="row mt-5">
                    <h3 class="text-center" style="color:teal;">Book List</h3>

                    <div class="col">
                        <asp:GridView ID="BooksList" runat="server" class="table " CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" OnSelectedIndexChanged="AuthorsList_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="teal" Font-Bold="false" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                    </div>
                </div>
            </div>
            <div class="colo-md-7">
                <h3 class="text-center" style="color:red;">Client's Bill</h3>

                    <div class="col">
                        <asp:GridView ID="BillingList" runat="server" class="table " CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" OnSelectedIndexChanged="AuthorsList_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="SkyBlue" Font-Bold="false" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>

                        
                        <div class=" d-grid"> 
                            <asp:Label runat="server" ID="GridTotalTb" class="text-danger text-center"></asp:Label><br />
                            <asp:Button Text="Print" runat="server" ID="PrintBtn" OnClientClick="PrintBill()" class="btn-warning btn-block btn" OnClick="PrintBtn_Click"/></div>
                        </div>
            </div>
        </div>
    </div>
</asp:Content>
