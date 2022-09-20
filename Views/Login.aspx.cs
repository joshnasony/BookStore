using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineBookShopShopTuto.Views
{
    public partial class Login : System.Web.UI.Page
    {
        Models.Functions Con;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
            
        }
        public static string UName = "";
        public static int User;

        protected void LoginBtn_Click1(object sender, EventArgs e)
        {
            if(UnameTb.Value==""||passwordTb.Value=="")
            {
                ErrMsg.Text = "Missing Data!!";
            }
            else if(UnameTb.Value=="Admin@gmail.com" && passwordTb.Value=="Password")
            {
                Response.Redirect("Admin/Books.aspx");
            }
            else
            {
                string Query = "select * from SellerTbl where SelEmail ='{0}' and SelPass='{1}'";
                Query = string.Format(Query, UnameTb.Value, passwordTb.Value);
                DataTable dt = Con.GetData(Query);
                if(dt.Rows.Count==0)
                {
                    Response.Redirect("Admin/Book.aspx");
                }
                else
                {
                    UName=UnameTb.Value;
                    User = Convert.ToInt32(dt.Rows[0][0].ToString());
                    Response.Redirect("Seller/Selling.aspx");
                }
            }
        }
    }
}