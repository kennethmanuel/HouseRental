<%-- 
    Document   : proses_sewa
    Created on : Jun 20, 2021, 9:01:51 AM
    Author     : Mario
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>    <%-- start web service invocation --%><hr/>
    <%
	com.servies.HouseRentalServices_Service service = new com.servies.HouseRentalServices_Service();
	com.servies.HouseRentalServices port = service.getHouseRentalServicesPort();

	

    %>
    <%-- end web service invocation --%><hr/>

        <%
            if (request.getParameterMap().containsKey("btnsubmit")) {
                    
                int idrumah = Integer.valueOf(request.getParameter("idrumah"));
                int idpenyewa = Integer.valueOf(request.getParameter("idpenyewa"));
                int harga = Integer.valueOf(request.getParameter("harga"));
                String ym=request.getParameter("ym");
                String arrDate[] = request.getParameterValues("date[]");
                for (int i = 0; i < arrDate.length; i++) {
                        ;
                        port.insertSewa(idpenyewa, idrumah, arrDate[i], harga);
                    }
                session.setAttribute("suksesInsertSewa", "sukses");
//                out.println("berhasilInsert");
                response.sendRedirect("book.jsp?ym="+ym+"&idrumah="+idrumah+"&idpenyewa="+idpenyewa);
                }
            
        %>
    </body>
</html>
