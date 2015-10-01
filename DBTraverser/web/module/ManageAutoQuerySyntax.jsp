
<%@page import="com.bean.ManageAutoQuerySyntaxBean"%>
<%@page import="java.util.List"%>

<%@page import="com.DBTraverser.ManageAutoQuerySyntaxServices"%>
<!--
To change this template, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE HTML>
<%
    ManageAutoQuerySyntaxServices service = new ManageAutoQuerySyntaxServices();
    List list = service.showQueries();
    ManageAutoQuerySyntaxBean objBean = null;
    String msg = "";




%>
<html>
  <head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="validations.js"></script>
         <script type="text/javascript">
            
             function check()
             {
                 
        var search = document.getElementById("txtSearch").value;
             var msg = document.getElementById("lblMessage");
           var emps   =   isEmpty(search);
          alert(emps); 
         
           
                 if(emps==true)
                     {
                          document.getElementById("txtSearch").focus();
                        msg.innerHTML="Enter Search Parameters";
                        return false;
                         
                     }
                 
                     else
                         {
                             msg.innerHTML="";
                             return true;
                             
                         }
             }
             
         </script>
  </head>
  <body>
       <form action="AddAutoQuerySyntax_mp.jsp" method="POST" onsubmit="return check()">
          <table align="center" width="80%">
              <tr>
                  <td colspan="2">
                      <hr/>
                  </td>
              </tr>
              <tr>
                  <td align="center">
                      <b>Manage Auto Query Syntax</b>
                  </td>
              </tr>
              <tr>
                  <td align="left">
                      <label id="lblMessage"></label>
                  </td>
              </tr>
              <tr>
                  <td align="left">
                      <input type="submit" class="blue"   id="btnAddName" name="btnAddName" value="Add Query"/>
                  </td>
                  
              </tr>
              <tr>
                  <td colspan="2">
                      <table border="2" class="styled" align="center" width="100%">
                          <tr class="header">
                              <th width="5%"><b>S.No</b></th>
                              <th width="15%"><b>Title</b></th>
                              <th width="50%"><b>Syntax</b></th>
                              
                              <th width="15%"></th>
                          </tr>
                           <%
                                if (list.size() > 0) {
                                    for (int a = 0; a < list.size(); a++) {
                                        objBean = (ManageAutoQuerySyntaxBean) list.get(a);
                                        String strClass = "";
                            if (a % 2 == 0) {
                                strClass = "alt";
                            }
             %>
             <tr class="<%=strClass%>">
                              <td>
                                  <%=a+1%>
                              </td>
                              <td>
                                  <%=objBean.getTitle()%>
                              </td>
                              <td>
                                  <%=objBean.getQuerySyntax()%>
                              </td>
                             
                              <td>
                                  <a href="ViewEditAutoQuerySyntax_mp.jsp?id=<%=(Integer)objBean.getAutoQueryId()%>">View & Edit</a>
                              </td>
                              </tr>
                               <%                                         }
                                } else {
                                    out.println("No record Found");
                                }
                            %>
                      </table>
                      </td>
              </tr>
          </table>
      </form>
  </body>
</html>
