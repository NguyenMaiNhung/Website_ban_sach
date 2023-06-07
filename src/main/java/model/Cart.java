package model;

public class Cart {
	private int id_kh;
	private Book book;
	private int amount;
	private int total;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(int id_kh, Book book, int amount, int total) {
		super();
		this.id_kh = id_kh;
		this.book = book;
		this.amount = amount;
		this.total = total;
	}

	public int getId_kh() {
		return id_kh;
	}

	public void setId_kh(int id_kh) {
		this.id_kh = id_kh;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "Cart [id_kh=" + id_kh + ", book=" + book + ", amount=" + amount + ", total=" + total + "]";
	}

}
