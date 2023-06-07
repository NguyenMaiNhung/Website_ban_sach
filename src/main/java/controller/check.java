package controller;

import java.io.IOException;
import java.time.LocalDate;

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
import model.Comment;

/**
 * Servlet implementation class check
 */
@WebServlet("/check")
public class check extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO dao = new DAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public check() {
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
		String action = request.getParameter("action");
		int id_book = Integer.parseInt(request.getParameter("id"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		
		HttpSession session = request.getSession();
		if(action.equals("cart")) {
			if(session.getAttribute("account") == null) {
				response.sendRedirect("login");
			}
			else {
				Account acc = (Account) session.getAttribute("account");
				Book book = dao.getBookById(id_book);
				
				if(dao.checkCart(acc.getId(), id_book) == null) {
					Cart cart = new Cart(acc.getId(), book, 1, book.getGia_ban());
					dao.insertCart(cart);
				}
				else {
					Cart cart = dao.checkCart(acc.getId(), id_book);
					if(page == 1) {
						cart.setAmount(cart.getAmount() + 1);
						cart.setTotal(cart.getAmount() * cart.getBook().getGia_ban()); 
					}
					dao.updateCart(cart);
				}
				response.sendRedirect("cart");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		int id_book = Integer.parseInt(request.getParameter("id"));
		int page = Integer.parseInt(request.getParameter("page"));
		
		int amount = 0;

		HttpSession session = request.getSession();
		if(action.equals("comment")) {
			if(session.getAttribute("account") == null) {
				response.sendRedirect("login");
			}
			else {
				int number_star  = 0;
				String number_star_raw = request.getParameter("rate");
				if(number_star_raw != null) {
					number_star = Integer.parseInt(number_star_raw);
				}
				System.out.println(number_star);
				
				String text = request.getParameter("text");
				Account acc = (Account) session.getAttribute("account");
				LocalDate currentDate = LocalDate.now();
				
				Comment com = new Comment(acc, id_book, number_star, text, currentDate.toString());
				dao.postComment(com);
				
				response.sendRedirect("detail?id=" + id_book);
			}
		}
		else if(action.equals("cart")) {
			if(session.getAttribute("account") == null) {
				response.sendRedirect("login");
			}
			else {
				Account acc = (Account) session.getAttribute("account");
				Book book = dao.getBookById(id_book);
				
				if(dao.checkCart(acc.getId(), id_book) == null && page != 2) {
					Cart cart = new Cart(acc.getId(), book, 1, book.getGia_ban());
					dao.insertCart(cart);
				}
				else if(dao.checkCart(acc.getId(), id_book) == null && page == 2) {
					amount = Integer.parseInt(request.getParameter("amount"));
					if(amount > 0) {
						Cart cart = new Cart(acc.getId(), book, amount, book.getGia_ban() * amount);
						dao.insertCart(cart);
					}
					else {
						request.setAttribute("mess_about_amount", "* Enter book's amount bigger than 0!");
						request.getRequestDispatcher("detail?id=" + id_book).forward(request, response);
					}
				}
				else {
					Cart cart = dao.checkCart(acc.getId(), id_book);
					if(page == 1) {
						System.out.println(cart.getAmount());
						cart.setAmount(cart.getAmount() + 1);
						System.out.println(cart.getAmount());
						cart.setTotal(cart.getAmount() * cart.getBook().getGia_ban()); 
					}
					else if(page == 2) {
						System.out.println(1);
						amount = Integer.parseInt(request.getParameter("amount"));
						System.out.println(amount);
						if(amount > 0) {
							cart.setAmount(cart.getAmount() + amount);
							cart.setTotal(cart.getAmount() * cart.getBook().getGia_ban());
						}
						else {
							request.setAttribute("mess_about_amount", "* Enter book's amount bigger than 0!");
							request.getRequestDispatcher("detail?id=" + id_book).forward(request, response);
						}
					}
					dao.updateCart(cart);
				}
				response.sendRedirect("cart");
			}
		}
	}

}
