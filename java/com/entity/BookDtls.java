package com.entity;

public class BookDtls {
	
	private int bookId;
	private String bookName;
	private String auther;
	private String price;
	private String bookcategory;
	private String status;
	private String photoName;
	private String email;
	public BookDtls() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookDtls(String bookName, String auther, String price, String bookcategory, String status, String photoName,
			String email) {
		super();
		this.bookName = bookName;
		this.auther = auther;
		this.price = price;
		this.bookcategory = bookcategory;
		this.status = status;
		this.photoName = photoName;
		this.email = email;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getAuther() {
		return auther;
	}
	public void setAuther(String auther) {
		this.auther = auther;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBookcategory() {
		return bookcategory;
	}
	public void setBookcategory(String bookcategory) {
		this.bookcategory = bookcategory;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "BookDtls [bookId=" + bookId + ", bookName=" + bookName + ", auther=" + auther + ", price=" + price
				+ ", bookcategory=" + bookcategory + ", status=" + status + ", photoName=" + photoName + ", email="
				+ email + "]";
	}

}
