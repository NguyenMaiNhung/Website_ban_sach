package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.DAO;
import model.Book;
import model.Category;

/**
 * Servlet implementation class bookdetail
 */
@WebServlet({"/bookdetail", "/book"})
public class bookdetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DAO dao = new DAO();
	private int id_raw = 0;
	private int count = 0;
	private int check_loop = 0;
	private String image_test = "";
	
	// checkbox
	private int check_array_null = 0;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookdetail() {
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
		
		// id_book
		int id = Integer.parseInt(request.getParameter("id"));
		id_raw = id;
		if(id > 0) {
			Book book = dao.getBookById(id);
			List<Category> list_cate = dao.getCategories();
			List<Category> list_cate_on_book = dao.getCateInBook(book.getId());
			// checkbox
			for(Category cate : list_cate) {
				for(Category cate1 : list_cate_on_book) {
					if(cate1.getId() == cate.getId()) {
						cate.setType(1);
					}
				}
			}
			
			// checkbox
			
			if(count >= 1) {
				id = -2;
				if(check_loop == 1) {
					request.setAttribute("check_loop", check_loop);
					check_loop = 0;
				}
				
				// checkbox
				if(check_array_null == 1) {
					request.setAttribute("check_array_null", check_array_null);
					check_array_null = 0;
				}
			}
			image_test = book.getImage();
			request.setAttribute("book", book);
			request.setAttribute("list_cate", list_cate);
//			request.setAttribute("id_cate_on_book", list_cate_on_book.get(0).getId()); 
			
			// checkbox
			request.setAttribute("list_cate_on_book", list_cate_on_book); 
			// checkbox

		}
		else {
			if(check_loop == 1) {
				request.setAttribute("check_loop", check_loop);
				check_loop = 0;
			}
			// checkbox
			if(check_array_null == 1) {
				request.setAttribute("check_array_null", check_array_null);
				check_array_null = 0;
			}
			List<Category> list_cate = dao.getCategories();
			request.setAttribute("list_cate", list_cate);
		}
		request.setAttribute("id_test", id);
		request.getRequestDispatcher("bookdetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String describe = request.getParameter("describe");
		int year = Integer.parseInt(request.getParameter("year"));
		int sotrang = Integer.parseInt(request.getParameter("sotrang"));
//		String category_id = request.getParameter("category");
		String[] category_id = request.getParameterValues("checkbox");
		int gia_goc = Integer.parseInt(request.getParameter("gia_goc"));
		int gia_ban = Integer.parseInt(request.getParameter("gia_ban"));
		String loai_bia = request.getParameter("loai_bia");
		int amount = Integer.parseInt(request.getParameter("amount"));
		String publisher = request.getParameter("publisher");
		String image = "img/" + request.getParameter("imageUpload");
		
		
		if(id_raw == -1) {
			if(category_id == null) {
				check_array_null = 1;
				response.sendRedirect("bookdetail?id=" + id_raw);
			}
			else {
				Book book = new Book(title, author, describe, amount, year, sotrang, gia_goc, gia_ban, 
						loai_bia, image, publisher);
				if(dao.checkBookByTitleAndAuthor(book.getTitle(), book.getAuthor(), -1)) {
					check_loop = 1;
					response.sendRedirect("bookdetail?id=" + id_raw);
				}
				else {
					dao.insertBook(book);
					// checkbox
					for(String id_cate : category_id) {
						dao.insertNewBook_Category(dao.getId_book(book.getTitle(), book.getAuthor()), 
								Integer.parseInt(id_cate));
					}
					// checkbox
					
//					dao.insertNewBook_Category(dao.getId_book(book.getTitle(), book.getAuthor()), 
//							Integer.parseInt(category_id));
					response.sendRedirect("admin");
				}
				
			}
		}
		else {
			if(image.equals("img/")) {
				image = image_test;
			}
			count++;
			if(count == 1) {
				response.sendRedirect("bookdetail?id=" + id_raw);
			}
			else {
				Book book = new Book(title, author, describe, amount, year, sotrang, gia_goc, gia_ban, 
						loai_bia, image, publisher);
				
				if(dao.checkBookByTitleAndAuthor(book.getTitle(), book.getAuthor(), id_raw)) {
					check_loop = 1;
					response.sendRedirect("bookdetail?id=" + id_raw);	
				}
				else {
					if(category_id == null) {
						check_array_null = 1;
						response.sendRedirect("bookdetail?id=" + id_raw);
					}
					else {
						book.setId(id_raw);
						dao.updateBook(book);
						
						//checkbox
						int tmp = 0;
						for(String id_cate : category_id) {
							if(tmp == 0) {
								dao.updateBook_Cate(id_raw, Integer.parseInt(id_cate));
								tmp++;
							}
							else {
								dao.insertNewBook_Category(id_raw, Integer.parseInt(id_cate));
							}
						}
						// checkbox 
						
//						dao.updateBook_Cate(id_raw, Integer.parseInt(category_id));
						count = 0;
						response.sendRedirect("admin");
					}
				}
				
			}
		}
		
		
		System.out.println(title + " " + author + " " + year + " " + sotrang + " " + category_id + " " + image);
		
	}

}
