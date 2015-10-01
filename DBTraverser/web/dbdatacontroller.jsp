
<%@page import="java.util.List"%>
<%@page import="com.common.QueryToolServices"%>
<%@page import="com.DBTraverser.CommonServices"%>
<%

    int id1 = (Integer) session.getAttribute("id");
    String am = (String) session.getAttribute("serverIp");
    String user = (String) session.getAttribute("connectionUsername");
    String password = (String) session.getAttribute("connectionPassword");
    String dbname = (String) session.getAttribute("databaseName");
    String url = (String) session.getAttribute("connectionUrl");
    System.out.println(id1);


out.println("<fieldset style=\"width:80%;height:560px;border-color: #33ff33 ;border-radius: 8px;\">");
                                           out.println(" <legend style=\"padding: 0.2em 0.5em;border:1px solid green;color:green;font-size:90%;text-align:right;\">Table Data</legend>");
                                           out.println(" <table  width=\"100%\">");
                                              out.println("<tr>");
                                                   out.println( "<td><dl>");
                                                          
                                                           out.println("<dt><a href=\"Javascript:void(0)\" id=\"dbnames\">+</a><b>");
                                                               //   out.println(<%=session.getAttribute("databaseName")%>);
                                                          
                                                                    <%
                                                                        try {

                                                                            QueryToolServices obj = new QueryToolServices();
                                                                            List list = obj.getTables(dbname, url, user, "");
                                                                            if (list.size() > 0) {
                                                                                for (int a = 0; a < list.size(); a++) {
                                                                    %>
                                                                    <%
                                                                        String names = (String) list.get(a);

                                                                    %>
                                                                    <dd id="dd1">+<a href="Javascript:void(0)" onclick="elem('<%=names%>')"> <%=names%></a></dd>
                                                                    <%
                                                                                }
                                                                            }
                                                                        } catch (Exception e) {
                                                                            System.out.println("DD " + e);

                                                                        }

                                                                    %>

                                                                    </dl>

                                                                    </td>
                                                                    </tr>
                                                                    </table>
                                                                    </fieldset>
                                                                    %>
