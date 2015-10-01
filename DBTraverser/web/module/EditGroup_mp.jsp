<%@include file="LogoutCheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DBTraverser</title>
        <jsp:include page="stylesheet.jsp"/>
         <script type="text/javascript">
            function MarkAll(objCheckBox)
            {
                var strSelect = document.getElementsByName("chkSelect");

                for(i=0;i<strSelect.length;i++)
                {
                    if(objCheckBox.checked==true)
                        {
                             strSelect[i].checked=true;
                        }
                   else
                       {
                            strSelect[i].checked=false;
                       }
                   
                }
            }
            function ValidityVisibility(objRadioButton)
            {
                if(objRadioButton.id=="rbYes")
                {
                
                    document.getElementById("dvValidity").style.visibility='hidden';
                }        
                    
                else
                {
               
                    document.getElementById("dvValidity").style.visibility='visible';
                      
                }
            }
            function ValidateEditGroupForm()
            {  
                var strTitle = document.getElementById("txtTitle").value;
                if(isEmpty(strTitle))
                {
                    alert("Title Field cannot be Empty");
                    document.getElementById("txtTitle").focus();
                    return false;
                }
                var strCost = document.getElementById("txtCost").value;
                if(isEmpty(strCost))
                {
                    alert("Enter Cost");
                    document.getElementById("txtCost").focus();
                    return false;
                }
                if(document.getElementById("rbNo").checked==true)
                {
                var strValidity = document.getElementById("txtValidity").value;
                    if(isEmpty(strValidity))
                    {
                        alert("Enter Validity");
                        document.getElementById("txtValidity").focus();
                        return false;
                    }  
                }
                var flag="0";
                var strSelect = document.getElementsByName("chkSelect");
       
                for(i=0;i<strSelect.length;i++)
                {
                
                    if(strSelect[i].checked==true)
                    {
                       
                        flag="1";
                    }
                }
                
                if(flag=="0")
                {
                    alert("Select Rights")
                    return false;
                }
                if((document.getElementById("rbActive").checked==false)&&(document.getElementById("rbInactive").checked==false))
            {
                alert("Select Status");
                document.getElementById("rbActive").focus();
                return false;
            }
                return true;
           
            }
        </script>
    </head>
    <body style="padding: 0 0 0 0; margin: 0 0 0 0;">
        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color: #eaece0;">
            <tr>
                <td>
                    <div style="width: 100%; height: 5px; background-color: #3a477a">
                    </div>
                </td>
            </tr>
            <tr>
                <td style="background-image: url(../images/header-gradient.png); background-position: left center;
                    background-repeat: repeat-x;">
                    <jsp:include page="header.jsp"/>
                </td>
            </tr>
       

            <tr>
                <td>
                    <div style="background: #dde7fa; background-repeat: repeat-x; background-position: center center;
                         height: 50px;">

                        <div style="width: 100%; height: 5px; background-color: #3a477a">
                        </div>
                        <div style="width: 980px; height: 20px; margin: 0 auto;">
                            <jsp:include page="topmenu.jsp" />
                        </div>

                    </div>
                    <div style="width: 100%; height: 5px; background-color: #3a477a">
                    </div>
                </td>
            </tr>


            <tr>
                <td style="background-color: #fff;">
                    <!--Middle-->
                    <table border="0" cellpadding="0" cellspacing="0" style="width: 980px; height: 350px;
                           min-height: 350px; margin: 0 auto; border-left: solid 1px #eeeeee; border-right: solid 1px #eeeeee;">
                        <tr>
                            <td>
                                <jsp:include page="EditGroup.jsp"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <jsp:include page="footer.jsp"/>
                </td>
            </tr>
        </table>
    </body>
</html>

