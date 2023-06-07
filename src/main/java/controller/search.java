package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DAO;
import model.Bill;
import model.Book;
import model.Category;

/**
 * Servlet implementation class search
 */
@WebServlet({"/search", "/admin"})
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO dao = new DAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public search() {
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
		
		List<Book> list_books = dao.getAllBooks(-1);
		for(Book book : list_books) {
			int ordered_amount = 0;
			String category = "";
			List<Category> cate_list = dao.getCateInBook(book.getId());
			List<Bill> bill_list = dao.getAllBillById_book(book.getId());
			
			for(Bill bill : bill_list) {
				ordered_amount += bill.getAmount();
			}
			
			int dem = 1;
			for(Category cate : cate_list) {
				category += cate.getName();
				if(dem < cate_list.size()) {
					category += ", ";
					dem++;
				}
			}
			
			book.setOrdered_amount(ordered_amount);
			book.setCategory(category);
			
		}
		request.setAttribute("list_books", list_books);
		request.getRequestDispatcher("admin.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String key_search = request.getParameter("search");
		String requestURI = request.getRequestURI();
		
		List<Book> list_book_by_key = dao.getBooksByKey(key_search);
		
		if(requestURI.equalsIgnoreCase("/QLBS/admin")) {
			
			for(Book book : list_book_by_key) {
				int ordered_amount = 0;
				String category = "";
				List<Category> cate_list = dao.getCateInBook(book.getId());
				List<Bill> bill_list = dao.getAllBillById_book(book.getId());
				
				for(Bill bill : bill_list) {
					ordered_amount += bill.getAmount();
				}
				
				int dem = 1;
				for(Category cate : cate_list) {
					category += cate.getName();
					if(dem < cate_list.size()) {
						category += ", ";
						dem++;
					}
				}
				
				book.setOrdered_amount(ordered_amount);
				book.setCategory(category);
				
			}
			request.setAttribute("list_books", list_book_by_key);
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
		
		else {
			
			List<Category> list = dao.getCategories();
			
			request.setAttribute("list_book_by_key", list_book_by_key);
			request.setAttribute("categories", list);
			request.getRequestDispatcher("shopItem.jsp").forward(request, response);
			
		}
		
	}

}
