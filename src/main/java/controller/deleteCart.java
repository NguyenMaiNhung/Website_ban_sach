package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import model.Book;

/**
 * Servlet implementation class deleteCart
 */
@WebServlet("/delete")
public class deleteCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO dao = new DAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int id_kh = Integer.parseInt(request.getParameter("id_kh"));
		int id_book = Integer.parseInt(request.getParameter("id_book"));
		
		if(id_kh == 1) {
			dao.deleteBook_cate(id_book);
			dao.deleteBook(id_book);
			response.sendRedirect("admin");
		}
		else {
			dao.deleteItemFromCart(id_kh, id_book);
			response.sendRedirect("cart");
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
