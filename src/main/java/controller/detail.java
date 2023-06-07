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
import model.BookHaveCategory;
import model.Cart;
import model.Category;
import model.Comment;
import sort.sort;

/**
 * Servlet implementation class detail
 */
@WebServlet("/detail")
public class detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO dao = new DAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public detail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int book_id = Integer.parseInt(request.getParameter("id"));
		
		Book book = dao.getBookById(book_id);
		List<Category> list_cate = dao.getCategories();
		List<Category> list_cate_in_book = dao.getCateInBook(book_id);
		List<Book> list_book_by_cate = new ArrayList<>();
		for(Category cate : list_cate_in_book) {
			List<Book> list_tmp = dao.getBooksByCate(cate.getId(), 1);
			if(list_tmp != null) {
				for(Book book_tmp : list_tmp) {
					if(book_tmp.getId() != book.getId()) {
						list_book_by_cate.add(book_tmp);
					}
				}
			}
		}
		
		Collections.sort(list_book_by_cate, new sort());
		
		for(int i=0; i<list_book_by_cate.size()-1; i++) {
			if(list_book_by_cate.get(i).getId() == list_book_by_cate.get(i+1).getId()) {
				list_book_by_cate.remove(i+1);
				if(i == 0) {
					i = -1;
				}
				else {
					i -= 1;
				}
			}
		}
		
		List<Comment> list_comment = dao.getCommentForBook(book_id);
		
		request.setAttribute("book", book);
		request.setAttribute("categories", list_cate);
		request.setAttribute("list_cate_in_book", list_cate_in_book);
		request.setAttribute("length_list", list_cate_in_book.size());
		request.setAttribute("list_book_by_cate", list_book_by_cate); 
		request.setAttribute("list_comment", list_comment);
		request.setAttribute("list_comment_size", list_comment.size());
		request.getRequestDispatcher("detail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
