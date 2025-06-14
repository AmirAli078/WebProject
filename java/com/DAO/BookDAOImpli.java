package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDtls;

public class BookDAOImpli implements BooksDAO{

	
	private Connection conn;
	
	public BookDAOImpli(Connection conn) {
		super();
		this.conn = conn;
	}


	@Override
	public boolean addBooks(BookDtls b) {
		boolean f=false;
		
		try {
			String sql = "INSERT INTO book_dtls (bookName, auther, price, bookcategory, status, photo, user_email) VALUES (?, ?, ?, ?, ?, ?, ?)";
 
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuther());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookcategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhotoName());
			ps.setString(7, b.getEmail());
			
		   int i=ps.executeUpdate();
		   
		   if(i==1) {
			   f=true;
		   }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	//get all books 
	@Override
	public List<BookDtls> getAllBooks() {
		
		List<BookDtls> list= new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			String sql = "SELECT * FROM book_dtls";
            PreparedStatement ps=conn.prepareStatement(sql);
         ResultSet rs =  ps.executeQuery();
         
         while(rs.next()) {
        	 b=new BookDtls();
        	 b.setBookId(rs.getInt(1));
        	 b.setBookName(rs.getString(2));
        	 b.setAuther(rs.getString(3));
        	 b.setPrice(rs.getString(4));
        	 b.setBookcategory(rs.getString(5));
        	 b.setStatus(rs.getString(6));
        	 b.setPhotoName(rs.getString(7));
        	 b.setEmail(rs.getString(8));
        	 list.add(b);
         }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	//GEt  book  by id DAO 

	@Override
	public BookDtls getBookById(int id) {
		BookDtls b=null;
		
		try {
			String sql = "SELECT * FROM book_dtls where bookId=?";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			 ResultSet rs =  ps.executeQuery();
	         
	         while(rs.next()) {
	        	 b=new BookDtls();
	        	 b.setBookId(rs.getInt(1));
	        	 b.setBookName(rs.getString(2));
	        	 b.setAuther(rs.getString(3));
	        	 b.setPrice(rs.getString(4));
	        	 b.setBookcategory(rs.getString(5));
	        	 b.setStatus(rs.getString(6));
	        	 b.setPhotoName(rs.getString(7));
	        	 b.setEmail(rs.getString(8));
	         }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}


    public boolean updateEditBooks(BookDtls b) {
        boolean f = false;
        try {
            String sql = "update book_dtls set bookname=?, auther=?, price=?, status=? where bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, b.getBookName());
            ps.setString(2, b.getAuther());
            ps.setString(3, b.getPrice());
            ps.setString(4, b.getStatus());
            ps.setInt(5, b.getBookId()); // <-- The issue is here, it should be ps.setInt(5, b.getBookId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
	
    
    
    @Override
    public boolean deleteBooks(int id) {
        boolean f = false;
        try {
            String sql = "delete from book_dtls where bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
	
    
    public List<BookDtls> getNewBook() {

        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls where bookcategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Available");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuther(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
             //   System.out.println("NEW Book " + i + ": " + b);
                i++;

            }
           

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

	
    public List<BookDtls> getRecentBooks() {

        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls where status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Available");

            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuther(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                
              //  System.out.println("Recent Book " + i + ": " + b);
                i++;

            }
            
           

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<BookDtls> getOldBooks() {

        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Available");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuther(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
                
               // System.out.println("Old Book " + i + ": " + b);
                i++;

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<BookDtls> getAllRecentBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls where status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Available");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuther(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<BookDtls> getAllNewBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "New");
            ps.setString(2, "Available");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuther(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<BookDtls> getAllOldBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "Old");
            ps.setString(2, "Available");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuther(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<BookDtls> getBookByOld(String email, String cate) {

        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;

        try {

            String sql = "select * from book_dtls where bookCategory=? and email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cate);
            ps.setString(2, email);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuther(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean oldBookDelete(String email, String cat, int id) {
        boolean f = false;
        try {
            String sql = "delete from book_dtls where bookCategory=? and email=? and bookId=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cat);
            ps.setString(2, email);
            ps.setInt(3, id);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;

            }
 
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

 
    public List<BookDtls> getBookBySearch(String ch) {
       
        
       List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;

        try {

            String sql = "select * from book_dtls where bookname like ? or author like ? or bookCategory like ? and status=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+ch+"%");
            ps.setString(2, "%"+ch+"%");
            ps.setString(3, "%"+ch+"%");
            ps.setString(4, "Available");

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls();
                b.setBookId(rs.getInt(1));
                b.setBookName(rs.getString(2));
                b.setAuther(rs.getString(3));
                b.setPrice(rs.getString(4));
                b.setBookcategory(rs.getString(5));
                b.setStatus(rs.getString(6));
                b.setPhotoName(rs.getString(7));
                b.setEmail(rs.getString(8));
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
        
    }

}
