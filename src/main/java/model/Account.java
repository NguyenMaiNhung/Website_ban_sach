package model;

public class Account {
	
	private int id;
	private String username;
	private String password;
	private String name_real;
	private String email, phone_number, address;
	private int role;
	
	public Account() {
		// TODO Auto-generated constructor stub
	}

	public Account(int id, String username, String password, String name_real, String email, String phone_number,
			String address, int role) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.name_real = name_real;
		this.email = email;
		this.phone_number = phone_number;
		this.address = address;
		this.role = role;
	}
	
	public Account(String username, String password, String name_real, String email, String phone_number,
			String address, int role) {
		this.username = username;
		this.password = password;
		this.name_real = name_real;
		this.email = email;
		this.phone_number = phone_number;
		this.address = address;
		this.role = role;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName_real() {
		return name_real;
	}

	public void setName_real(String name_real) {
		this.name_real = name_real;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", username=" + username + ", password=" + password + ", name_real=" + name_real
				+ ", email=" + email + ", phone_number=" + phone_number + ", address=" + address + ", role=" + role
				+ "]";
	}

}
