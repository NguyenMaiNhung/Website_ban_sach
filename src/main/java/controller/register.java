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
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DAO dao = new DAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Category> list = dao.getCategories();
		
		request.setAttribute("categories", list);
		request.getRequestDispatcher("register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		
		String username = request.getParameter("username");
		String pass1 = request.getParameter("password1");
		String pass2 = request.getParameter("password2");
		
		if(!pass1.equals(pass2)) {
			List<Category> list = dao.getCategories();
			request.setAttribute("categories", list);
			request.setAttribute("mess", "* Password and confirm password are not same");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		else {
			Account acc = dao.checkAccount(username, "");
			if(acc == null) {
				Account new_acc = new Account(username, pass2, name, email, phone, address, 1);
				System.out.println(new_acc.toString());
				dao.newAccount(new_acc);
				request.setAttribute("confirm", "* Completed sign in. Now you can login again!");
				List<Category> list = dao.getCategories();
				System.out.println("tmp");
			
				request.setAttribute("categories", list);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			else {
				List<Category> list = dao.getCategories();
				request.setAttribute("categories", list);
				request.setAttribute("mess", "* This account is exsited");
				request.getRequestDispatcher("register.jsp").forward(request, response);
			}
			
		}
	}

}
