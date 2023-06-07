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
import model.Account;
import model.Cart;
import model.Category;

/**
 * Servlet implementation class cart
 */
@WebServlet("/cart")
public class cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO dao = new DAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Category> list = dao.getCategories();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("account") == null) {
			response.sendRedirect("login");
		}
		else {
			Account acc = (Account) session.getAttribute("account");
			List<Cart> list_items_in_cart = dao.getAllItems(acc.getId());
			Long total_all_items = (long) 0;
			for(Cart cart : list_items_in_cart) {
				total_all_items += cart.getTotal();
			}
			
			request.setAttribute("categories", list);
			request.setAttribute("total_all_items", total_all_items);
			request.setAttribute("list_items_in_cart", list_items_in_cart);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
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
