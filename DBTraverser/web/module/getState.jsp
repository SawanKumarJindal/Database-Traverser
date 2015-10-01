



<%@page import="com.bean.CountryStateCityBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.common.CountryStateCityServices"%>
<%
        response.setHeader("Cache-Control", "no-cache");

        String id = request.getParameter("q");
        %>
        <select id="ddlState" name="ddlState"  onchange="showCity(this.value);"  >
    <option value="-2" selected="selected">Select</option>
<%
        if(id.equalsIgnoreCase("-2")){
        }else{
        ArrayList al;
        CountryStateCityServices objServices=new CountryStateCityServices();
        al = objServices.getAllStateList(Integer.parseInt(id));
       %>


<%
        for (int a = 0; a < al.size(); a++) {
            CountryStateCityBean obj=(CountryStateCityBean)al.get(a);
            
        %>
            
        <option value="<%=obj.getTxtStateId()%>" ><%=obj.getDdlStateName()%></option>
        
        <%
       } }
%>

</select>  