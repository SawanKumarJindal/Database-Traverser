

<%@page import="com.bean.LoginBean"%>
<%@page import="com.DBTraverser.CommonServices"%>
<%@page import="com.DBTraverser.SendSMTP"%>

<%
     if (request.getParameter("sbtnSubmit") != null) {
                String un = request.getParameter("txtUserName");

                CommonServices obj = new CommonServices();
                LoginBean objBean = obj.ForgotPassword(un);
                if (objBean == null) {

                    response.sendRedirect("ForgotPassword_mp.jsp?msg=invalid username");
                } else {
                    String email = objBean.getEmail();
                    String pwd = objBean.getPassword();

                    String msg = "Password is" + pwd;
                    String sub = "recover password";
                    SendSMTP.sendMail(email, msg, sub);
                    response.sendRedirect("ForgotPassword_mp.jsp?msg=send");

                }
            }

%>