<%@include file="LogoutCheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DBTraverser</title>
        <jsp:include page="stylesheet.jsp"/>
         <script  type="text/javascript">
             $(function() {
               
                $("#txtBirth").datepicker();
                $('#txtBirth').datepicker('option',
                {
                    dateFormat : 'yy-mm-dd' ,
                    maxDate:0,
                    // minDate:-1,
                    changeMonth:true,
                    changeYear:true
                }
            );

            });
        </script>
        <script type="text/javascript">
            var objHttp;
            var i=0;
            function getXMLHttpRequest(){

                objHttp = new XMLHttpRequest();
                if(objHttp == null){
                    objHttp = new ActiveXObject();
                }
                if(objHttp == null){
                    alert("Your browser doesn't support ajax");
                }
            }
            
            function showState(str)
            {
                if(str=="-2"){
                    document.getElementById("divState").innerHTML='<select id="ddlState" name="ddlState"><option value="-2" >Select</option></select>'
                    document.getElementById("divCity").innerHTML='<select id="ddlCity" name="ddlCity"><option value="-2" >Select</option></select>'
                }else{
                
                    i=1;
                    getXMLHttpRequest();

                    var url="getState.jsp";
                    url=url+"?q="+str;
                    objHttp.onreadystatechange = stateChanged;
                    objHttp.open("GET",url,true);
                    objHttp.send(null);
                }
            }
            function showCity(str)
            {
                if(str=="-2"){
                    document.getElementById("divCity").innerHTML='<select id="ddlCity" name="ddlCity"><option value="-2" >Select</option></select>'
                }else{
                
                    i=2;
                    getXMLHttpRequest();
                    var url="getCity.jsp";
                    url=url+"?q="+str;
                    objHttp.onreadystatechange = stateChanged;
                    objHttp.open("GET",url,true);
                    objHttp.send(null);
                }
            }

            function stateChanged()
            {
                if (objHttp.readyState==4)
                {
                    if(i==1) {
                        document.getElementById("divState").innerHTML=objHttp.responseText
                        document.getElementById("divCity").innerHTML='<select id="ddlCity" name="ddlCity"><option value="Select" >Select</option></select>';
                    }
                    else if(i==2){document.getElementById("divCity").innerHTML=objHttp.responseText;
                    }                  
                }
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
                                <jsp:include page="ManageProfileRegisteredUser.jsp"/>
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

