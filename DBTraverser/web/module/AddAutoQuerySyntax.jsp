
<html>
    <head>
        <title></title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="validations.js"></script>
        <script type="text/javascript">
            function check()
            {
                
                var title=document.getElementById("txtTitle").value;
                var syntax=document.getElementById("taSyntax").value;
                var msg = document.getElementById("lblMessage");
                var empt=isEmpty(title);
                var emps=isEmpty(syntax);
               
                if(empt==true)
                {
                        
                    document.getElementById("txtTitle").focus();
                        
                    msg.innerHTML="Please Provide a Title";
                    return false;
                } 
                   
                if(emps==true)
                {
                        
                    document.getElementById("taSyntax").focus();
                    msg.innerHTML="Please Enter the Syntax";
                    return false;
                }
                    
                else{    
                    msg.innerHTML="";
                    return true;
                }
                    
            }
        </script>
    </head>
    <body>
        <form action="autoQueryController.jsp" method="POST" onsubmit="return check()">
            <table align="center" width="40%">
                <tr><td align="center"><b>Add New Auto Query Syntax</b></td></tr>
                <tr><td align="left" style="color: red"><label id="lblMessage" ></label></td></tr>
                <tr>
                    <td>
                        <fieldset>
                            <legend><b><I>Auto Query Syntax </I></b></legend>
                            <table width="100%">
                                <tr><td>
                                        <b>Title</b>
                                    </td>
                                    <td>
                                        <input type="text" class="txtStyle" id="txtTitle" name="txtTitle"/>
                                    </td>
                                </tr>
                                <tr><td>
                                        <b>Syntax</b>
                                    </td>
                                    <td>
                                        <textarea id="taSyntax" class="txtStyle"  rows="7" cols="50" name="taSyntax"></textarea>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                    </td>
                </tr>
                <tr>

                    <td >
                        <table><tr><td>
                        <input type="submit" id="sbtnSave" class="blue" name="sbtnSave" value="Save" /></td><td>
                        <input type="submit" id="sbtnSaveAddNew" class="blue" name="sbtnSaveAddNew" value="Save & Add New"  /></td><td><input type="button" id="btnCancel" onclick="window.location='ManageAutoQuerySyntax_mp.jsp'" name="btnCancel" class="blue" value="Cancel"  /></td>
                       <!-- <input type="reset" id="rbtnReset" class="blue" name="rbtnReset" value="Reset"/> &nbsp;&nbsp;&nbsp;-->
                       </tr> </table>
                    </td>
                </tr>
            </table>

        </form>
    </body>
</html>
