<%-- 
    Document   : book.jsp
    Created on : Mar 25, 2024, 10:21:09 AM
    Author     : 503
--%>

<%@page import="model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book list</title>
        <link rel="stylesheet" href="style.css"/>
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            h1 {
                text-align: center;
                margin-top: 30px;
            }

            .add-book-link {
                display: block;
                text-align: center;
                margin-bottom: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
                font-weight: bold;
            }

            .delete-form {
                display: inline-block;
            }

            .delete-button {
                background-color: #ff4f4f;
                color: white;
                border: none;
                padding: 8px 12px;
                border-radius: 5px;
                cursor: pointer;
            }

            .delete-button:hover {
                background-color: #ff3333;
            }
        </style>
    </head>
    <body>
        <h1>Book List</h1>
        <a href="addBook.jsp" class="add-book-link">Add new Book</a>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Author</th>
                    <th>Published Year</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Book> books = (ArrayList<Book>) session.getServletContext().getAttribute("bookList");
                    if (books != null) {
                        for (int i = 0; i < books.size(); i++) {
                            Book x = books.get(i);
                %>    
                <tr>
                    <td><%=x.getName()%></td>
                    <td><%=x.getAuthorName()%></td>
                    <td><%=x.getPublishYear().getYear()%></td>

                </tr>
                <%}
                    }
                %>
            </tbody>
        </table>
    </body>
</html>