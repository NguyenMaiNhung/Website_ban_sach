package model;

import java.util.List;

public class Book {
	private int id;
	private String title, author, describe;
	private int amount, year, sotrang, gia_goc, gia_ban;
	private String loai_bia, image, publisher;
	private String category;
	private int ordered_amount;
	
	public Book() {
		// TODO Auto-generated constructor stub
	}

	public Book(int id, String title, String author, String describe, int amount, int year, int sotrang, int gia_goc,
			int gia_ban, String loai_bia, String image, String publisher) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.describe = describe;
		this.amount = amount;
		this.year = year;
		this.sotrang = sotrang;
		this.gia_goc = gia_goc;
		this.gia_ban = gia_ban;
		this.loai_bia = loai_bia;
		this.image = image;
		this.publisher = publisher;
	}

	
	public Book(int id, String title, String author, String describe, int amount, int year, int sotrang, int gia_goc,
			int gia_ban, String loai_bia, String image, String publisher, String category, int ordered_amount) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.describe = describe;
		this.amount = amount;
		this.year = year;
		this.sotrang = sotrang;
		this.gia_goc = gia_goc;
		this.gia_ban = gia_ban;
		this.loai_bia = loai_bia;
		this.image = image;
		this.publisher = publisher;
		this.category = category;
		this.ordered_amount = ordered_amount;
	}
	
	public Book(String title, String author, String describe, int amount, int year, int sotrang, int gia_goc,
			int gia_ban, String loai_bia, String image, String publisher) {
		this.title = title;
		this.author = author;
		this.describe = describe;
		this.amount = amount;
		this.year = year;
		this.sotrang = sotrang;
		this.gia_goc = gia_goc;
		this.gia_ban = gia_ban;
		this.loai_bia = loai_bia;
		this.image = image;
		this.publisher = publisher;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getOrdered_amount() {
		return ordered_amount;
	}

	public void setOrdered_amount(int ordered_amount) {
		this.ordered_amount = ordered_amount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getSotrang() {
		return sotrang;
	}

	public void setSotrang(int sotrang) {
		this.sotrang = sotrang;
	}

	public int getGia_goc() {
		return gia_goc;
	}

	public void setGia_goc(int gia_goc) {
		this.gia_goc = gia_goc;
	}

	public int getGia_ban() {
		return gia_ban;
	}

	public void setGia_ban(int gia_ban) {
		this.gia_ban = gia_ban;
	}

	public String getLoai_bia() {
		return loai_bia;
	}

	public void setLoai_bia(String loai_bia) {
		this.loai_bia = loai_bia;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", title=" + title + ", author=" + author + ", describe=" + describe + ", amount="
				+ amount + ", year=" + year + ", sotrang=" + sotrang + ", gia_goc=" + gia_goc + ", gia_ban=" + gia_ban
				+ ", loai_bia=" + loai_bia + ", image=" + image + ", publisher=" + publisher + "]";
	}
	
}
