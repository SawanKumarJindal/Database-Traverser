





<%@page import="com.bean.CountryStateCityBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.common.CountryStateCityServices"%>
<%

        response.setHeader("Cache-Control", "no-cache");

        String id = request.getParameter("q");
        %>
        <select id="ddlCity" name="ddlCity" style="width: 126px" > 
     <option value="-2" selected="selected">Select</option>
        
<%
        if(id.equalsIgnoreCase("-2")){
        }else{
            CountryStateCityServices objServices=new CountryStateCityServices();
        ArrayList al=objServices.getAllCityList(Integer.parseInt(id));
       %>


    <%
        for (int a = 0; a < al.size(); a++) {
          CountryStateCityBean obj=(CountryStateCityBean)al.get(a);
           
        %>

        <option value="<%=obj.getTxtCityId()%>"><%=obj.getDdlCityName()%></option>

        <%
        } }%>

</select>