<%-- 
    Document   : home.jsp
    Created on : Mar 25, 2024, 9:37:22 AM
    Author     : 503
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String username = (String) session.getAttribute("username");
    String error = (String) request.getAttribute("error");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <%
            if(username != null)
            {%>
                <h1>Welcome to my page, <%= username%></h1>
                <a href="bookServlet">View book List</a>
            <%}
            else
            {%>
                <h1><%=error%></h1>
            <%}
        %>
    </body>
</html>
