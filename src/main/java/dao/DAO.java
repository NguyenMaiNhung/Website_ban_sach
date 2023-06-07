package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Account;
import model.Bill;
import model.Book;
import model.Cart;
import model.Category;
import model.Comment;

public class DAO extends ConnectDB{
	
	private static final String select_all_books= "SELECT * FROM qlbs.book";
	private static final String select_all_categories= "SELECT * FROM qlbs.category";
	private static final String best_sell_books = "select * from book where id <= 8 order by amount";
	private static final String new_books_arrived = "select * from book "
			+ " order by id desc";
	private static final String getBookByCate = "select * from book where id in ("
			+ "select bookhavecategory.id_book from bookhavecategory, category where category.id = ?   "
			+ " and category.id = bookhavecategory.id_cate)";
	private static final String select_cate_by_id = "SELECT * FROM qlbs.category where id = ?";
	private static final String select_book_by_id = "SELECT * FROM qlbs.book where id = ?";
	private static final String book_with_categories = "select * from category     "
			+ "where id in (select bookhavecategory.id_cate from bookhavecategory "
			+ "where bookhavecategory.id_book = ?  )";
	private static final String select_account_by_username_password = "SELECT * FROM qlbs.account where    "
			+ "name_user = ? and password = ?";
	private static final String select_account_by_username = "SELECT * FROM qlbs.account where    "
			+ "name_user = ?";
	private static final String post_comment = "insert into qlbs.comment "
			+ "(id_kh, id_book, number_star, content, time_post)   "
			+ "values (?, ?, ?, ?, ?);";
	private static final String get_comment_for_book = "SELECT * FROM qlbs.comment where id_book = ?";
	private static final String get_account_by_id = "SELECT * FROM qlbs.account where id = ?";
	private static final String insert_acc = "insert into account   "
			+ "(name_user, password, name_real, email, phone_number, address, role)   "
			+ "values (?, ?, ?, ?, ?, ?, ?);";
	private static final String check_item_in_cart = "SELECT * FROM qlbs.havecart where id_kh = ?   "
			+ "and id_book = ?";
	private static final String insert_new_item_to_cart = "insert into qlbs.havecart values (?, ?, ?, ?)";
	private static final String update_item_in_cart = "update qlbs.havecart set amount = ?, total = ?   "
			+ "where id_kh = ? and id_book = ?";
	private static final String get_all_items_in_cart = "SELECT * FROM qlbs.havecart where id_kh = ?";
	private static final String delete_item_from_cart = "delete from qlbs.havecart where id_kh = ?    "
			+ "and id_book = ?";
	private static final String get_books_by_key = "SELECT * FROM qlbs.book where title "
			+ "like ?";
	private static final String insert_new_bill = "INSERT INTO `qlbs`.`havebill`  "
			+ "(`id_kh`,`id_book`,`note`,`pay_method`,`address`,`phone_number`,`ngay_dat`,`amount`,`sale`,`total`, "
			+ "`status_bill`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	private static final String select_all_bill = "select * from qlbs.havebill where id_kh = ?   "
			+ "order by ngay_dat desc";
	private static final String select_all_bill_by_id_book = "select * from qlbs.havebill where id_book = ?";
	private static final String update_amount_book_after_bill = "update qlbs.book set amount = ? where id = ?";
	private static final String delete_book = "delete from qlbs.book where id = ?";
	private static final String insertBook = "INSERT INTO `qlbs`.`book` "
			+ "(`title`,`author`,`describe`,`amount`,`year`,`sotrang`,`gia_goc`,`gia_ban`,`loai_bia`,"
			+ " `image`,`publisher`)"
			+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
	private static final String insertNewBook_Category = "INSERT INTO `qlbs`.`bookhavecategory`  "
			+ "(`id_book`,`id_cate`)  "
			+ "VALUES(?, ?); ";
	private static final String check_book_by_title_author = "SELECT * FROM book where title = ? "
			+ "			and author = ? and id not in (" 
			+ 		"select id FROM book where id = ?)";
	private static final String select_book_by_title_author = "SELECT id FROM book where title = ? and author = ?";
	private static final String update_book = "UPDATE `qlbs`.`book`  "
			+ "SET `title` = ?, `author` = ?, `describe` = ?, `amount` = ?, `year` = ?, `sotrang` = ?, "
			+ "`gia_goc` = ?, `gia_ban` = ?, `loai_bia` = ?, `image` = ?, `publisher` = ? "
			+ "WHERE `id` = ?";
	private static final String delete_book_cate = "delete from qlbs.bookhavecategory where id_book = ?";
	private static final String update_book_cate = "update qlbs.bookhavecategory set id_cate = ? where id_book = ?";
	private static final String deleteBill = "delete from qlbs.havebill where id = ?";
	private static final String select_bill_by_id = "select * from qlbs.havebill where id = ?";
	
	public List<Book> getSortBooks() {
		List<Book> list = new ArrayList<>();
		try {
			PreparedStatement pr = conn.prepareStatement(best_sell_books);
			ResultSet rs = pr.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String describe = rs.getString("describe");
				int amount = rs.getInt("amount");
				int year = rs.getInt("year");
				int so_trang = rs.getInt("sotrang");
				int gia_goc = rs.getInt("gia_goc");
				int gia_ban = rs.getInt("gia_ban");
				String loai_bia = rs.getString("loai_bia");
				String image = rs.getString("image");
				String nxb = rs.getString("publisher");
				
				Book book = new Book(id, title, author, describe, amount, year, so_trang, 
						gia_goc, gia_ban, loai_bia, image, nxb);
				list.add(book);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Book> getAllBooks(int num){
		List<Book> list = new ArrayList<>();
		String query = select_all_books;
		
		if(num == -1) {
			query += "    order by id desc";
		}
		else if(num == -2) {
			query += "     order by amount";
		}
		try {
			PreparedStatement pr = conn.prepareStatement(query);
			ResultSet rs = pr.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String describe = rs.getString("describe");
				int amount = rs.getInt("amount");
				int year = rs.getInt("year");
				int so_trang = rs.getInt("sotrang");
				int gia_goc = rs.getInt("gia_goc");
				int gia_ban = rs.getInt("gia_ban");
				String loai_bia = rs.getString("loai_bia");
				String image = rs.getString("image");
				String nxb = rs.getString("publisher");
				
				Book book = new Book(id, title, author, describe, amount, year, so_trang, 
						gia_goc, gia_ban, loai_bia, image, nxb);
				list.add(book);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Book> getBooksByCate(int cate_id, int cate_id_sort) {
		List<Book> list = new ArrayList<>();
		String query = getBookByCate;
		
//		if(cate_id_sort == 1) {
//			query += "   order by id";
//		}
		if(cate_id_sort == -1) {
			query += "     order by id desc";
		}
		else if(cate_id_sort == -2) {
			query += "     order by amount";
		}
		try {
			PreparedStatement pr = conn.prepareStatement(query);
			pr.setInt(1, cate_id);
			ResultSet rs = pr.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String describe = rs.getString("describe");
				int amount = rs.getInt("amount");
				int year = rs.getInt("year");
				int so_trang = rs.getInt("sotrang");
				int gia_goc = rs.getInt("gia_goc");
				int gia_ban = rs.getInt("gia_ban");
				String loai_bia = rs.getString("loai_bia");
				String image = rs.getString("image");
				String nxb = rs.getString("publisher");
				
				Book book = new Book(id, title, author, describe, amount, year, so_trang, 
						gia_goc, gia_ban, loai_bia, image, nxb);
				list.add(book);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Book> getArrivedBooks() {
		List<Book> list = new ArrayList<>();
		try {
			PreparedStatement pr = conn.prepareStatement(new_books_arrived);
			ResultSet rs = pr.executeQuery();
			int count = 0;
			while(rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String describe = rs.getString("describe");
				int amount = rs.getInt("amount");
				int year = rs.getInt("year");
				int so_trang = rs.getInt("sotrang");
				int gia_goc = rs.getInt("gia_goc");
				int gia_ban = rs.getInt("gia_ban");
				String loai_bia = rs.getString("loai_bia");
				String image = rs.getString("image");
				String nxb = rs.getString("publisher");
				
				Book book = new Book(id, title, author, describe, amount, year, so_trang, 
						gia_goc, gia_ban, loai_bia, image, nxb);
				if(count < 8) {
					list.add(book);
					count++;
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Category> getCategories() {
		List<Category> list = new ArrayList<>();
		try {
			PreparedStatement pr = conn.prepareStatement(select_all_categories);
			ResultSet rs = pr.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				
				Category cate = new Category(id, name);	
				cate.setType(0); 
				list.add(cate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public Category getCateById(int id) {
		Category cate = new Category();
		
		try {
			PreparedStatement pr = conn.prepareStatement(select_cate_by_id);
			pr.setInt(1, id);
			
			ResultSet rs = pr.executeQuery();
			if(rs.next()) {
				String name = rs.getString("name");
				cate = new Category(id, name);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cate;
	}
	
	public Book getBookById(int id) {
		Book book = new Book();
		try {
			PreparedStatement pr = conn.prepareStatement(select_book_by_id);
			pr.setInt(1, id);
			
			ResultSet rs = pr.executeQuery();
			if(rs.next()) {
				String title = rs.getString("title");
				String author = rs.getString("author");
				String describe = rs.getString("describe");
				int amount = rs.getInt("amount");
				int year = rs.getInt("year");
				int so_trang = rs.getInt("sotrang");
				int gia_goc = rs.getInt("gia_goc");
				int gia_ban = rs.getInt("gia_ban");
				String loai_bia = rs.getString("loai_bia");
				String image = rs.getString("image");
				String nxb = rs.getString("publisher");
				
				book = new Book(id, title, author, describe, amount, year, so_trang, 
						gia_goc, gia_ban, loai_bia, image, nxb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return book;
	}
	
	public List<Category> getCateInBook(int book_id) {
		List<Category> list = new ArrayList<>();
		
		try {
			PreparedStatement pr = conn.prepareStatement(book_with_categories);
			pr.setInt(1, book_id);
			
			ResultSet rs = pr.executeQuery();
			while(rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				
				Category cate = new Category(id, name);	
				list.add(cate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public Account checkAccount(String username, String password) {
		String query = "";
		if(password.equals("")) {
			query = select_account_by_username;
		}
		else {
			query = select_account_by_username_password;
		}
		try {
			PreparedStatement pr = conn.prepareStatement(query);
			if(password.equals("")) {
				pr.setString(1, username);
			}
			else {
				pr.setString(1, username);
				pr.setString(2, password);
			}
			
			ResultSet rs = pr.executeQuery();
			if(rs.next()) {
				int id = rs.getInt("id");
				String user_name = rs.getString("name_user");
				String pass = rs.getString("password");
				String name_real = rs.getString("name_real");
				String email = rs.getString("email");
				String phone_number = rs.getString("phone_number");
				String address = rs.getString("address");
				int role = rs.getInt("role");
				
				Account acc = new Account(id, user_name, pass, name_real, email, 
						phone_number, address, role);
				return acc;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public Account getAccountById(int id) {
		Account acc = new Account();
		
		try {
			PreparedStatement pr = conn.prepareStatement(get_account_by_id);
			pr.setInt(1, id);
			ResultSet rs = pr.executeQuery();
			if(rs.next()) {
				String user_name = rs.getString("name_user");
				String pass = rs.getString("password");
				String name_real = rs.getString("name_real");
				String email = rs.getString("email");
				String phone_number = rs.getString("phone_number");
				String address = rs.getString("address");
				int role = rs.getInt("role");
				
				acc = new Account(id, user_name, pass, name_real, email, 
						phone_number, address, role);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return acc;
	}
	
	public void postComment(Comment com) {
		try {
			PreparedStatement pr = conn.prepareStatement(post_comment);
			pr.setInt(1, com.getAccount().getId());
			pr.setInt(2, com.getId_book());
			pr.setInt(3, com.getNumber_star());
			pr.setString(4, com.getContent());
			pr.setString(5, com.getTime_post());
			
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Comment> getCommentForBook(int id_book){
		List<Comment> list = new ArrayList<>();
		
		try {
			PreparedStatement pr = conn.prepareStatement(get_comment_for_book);
			pr.setInt(1, id_book);
			ResultSet rs = pr.executeQuery();
			
			while(rs.next()) {
				int id_kh = rs.getInt("id_kh");
				id_book = rs.getInt("id_book");
				int num = rs.getInt("number_star");
				String content = rs.getString("content");
				String time = rs.getString("time_post");
				
				Account acc = getAccountById(id_kh);
				Comment com = new Comment(acc, id_book, num, content, time);
				list.add(com);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void newAccount(Account acc) {
		try {
			PreparedStatement pr = conn.prepareStatement(insert_acc);
			pr.setString(1, acc.getUsername());
			pr.setString(2, acc.getPassword());
			pr.setString(3, acc.getName_real());
			pr.setString(4, acc.getEmail());
			pr.setString(5, acc.getPhone_number());
			pr.setString(6, acc.getAddress());
			pr.setInt(7, acc.getRole());
			
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Cart checkCart(int id_kh, int id_book) {
		try {
			PreparedStatement pr = conn.prepareStatement(check_item_in_cart);
			pr.setInt(1, id_kh);
			pr.setInt(2, id_book);
			
			ResultSet rs = pr.executeQuery();
			
			if(rs.next()) {
				Book book = getBookById(id_book);
				int amount = rs.getInt("amount");
				int total = rs.getInt("total");
				Cart cart = new Cart(id_kh, book, amount, total);
				return cart;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public void insertCart(Cart cart) {
		try {
			PreparedStatement pr = conn.prepareStatement(insert_new_item_to_cart);
			pr.setInt(1, cart.getId_kh());
			pr.setInt(2, cart.getBook().getId());
			pr.setInt(3, cart.getAmount());
			pr.setInt(4, cart.getTotal());
			
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void updateCart(Cart cart) {
		try {
			PreparedStatement pr = conn.prepareStatement(update_item_in_cart);
			pr.setInt(1, cart.getAmount());
			System.out.println(cart.getAmount() + "update");
			pr.setInt(2, cart.getTotal());
			pr.setInt(3, cart.getId_kh());
			pr.setInt(4, cart.getBook().getId()); 
			System.out.println(cart.getBook().getId() + "update");
			
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Cart> getAllItems(int id_kh){
		List<Cart> list = new ArrayList<>();
		try {
			PreparedStatement pr = conn.prepareStatement(get_all_items_in_cart);
			pr.setInt(1, id_kh);
			ResultSet rs = pr.executeQuery();
			
			while(rs.next()) {
				Book book = getBookById(rs.getInt("id_book"));
				int amount = rs.getInt("amount");
				int total = rs.getInt("total");
				
				Cart cart = new Cart(id_kh, book, amount, total);
				list.add(cart);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public void deleteItemFromCart(int id_kh, int id_book) {
		try {
			PreparedStatement pr = conn.prepareStatement(delete_item_from_cart);
			pr.setInt(1, id_kh);
			pr.setInt(2, id_book);
			
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Book> getBooksByKey(String key){
		List<Book> list = new ArrayList<>();
		
		try {
			PreparedStatement pr = conn.prepareStatement(get_books_by_key);
			pr.setString(1, "%" + key + "%");
			
			ResultSet rs = pr.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String describe = rs.getString("describe");
				int amount = rs.getInt("amount");
				int year = rs.getInt("year");
				int so_trang = rs.getInt("sotrang");
				int gia_goc = rs.getInt("gia_goc");
				int gia_ban = rs.getInt("gia_ban");
				String loai_bia = rs.getString("loai_bia");
				String image = rs.getString("image");
				String nxb = rs.getString("publisher");
				
				Book book = new Book(id, title, author, describe, amount, year, so_trang, 
						gia_goc, gia_ban, loai_bia, image, nxb);
				list.add(book);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;	
	}
	
	public void insertBill(Bill bill) {
		try {
			PreparedStatement pr = conn.prepareStatement(insert_new_bill);
			
			pr.setInt(1, bill.getId_kh());
			pr.setInt(2, bill.getBook().getId());
			pr.setString(3, bill.getNote());
			pr.setString(4, bill.getPay_method());
			pr.setString(5, bill.getAddress());
			pr.setString(6, bill.getPhone_number());
			pr.setString(7, bill.getNgay_dat());
			pr.setInt(8, bill.getAmount());
			pr.setInt(9, bill.getSale());
			pr.setInt(10, (int)bill.getTotal());
			pr.setInt(11, bill.getStatus_bill());
			
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	public List<Bill> getAllBill(int id_kh){
		List<Bill> list = new ArrayList<>();
		
		try {
			PreparedStatement pr = conn.prepareStatement(select_all_bill);
			pr.setInt(1, id_kh);
			ResultSet rs = pr.executeQuery();
			
			while(rs.next()) {
				int id = rs.getInt("id");
				id_kh = rs.getInt("id_kh");
				int id_book = rs.getInt("id_book");
				String note = rs.getString("note");
				String paymethod = rs.getString("pay_method");
				String address = rs.getString("address");
				String phone = rs.getString("phone_number");
				String ngay_dat = rs.getString("ngay_dat");
				int amount = rs.getInt("amount");
				int sale = rs.getInt("sale");
				long total = rs.getInt("total");
				int status_bill = rs.getInt("status_bill");
				
				Bill bill = new Bill(id, id_kh, getBookById(id_book), note, paymethod, address, 
						phone, ngay_dat, amount, sale, total, status_bill);
				list.add(bill);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Bill> getAllBillById_book(int id_book){
		List<Bill> list = new ArrayList<>();
		
		try {
			PreparedStatement pr = conn.prepareStatement(select_all_bill_by_id_book);
			pr.setInt(1, id_book);
			ResultSet rs = pr.executeQuery();
			
			while(rs.next()) {
				int id_kh = rs.getInt("id_kh");
				id_book = rs.getInt("id_book");
				String note = rs.getString("note");
				String paymethod = rs.getString("pay_method");
				String address = rs.getString("address");
				String phone = rs.getString("phone_number");
				String ngay_dat = rs.getString("ngay_dat");
				int amount = rs.getInt("amount");
				int sale = rs.getInt("sale");
				long total = rs.getInt("total");
				int status_bill = rs.getInt("status_bill");
				
				Bill bill = new Bill(id_kh, getBookById(id_book), note, paymethod, address, 
						phone, ngay_dat, amount, sale, total, status_bill);
				list.add(bill);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public Bill getBillById(int id_bill) {
		try {
			PreparedStatement pr = conn.prepareStatement(select_bill_by_id);
			pr.setInt(1, id_bill);
			ResultSet rs = pr.executeQuery();
			if(rs.next()) {
				int id_kh = rs.getInt("id_kh");
				int id_book = rs.getInt("id_book");
				String note = rs.getString("note");
				String paymethod = rs.getString("pay_method");
				String address = rs.getString("address");
				String phone = rs.getString("phone_number");
				String ngay_dat = rs.getString("ngay_dat");
				int amount = rs.getInt("amount");
				int sale = rs.getInt("sale");
				long total = rs.getInt("total");
				int status_bill = rs.getInt("status_bill");
				
				Bill bill = new Bill(id_bill, id_kh, getBookById(id_book), note, paymethod, address, 
						phone, ngay_dat, amount, sale, total, status_bill);
				return bill;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public void updateAmountBook(int id_book, int amount) {
		try {
			PreparedStatement pr = conn.prepareStatement(update_amount_book_after_bill);
			pr.setInt(1, amount);
			pr.setInt(2, id_book);
			
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void deleteBook(int id_book) {
		try {
			PreparedStatement pr = conn.prepareStatement(delete_book);
			pr.setInt(1, id_book);
			
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insertBook(Book book) {
		try {
			PreparedStatement pr = conn.prepareStatement(insertBook);
			pr.setString(1, book.getTitle());
			pr.setString(2, book.getAuthor());
			pr.setString(3, book.getDescribe());
			pr.setInt(4, book.getAmount());
			pr.setInt(5, book.getYear());
			pr.setInt(6, book.getSotrang());
			pr.setInt(7, book.getGia_goc());
			pr.setInt(8, book.getGia_ban());
			pr.setString(9, book.getLoai_bia());
			pr.setString(10, book.getImage());
			pr.setString(11, book.getPublisher());
			
			pr.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void insertNewBook_Category(int id_book, int id_cate) {
		try {
			PreparedStatement pr = conn.prepareStatement(insertNewBook_Category);
			pr.setInt(1, id_book);
			pr.setInt(2, id_cate);
			
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int getId_book(String title, String author) {
		try {
			PreparedStatement pr = conn.prepareStatement(select_book_by_title_author);
			pr.setString(1, title);
			pr.setString(2, author);
			
			ResultSet rs = pr.executeQuery();
			if(rs.next()) {
				return rs.getInt("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public boolean checkBookByTitleAndAuthor(String title, String author, int id_book) {
		try {
			PreparedStatement pr = conn.prepareStatement(check_book_by_title_author);
			pr.setString(1, title);
			pr.setString(2, author);
			pr.setInt(3, id_book);
			
			ResultSet rs = pr.executeQuery();
			if(rs.next()) {
				return true;   // neu tim duoc sach
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public void updateBook(Book book) {
		try {
			PreparedStatement pr = conn.prepareStatement(update_book);
			
			pr.setString(1, book.getTitle());
			pr.setString(2, book.getAuthor());
			pr.setString(3, book.getDescribe());
			pr.setInt(4, book.getAmount());
			pr.setInt(5, book.getYear());
			pr.setInt(6, book.getSotrang());
			pr.setInt(7, book.getGia_goc());
			pr.setInt(8, book.getGia_ban());
			pr.setString(9, book.getLoai_bia());
			pr.setString(10, book.getImage());
			pr.setString(11, book.getPublisher());
			pr.setInt(12, book.getId());
			
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteBook_cate(int id_book) {
		try {
			PreparedStatement pr = conn.prepareStatement(delete_book_cate);
			pr.setInt(1, id_book);
			
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updateBook_Cate(int id_book, int id_cate) {
		try {
			PreparedStatement pr = conn.prepareStatement(update_book_cate);
			pr.setInt(1, id_cate);
			pr.setInt(2, id_book);
			
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void deleteBill(int id_bill) {
		try {
			PreparedStatement pr = conn.prepareStatement(deleteBill);
			pr.setInt(1, id_bill);
			
			pr.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
