<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reimbursement-form.aspx.cs" Inherits="Reimbursement.Reimbursement_form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
$(document).ready(function(){ 
    $("input[name$='Conveyance']").click(function() {
        var test = $(this).val();
        $("div.desc").hide();
        $("#"+test).show();
    }); 
});
</script>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblmonth" runat="server" Text="Select Month :"></asp:Label>
            <asp:DropDownList ID="ddlMonth" runat="server"></asp:DropDownList>

            <br/><br/><br/>

            <div id="myRadioGroup">

            Conveyance<input type="radio" name="Conveyance" checked="checked" value="1"  />
            Hotel<input type="radio" name="Hotel" value="2" />
            Food<input type="radio" name="Food" value="3" />
                <br/><br/>
                Mobile<input type="radio" name="Mobile"  value="4"  />
            Internet<input type="radio" name="Internet" value="5" />
            Other<input type="radio" name="Other" value="6" />
                </div>

            <div>
                <table runat="server" id="tbldetails">
                    <tbody>
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="lbldate" runat="server" Text="Date"></asp:Label>
                                <asp:Label ID="lbldateup" runat="server" Text="1-Jan-2019"></asp:Label>
                            </td>                           
                            </tr>
                        <tr><td>
                            <asp:Label ID="lblfrm" runat="server" Text="From"></asp:Label>
                            <asp:TextBox ID="txtfrm" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblto" runat="server" Text="To"></asp:Label>
                                <asp:TextBox ID="txtto" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                <asp:Label ID="lblpurpose" runat="server" Text="Purpose"></asp:Label>
                                <asp:DropDownList runat="server" ID="ddlpurpose" OnSelectedIndexChanged="ddlpurpose_SelectedIndexChanged">
                                   
                                                    <asp:ListItem Value="1" Text="Market Visit" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Other City Travel"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Office Visit"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="Training"></asp:ListItem>
                                                    <asp:ListItem Value="5" Text="Other"></asp:ListItem> 
                                </asp:DropDownList>

                                <asp:TextBox ID="txtOther" runat="server"></asp:TextBox>
                                </td>
                            <td>
                <asp:Label ID="lblMode" runat="server" Text="Mode"></asp:Label>
                <asp:DropDownList runat="server" ID="ddlmode" OnSelectedIndexChanged="ddlmode_SelectedIndexChanged">
                    
                                                    <asp:ListItem Value="1" Text="Bike" Selected="True"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="Bus"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="Taxi"></asp:ListItem>
                                                    <asp:ListItem Value="4" Text="Train"></asp:ListItem>
                                                    <asp:ListItem Value="5" Text="Auto"></asp:ListItem>
                                                    <asp:ListItem Value="6" Text="Other"></asp:ListItem>
                </asp:DropDownList>
                                <asp:TextBox ID="txtOther1" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                <asp:Label ID="lblkm" runat="server" Text="Km"></asp:Label>
                <asp:TextBox ID="txtkm" runat="server" Text=""></asp:TextBox>
                </td>
                <td>
                <asp:Label ID="lblinvno" runat="server" Text="InvNo"></asp:Label>
                <asp:TextBox ID="txtInvno" runat="server" Text=""></asp:TextBox>
                </td>
                <td>
                <asp:Label ID="lblAmt" runat="server" Text="Amt"></asp:Label>
                <asp:TextBox ID="txtamt" runat="server" Text=""></asp:TextBox>
                </td>
                <td>
                <asp:Label ID="lblattachement" runat="server" Text="Attachment"></asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                
                            </td>
                        </tr>
                         <tr></tr>
                    </tbody>
                </table>
               

                <asp:Button ID="btnsubmit" runat="server" Text="Submit" />
        </div>
            </div>
        Fetch reimbursement form daetails date wise - <asp:TextBox ID="txtdate" runat="server"></asp:TextBox> 
        <asp:Button ID="Button1" runat="server" Text="Button" OnClientClick="adddetails()" />
        <div>

        </div>
    </form>
</body>
    <script>
        function AddDetail() {  
         
            var Emp = {};
            Emp.month=$("#ddlmonth").val(); 
            Emp.reim = $("#radio").val();  
            Emp.frm = $("#txtfrm").val();           
            Emp.to = $("#txtto").val();  
            Emp.purpose = $("#ddlpurpose").val();  
            Emp.mode = $("#ddlmode").val();           
            Emp.km = $("#txtkm").val();
            Emp.Invno = $("#txtInvno").val();  
            Emp.amt = $("#txtamt").val();  
            Emp.mode = $("#ddlmode").val();           
            Emp.FileUpload1 = $("#FileUpload1").val();
            
  
 
   $.ajax({  
      url:"<%=Page.ResolveUrl("/api/Emp/AddDetails")%>",   
      type: "POST",  
      contentType: "application/json;charset=utf-8",  
      data: JSON.stringify(Emp),  
      dataType: "json",  
      success: function (response) {  
  
        alert(response);  
                       
     },  
  
     error: function (x, e) {  
         alert('Failed');  
         alert(x.responseText);  
         alert(x.status);  
  
     }  
  });  
    
}       
    
$(document).ready(function ()  
{  
  
    $("#btnsubmit").click(function (e) {  
              
       AddDetails();  
       e.preventDefault();  
  
    });  
  
}); 

        function GetDetailInfo(handleData) {
                var lsdate = '';
                var lsdate = $('#<%= txtdate.ClientID%>').val();
            $.ajax({

                type: "GET",

                    url: '/api/values/Getrecord?',
                    data: 'ticks=' + new Date().getTime() + '&daate=' + lsdate,
                    success: function (data, status, xhr) {

                        alert("The result is : " + data.Table[0].Email);

                    },

                    error: function (xhr) {

                        alert(xhr.responseText);
                
                
                }
            });
            }
    </script>
</html>
