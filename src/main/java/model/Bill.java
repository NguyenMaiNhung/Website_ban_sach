package model;

public class Bill {
	private int id;
	private int id_kh;
	private Book book;
	private String note, pay_method, address, phone_number, ngay_dat;
	private int amount, sale;
	private long total;
	private int status_bill;
	
	public Bill() {
		// TODO Auto-generated constructor stub
	}

	public Bill(int id_kh, Book book, String note, String pay_method, String address, String phone_number,
			String ngay_dat, int amount, int sale, long total, int status_bill) {
		super();
		this.id_kh = id_kh;
		this.book = book;
		this.note = note;
		this.pay_method = pay_method;
		this.address = address;
		this.phone_number = phone_number;
		this.ngay_dat = ngay_dat;
		this.amount = amount;
		this.sale = sale;
		this.total = total;
		this.status_bill = status_bill;
	}

	public Bill(int id, int id_kh, Book book, String note, String pay_method, String address, String phone_number,
			String ngay_dat, int amount, int sale, long total, int status_bill) {
		super();
		this.id = id;
		this.id_kh = id_kh;
		this.book = book;
		this.note = note;
		this.pay_method = pay_method;
		this.address = address;
		this.phone_number = phone_number;
		this.ngay_dat = ngay_dat;
		this.amount = amount;
		this.sale = sale;
		this.total = total;
		this.status_bill = status_bill;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getNgay_dat() {
		return ngay_dat;
	}

	public void setNgay_dat(String ngay_dat) {
		this.ngay_dat = ngay_dat;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public long getTotal() {
		return total;
	}

	public void setTotal(long total) {
		this.total = total;
	}

	public int getStatus_bill() {
		return status_bill;
	}

	public void setStatus_bill(int status_bill) {
		this.status_bill = status_bill;
	}

	@Override
	public String toString() {
		return "Bill [id_kh=" + id_kh + ", book=" + book + ", note=" + note + ", pay_method=" + pay_method
				+ ", address=" + address + ", phone_number=" + phone_number + ", ngay_dat=" + ngay_dat + ", amount="
				+ amount + ", sale=" + sale + ", total=" + total + ", status_bill=" + status_bill + "]";
	}

}
