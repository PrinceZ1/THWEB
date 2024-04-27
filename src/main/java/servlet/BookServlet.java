/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.Month;
import jakarta.servlet.ServletContext;
import java.util.ArrayList;
import model.Book;

/**
 *
 * @author 503
 */
@WebServlet(name = "BookServlet", urlPatterns = {"/bookServlet"})
public class BookServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd = request.getServletContext().getRequestDispatcher("/book.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        ArrayList<Book> books = getBookList(request);

        String name = request.getParameter("name");
        String authorName = request.getParameter("authorName");
        Integer publishYear = Integer.parseInt(request.getParameter("publishYear"));
        LocalDate publishedYear = LocalDate.of(publishYear, LocalDate.now().getMonth(), LocalDate.now().getDayOfMonth());
        books.add(new Book(name, authorName, publishedYear));
        updateBookList(request, books);
        doGet(request, response);
    }

    private ArrayList<Book> getBookList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ServletContext servletContext = session.getServletContext();
        ArrayList<Book> bookList = (ArrayList<Book>) servletContext.getAttribute("bookList");
        if (bookList == null) {
            bookList = new ArrayList<Book>();
            servletContext.setAttribute("bookList", bookList);
        }
        return bookList;
    }

    private void updateBookList(HttpServletRequest request, ArrayList<Book> bookList) {
        HttpSession session = request.getSession();
        ServletContext servletContext = session.getServletContext();
        servletContext.setAttribute("bookList", bookList);
    }
}
