using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace OnlineBookShopShopTuto.Views.Seller
{
    public partial class Selling : System.Web.UI.Page
    {
        Models.Functions Con;
        int Seller = Login.User;
        string SName = Login.UName;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
            if (!IsPostBack)
            {
               ShowBooks();
               DataTable dt=new DataTable();
               dt.Columns.AddRange(new DataColumn[5]
               {
                    new DataColumn("ID"),
                    new DataColumn("Book"),
                    new DataColumn("Price"),   
                    new DataColumn("Quantity"),
                    new DataColumn("Total"),
               }
               );
                ViewState["Bill"] = dt;
                this.BindGrid();
            }
        }
        protected void BindGrid()
        {
            BillingList.DataSource = ViewState["Bill"];
            BillingList.DataBind();
        }
        private void ShowBooks()
        {
            string Query = "select BId as code,BName as Name,BQty as Stock,BPrice as Price from BookTbl";
            BooksList.DataSource = Con.GetData(Query);
            BooksList.DataBind();
        }
        int key = 0;
        int Stock = 0;
        protected void AuthorsList_SelectedIndexChanged(object sender, EventArgs e)
        {
            BNameTb.Value = BooksList.SelectedRow.Cells[2].Text;
            Stock = Convert.ToInt32(BooksList.SelectedRow.Cells[3].Text);
            BPriceTb.Value = BooksList.SelectedRow.Cells[4].Text;
            if (BNameTb.Value == "")
            {
                key = 0;
            }
            else
            {
                key = Convert.ToInt32(BooksList.SelectedRow.Cells[1].Text);
            }
        }
        private void UpdateStock()
        {
            int Qty;
            Qty = Convert.ToInt32(BooksList.SelectedRow.Cells[3].Text) - Convert.ToInt32(BQtyTb.Value);
            string Query = "update BookTbl set BQty={0} where BId = {1} ";
            Query = string.Format(Query, Qty, BooksList.SelectedRow.Cells[1].Text);
            Con.SetData(Query);
            ShowBooks();

        }
        private void InsertBill()
        {
            string Query = "insert into BillTbl values('{0}',{1},{2})";
            Query = string.Format(Query, "2-2-2022", Seller, Convert.ToInt32(GridTotalTb.Text.Substring(2)));
            Con.SetData(Query);
        }
        int Gridtotal;
        int Amount;
        protected void AddToBillBtn_Click(object sender, EventArgs e)
        {
            if(BQtyTb.Value==""||BPriceTb.Value==""||BNameTb.Value=="")
            {

            }
            else
            {
                int total = Convert.ToInt32(BQtyTb.Value) * Convert.ToInt32(BPriceTb.Value);
                DataTable dt = (DataTable)ViewState["Bill"];
                dt.Rows.Add(BillingList.Rows.Count + 1,
                    BNameTb.Value.Trim(),
                    BPriceTb.Value.Trim(),
                    BQtyTb.Value.Trim(),
                    total);

                ViewState["Bill"] = dt;
                this.BindGrid();
                UpdateStock();
               
                for (int i = 0; i < BillingList.Rows.Count - 1; i++)
                {
                    Gridtotal = Gridtotal + Convert.ToInt32(BillingList.Rows[i].Cells[5].Text);
                }
                Amount = Gridtotal;
                GridTotalTb.Text = "Rs" + Gridtotal;
                BNameTb.Value = "";
                BPriceTb.Value = "";
                BQtyTb.Value = "";
            }

        }

        protected void PrintBtn_Click(object sender, EventArgs e)
        {
            InsertBill();
        }
    }
}