<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineBookShopShopTuto.Views.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link rel="stylesheet" href="../Assets/Lib/css/bootstrap.min.css" />
</head>
    <style type="text/css">
        .auto-style2 {
            align-content: center!important;
            height: 79px;
            margin-right: 0px;
            width: 85px;
        }
    </style>

<body>
    <div class="container-fluid">
        <div class="row mt-5 mb-5">

        </div>
         <div class="row">
             <div class="col-md-4">

             </div>
              <div class="col-md-4">
             <form id="form1" runat="server">
                 <div>
                     <div class="row">
                         <div class="col-md-4"></div>
                         <div class="col-md-8">
                             <img src="../Assets/Images/Book.svg.png" class="auto-style2"/>

                         </div>

                     </div>
                     
                 </div>
                <div class="mt-3">
                    <label for="" class="form-label">User Name</label>
                    <input type="email" placeholder="Your Email Here" autocomplete="off" runat="server" class="form-control" id="UnameTb" />

                </div>
                 <div class="mt-3">
                    <label for="" class="form-label">Password</label>
                    <input type="Password" placeholder="Password" autocomplete="off" runat="server" class="form-control" id="passwordTb" />

                </div>
                 <div class="mt-3 d-grid">
                     <asp:Label runat="server" ID="ErrMsg" class="text-danger text-center"></asp:Label><br />
                     <asp:Button Text="Login" runat="server" class="btn-success btn" ID="LoginBtn" OnClick="LoginBtn_Click1"/>
                 </div>
         </form>
          </div>
             <div class="col-md-4">

             </div>
 
    </div>
   </div>
</body>
</html>
