package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import model.Account;
import model.Book;
import model.Cart;
import model.Category;

/**
 * Servlet implementation class cate
 */
@WebServlet("/cate")
public class cate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO dao = new DAO();
    
    public cate() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		int num = Integer.parseInt(request.getParameter("num"));
		
		List<Book> list_book_cate =dao.getBooksByCate(id, num);
		
		List<Category> list = dao.getCategories();
		Category cate = dao.getCateById(id);
		
		request.setAttribute("categories", list);
		request.setAttribute("list_book_cate", list_book_cate);
		request.setAttribute("cate", cate);
		request.setAttribute("id", id);
		request.getRequestDispatcher("shop.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
