package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import model.Book;
import model.Category;

/**
 * Servlet implementation class shop
 */
@WebServlet("/shop")
public class shop extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO dao = new DAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public shop() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num")); 
		HttpSession session = request.getSession();
		if(session.getAttribute("account") == null) {
			response.sendRedirect("login");
		}
		else {
			List<Category> list = dao.getCategories();
			List<Book> list_books = dao.getAllBooks(num);
			request.setAttribute("categories", list);
			request.setAttribute("list_book_by_key", list_books);
			request.getRequestDispatcher("shopItem.jsp").forward(request, response); 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
