package model;


public class Comment {
	
	private Account account;
	private int id_book, number_star;
	private String content;
	private String time_post;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(Account account, int id_book, int number_star, String content, String time_post) {
		super();
		this.account = account;
		this.id_book = id_book;
		this.number_star = number_star;
		this.content = content;
		this.time_post = time_post;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public int getId_book() {
		return id_book;
	}

	public void setId_book(int id_book) {
		this.id_book = id_book;
	}

	public int getNumber_star() {
		return number_star;
	}

	public void setNumber_star(int number_star) {
		this.number_star = number_star;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime_post() {
		return time_post;
	}

	public void setTime_post(String time_post) {
		this.time_post = time_post;
	}

	@Override
	public String toString() {
		return "Comment [account=" + account + ", id_book=" + id_book + ", number_star=" + number_star + ", content="
				+ content + ", time_post=" + time_post + "]";
	}

}
