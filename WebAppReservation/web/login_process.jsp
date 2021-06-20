<%-- 
    Document   : login_process.jsp
    Created on : Jun 19, 2021, 7:46:04 PM
    Author     : Mario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>    <%-- start web service invocation --%><hr/>
    <%
    try {
	com.servies.HouseRentalServices_Service service = new com.servies.HouseRentalServices_Service();
	com.servies.HouseRentalServices port = service.getHouseRentalServicesPort();
	 // TODO initialize WS operation arguments here
         if (request.getParameterMap().containsKey("btnsubmit")) {
            String uname = request.getParameter("username");
            String passwd = request.getParameter("password");
	// TODO process result here
	java.lang.Boolean result = port.login(uname, passwd);
	    if (result) {
                session.setAttribute("username", uname);
                response.sendRedirect("index.jsp");
            }
            else{
                session.setAttribute("failedLogin", "failed");
                response.sendRedirect("login.jsp");
            }
            
        }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>

<%
    
%>
