package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DAO;
import model.Account;
import model.Bill;
import model.Cart;
import model.Category;

/**
 * Servlet implementation class checkout
 */
@WebServlet("/checkout")
public class checkout extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO dao = new DAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkout() {
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
		HttpSession session = request.getSession();
		if(session.getAttribute("account") == null) {
			response.sendRedirect("login");
		}
		else {
			Account acc = (Account) session.getAttribute("account");
			
			List<Cart> list_items_in_cart = dao.getAllItems(acc.getId());
			List<Category> categories = dao.getCategories();
			Long total_all_items = (long) 0;
			for(Cart cart : list_items_in_cart) {
				total_all_items += cart.getTotal();
			}
			
			request.setAttribute("list_items_in_cart", list_items_in_cart);
			request.setAttribute("total_all_items", total_all_items);
			request.setAttribute("categories", categories);
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String note = request.getParameter("note");
		String pay_method = request.getParameter("payment");
		
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("account");
		
		if(!acc.getName_real().equalsIgnoreCase(name)) {
			acc.setName_real(name);
		}
		if(!acc.getEmail().equalsIgnoreCase(email)) {
			acc.setEmail(email);
		}
		if(!acc.getPhone_number().equalsIgnoreCase(phone)) {
			acc.setPhone_number(phone);
		}
		if(!acc.getAddress().equalsIgnoreCase(address)) {
			acc.setAddress(address);
		}
		
		List<Cart> list_items_in_cart = dao.getAllItems(acc.getId());
		if(check_Amount(list_items_in_cart) == null) {
			LocalDate currentDate = LocalDate.now();
			for(Cart item : list_items_in_cart) {
				Bill bill = new Bill(acc.getId(), item.getBook(), note, pay_method, address, phone, 
						currentDate.toString(), item.getAmount(), 0, item.getTotal(), 0);
				dao.insertBill(bill);
				dao.updateAmountBook(item.getBook().getId(), item.getBook().getAmount() -  item.getAmount());
			}
			
			session.setAttribute("account", acc);
			response.sendRedirect("confirm"); 
		}
		else {
			Cart item = check_Amount(list_items_in_cart);
			request.setAttribute("mess_error", 
					"* We don't enough amount you need for '" + item.getBook().getTitle() + "'. If you still want this amount "
							+ "for book, you can contact with us.");
			request.getRequestDispatcher("cart").forward(request, response);
		}
	}
	
	public Cart check_Amount(List<Cart> list) {
		for(Cart item : list) {
			if(item.getAmount() > item.getBook().getAmount()) {
				return item;
			}
		}
		return null;
	}

}
