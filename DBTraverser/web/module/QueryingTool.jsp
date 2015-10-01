



<%@page import="com.bean.autoqueriesbean"%>
<%@page import="java.util.List"%>
<%@page import="com.common.QueryToolServices"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

    int id1 = (Integer) session.getAttribute("id");
    String am = (String) session.getAttribute("serverIp");
    String user = (String) session.getAttribute("connectionUsername");
    String password = (String) session.getAttribute("connectionPassword");
    String dbname = (String) session.getAttribute("databaseName");
    String url = (String) session.getAttribute("connectionUrl");

%>
<html>
    <head>
        <script type="text/javascript">
            function trimWord(val){
                var var1="";
                var flag="";
                for(i=0 ; i< val.length ; i++)
                {
                    ch=val.charAt(i);
                    if(ch!=" "){ 
                        flag="true";
                    }
                    if(flag=="true"){ 
                        var1=var1+ch;
                    }
                }
                return var1;
            }
            
            function startsWith(val, compareWith){
                val2=trimWord(val);
               
                var len = compareWith.length;
                
                var temp  = val2.substring(0, len);
        
                if(temp.toLowerCase() == compareWith.toLowerCase()){
                    return "true";
                }
                return "false";
            }
            
            function syntaxanalyzer()
            {
               
                var a = document.getElementById("taQuery").value;
                var msg = document.getElementById("lblMessage");
                var array = new Array();
                array[0]="select";
                array[1]="insert";
                array[2]="update";
                array[3]="drop";
                array[4]="create";
                array[5]="show";
                array[6]="desc";
                array[7]="truncate";
                array[8]="delete";
                array[9]="alter";
                array[10]="help";
                
                var l=0;
                for(var i =0;i<array.length;i++)
                {
                    if((startsWith(a, array[i])=="true")  )
                    {
                        
                        l=1;
                     
                    }
                
                    if(l==1)
                    {
                        return true;
                    }
                }
                if(l==0)
                {
                    msg.innerHTML="Improper Query Syntax";
                    return false;
                }
                return true
                    
            }
            
            
        </script>


        <script type="text/javascript">
            var xmlObject;
            var query;
            function getObject()
            {
                try
                {
                    xmlObject = new XMLHttpRequest();
                }
                catch(err1)
                {
                    try
                    {
                        xmlObject= new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    catch(err2)
                    {
                        xmlObject= new ActiveXObject("Msxml2.XMLHTTP");
                    }
                }
            }
            
            function saveQuery(){ 
                var str=trimWord(document.getElementById("taQuery").value);
               
                if(str==""){ 
                    document.getElementById("lblMessage").innerHTML='Empty Query';
                
                }else{
                    var url="SaveQuery_mp.jsp";
                    url=url+"?query="+document.getElementById("taQuery").value;
                    window.location=url;
                }
               
            }
             // function to show data when table name is clicked ...............................
            function elem(str)
            {            
                getObject();              
                var url="../selectdata.jsp?user=<%=user%>&dbname=<%=dbname%>&password=<%=password%>&tbname="+str+"&url=<%=url%>";
               
                xmlObject.onreadystatechange = stateChange;
                xmlObject.open("GET",url,true);
                    
                xmlObject.send(null);

            }
            function stateChange()
            {
                if(xmlObject.readyState==4)
                {
                    var data = xmlObject.responseText;
                    document.getElementById("showtables").innerHTML=data;
                }
            }
            // function to execute query ...............................
            function elem1()
            {
                if(syntaxanalyzer()){
                    getObject();
                    query="";
                    query = document.getElementById("taQuery").value;
                    
                    var url="../Test?query="+query+"";
                    xmlObject.onreadystatechange = stateChanged;
                    xmlObject.open("GET",url,true);
                    xmlObject.send(null);
                }
            }
            function stateChanged()
            {
                if(xmlObject.readyState==4)
                {
                    var data = xmlObject.responseText; 
                    a=parseInt(data);
                    if(a==-5){
                         document.getElementById("showtables").innerHTML="Don't have privelege to create databases";
                    }else{
                        document.getElementById("showtables").innerHTML=data;
                        //to update table   tree structure
                        val2=trimWord(query);
                        compareWith="create";
                        var len = compareWith.length;
                
                        var temp  = val2.substring(0, len);
        
                        if(temp.toLowerCase() == compareWith.toLowerCase()){
                            //call ajax to refresh   tree structure
                            refreshTree(data)
                        }
                    }
                }
            }
            //  function to update tree structure 
            function refreshTree(data){
                getObject();
                var url="../TreeData?query="+data+"";
                xmlObject.onreadystatechange = function(){
                    if(xmlObject.readyState==4){ 
                       
                        a=parseInt(xmlObject.responseText);
                        if(a==-5){ 
                            document.getElementById("showtables").innerHTML='Table not Created Successfully';
                        }else{
                            document.getElementById("dbdata").innerHTML=xmlObject.responseText;
                        }
                    }
                        
                };
                xmlObject.open("GET",url,true);
                    
                xmlObject.send(null);
                
            }
            
        </script>
        <script type="text/javascript">
            function auto(syntax)
            {
                var asq = document.getElementById("taQuery");
                asq.value="";
                asq.value=syntax;
            }
            
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <form method="Get" action="../DownloadScriptServlet?dbname=<%=dbname%>">

            <table border="1" bordercolor="#9ecaed"  align="center" width="80%" style="outline:none;border-radius: 8px;

                   box-shadow:0 0 90px #9ecaed;">
                <tr><td align="center"><b>Querying Tool</b></td></tr>
                <tr><td align="center" style="color: red"><label id="lblMessage"  ></label></td></tr>
                <tr>
                    <td>

                        <table align="center" width="100%">
                            <tr>
                                <td align="left" width="20%">
                                    <b> </b>
                                </td>
                                <td align="right" colspan="2">
                                    <input class="blue" width="10px" type="button" onclick="window.location='OpenSavedQuery_mp.jsp?id=<%=id1%>'" value="Open Saved Query" id="btnSaved" name="btnSaved"/>
                                </td>
                            <tr>
                                <!-- //...........................Auto Query Box ..........................//  -->
                                <td align="center" style="height: 80%" valign="top" width="25%">
                                    <fieldset  style="width: 85%;height:275px;border-color: #33ff33 ;border-radius: 8px;" >
                                        <legend style="padding: 0.2em 0.5em;border:1px solid green;color:green;font-size:90%;
                                                text-align:right;">
                                            Auto Queries</legend>
                                        <table width="100%">
                                            <%
                                                QueryToolServices obj1 = new QueryToolServices();
                                                List aqs = obj1.getAutoQueryData();
                                                for (int p = 0; p < aqs.size(); p++) {
                                                    autoqueriesbean bean = (autoqueriesbean) aqs.get(p);

                                            %>
                                            <tr>
                                                <td>
                                                    <%=p + 1%>
                                                </td>
                                                <td>
                                                    <a href="Javascript:void(0)" style="color: #006666" onclick="auto('<%=bean.getSyntax()%>')"><%=bean.getTitle()%></a>

                                                </td>

                                            </tr>
                                            <tr><td></br></td></tr>
                                            <%
                                                }
                                            %>

                                        </table>
                                    </fieldset>

                                </td>
                                <!--    //.................................. Query Typing Box  .............................//      -->                         
                                <%
                                    String query = "";
                                    if (request.getParameter("query") != null) {
                                        query = request.getParameter("query");
                                    }
                                %>

                                <td valign="top" align="center" >
                                    <textarea  id="taQuery"   name="taQuery" style="width: 98%; height: 98%;border:1px solid #3366FF;
                                               border-left: 4px solid #3366FF;border-bottom:4px solid #3366FF;border-radius:12px 12px 12px 12px;" 
                                               rows="18%" ><%=query%></textarea>

                                </td>
                                <!--  // ............................ Table Data Tree Structure Code .............................//     -->                           
                                <td align="center" valign="top" width="28%" rowspan="3">

                                    <fieldset style="width:80%;height:560px;border-color: #33ff33 ;border-radius: 8px;">
                                        <legend style="padding: 0.2em 0.5em; border:1px solid green;color:green;font-size:90%;text-align:right;">
                                            Table Data
                                        </legend>
                                        <table  width="100%">
                                            <tr>
                                                <td>
                                                    <dl>

                                                        <dt>
                                                        <a   href="Javascript:void(0)" id="dbnames"><font size="4"> +</font></a><b><%=session.getAttribute("databaseName")%><b></dt>
                                                                <div id="dbdata">
                                                                    <%
                                                                        try {
                                                                            List list = obj1.getTables(dbname, url, user, password);
                                                                            if (list.size() > 0) {
                                                                                for (int a = 0; a < list.size(); a++) {

                                                                                    String name = (String) list.get(a);

                                                                    %>
                                                                    <dd id="dd1">+<a href="Javascript:void(0)" onclick="elem('<%=name%>')"> <%=name%></a></dd>
                                                                    <%
                                                                                }
                                                                            }
                                                                        } catch (Exception e) {
                                                                            System.out.println("DD " + e);

                                                                        }
                                                                    %>
                                                                </div>
                                                                </dl>

                                                                </td>
                                                                </tr>

                                                                </table>
                                                                </fieldset>

                                                                </td>
                                                                </tr>

                                                                <!--   // ........................................... Save and Execute Button  .......................................... //   -->
                                                                <tr >
                                                                    <td colspan="3" align="center">
                                                                        <input type="button" class="blue" id="btnSaveQuery" onclick="saveQuery()" name="btnSaveQuery" value="Save Query"/>
                                                                        <input type="button" class="blue" id="btnExecuteQuery" onclick="elem1()" name="btnExecuteQuery" value="Execute Query" />  
                                                                    </td>
                                                                </tr>

                                                                <!--     //...................................................ResultSet TextBox To Show Output .................................//  -->
                                                                <tr>
                                                                    <td align="left" colspan="2">
                                                                        <fieldset style="border-color: #33ff33 ;border-radius: 8px;" >
                                                                            <legend style="padding: 0.2em 0.5em;
                                                                                    border:1px solid green;color:green;font-size:90%;text-align:right;">
                                                                                Result Set
                                                                            </legend>
                                                                            <div id="showtables" name="showtables" style="height: 200px;border-width: 2px;overflow: auto">
                                                                                <table width="100%" class="styled" bordercolor="purple" border="1">
                                                                                    <tr>
                                                                                        <td style="height: 200px">

                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
                                                                        </fieldset>
                                                                    </td>

                                                                </tr>

                                                                </table> 

                                                                </td>
                                                                </tr>
                                                                <!--      //..................................... Button To Download ScriptFile And View Recent Activity   ............................// -->
                                                                <tr>
                                                                    <td  style="colo:red"  height="30px">
                                                                        <input class="blue" type="submit"  value="Download Script File" />
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="blue" type="button" onclick="window.location='ViewLast30DaysActivity_mp.jsp'" value="View Recent Activity" />
                                                                        <input type="hidden" value="<%=dbname%>" name="dbname"/>
                                                                    </td>

                                                                </tr>
                                                                </table>


                                                                <!--
                                                                                                                                <dd id="dd1">+<a href="Javascript:void(0)" onclick="elem('a')"> a</a></dd>
                                                                
                                                                
                                                                                                                                <dd id="dd1">+<a href="Javascript:void(0)" onclick="elem('aa')"> aa</a></dd>
                                                                
                                                                                                                                <dd id="dd1">+<a href="Javascript:void(0)" onclick="elem('add1')"> add1</a></dd>
                                                                
                                                                                                                                <dd id="dd1">+<a href="Javascript:void(0)" onclick="elem('add2')"> add2</a></dd>
                                                                
                                                                                                                                <dd id="dd1">+<a href="Javascript:void(0)" onclick="elem('add3')"> add3</a></dd>
                                                                
                                                                
                                                                                                                                <dd id="dd1">+<a href="Javascript:void(0)" onclick="elem('add4')"> add4</a></dd>
                                                                
                                                                                                                                <dd id="dd1">+<a href="Javascript:void(0)" onclick="elem('der')"> der</a></dd>
                                                                
                                                                                                                                <dd id="dd1">+<a href="Javascript:void(0)" onclick="elem('t')"> t</a></dd>
                                                                
                                                                                                                                <dd id="dd1">+<a href="Javascript:void(0)" onclick="elem('tbl')"> tbl</a></dd>-->


                                                                </form>
                                                                </body>
                                                                </html>
