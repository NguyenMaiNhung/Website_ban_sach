package model;

public class BookHaveCategory {
	private int id_book;
	private int id_cate;
	
	public BookHaveCategory() {
		// TODO Auto-generated constructor stub
	}

	public BookHaveCategory(int id_book, int id_cate) {
		super();
		this.id_book = id_book;
		this.id_cate = id_cate;
	}

	public int getId_book() {
		return id_book;
	}

	public void setId_book(int id_book) {
		this.id_book = id_book;
	}

	public int getId_cate() {
		return id_cate;
	}

	public void setId_cate(int id_cate) {
		this.id_cate = id_cate;
	}
	
}
