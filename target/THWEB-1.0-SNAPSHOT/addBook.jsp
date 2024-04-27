<%-- 
    Document   : addBook.jsp
    Created on : Mar 25, 2024, 10:42:43 AM
    Author     : 503
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Book</title>
        <link rel="stylesheet" href="addBook.css"/>
    </head>
    <body>
        <h1>Add Book</h1>
        <form action="bookServlet" method="post">
            <div>
                <label>Name:</label>
                <input type="text" name="name"/>
            </div>
            <div>
                <label>Author:</label>
                <input type="text" name="authorName"/>
            </div>
            <div>
                <label>Published Year:</label>
                <input type="text" name="publishYear"/>
            </div>
            <input type="hidden" name="action" value="add"/>
            <input type="submit" value="Add"/>
        </form>
    </body>
</html>
