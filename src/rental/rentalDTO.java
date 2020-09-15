package rental;

import java.sql.Date;

public class rentalDTO {
	private String id;
	private String title;
	private Date rental_d;
	private Date return_d;
	private int return_ex;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRental_d() {
		return rental_d;
	}
	public void setRental_d(Date rental_d) {
		this.rental_d = rental_d;
	}
	public Date getReturn_d() {
		return return_d;
	}
	public void setReturn_d(Date return_d) {
		this.return_d = return_d;
	}
	public int getReturn_ex() {
		return return_ex;
	}
	public void setReturn_ex(int return_ex) {
		this.return_ex = return_ex;
	}
	
	
}
