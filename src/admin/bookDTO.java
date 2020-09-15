package admin;

public class bookDTO {
	private String title;
	private String writer;
	private String publisher;
	private String page;
	private String isbn;
	private String p_date;
	private String b_image;
	private String s_code;
	private int h_code;
	private int w_code;
	private String possible;
	
	public String getPossible() {
		return possible;
	}
	public void setPossible(String possible) {
		this.possible = possible;
	}
	
	public String getS_code() {
		return s_code;
	}
	public void setS_code(String s_code) {
		this.s_code = s_code;
	}
	public int getH_code() {
		return h_code;
	}
	public void setH_code(int h_code) {
		this.h_code = h_code;
	}
	public int getW_code() {
		return w_code;
	}
	public void setW_code(int w_code) {
		this.w_code = w_code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public String getB_image() {
		return b_image;
	}
	public void setB_image(String b_image) {
		this.b_image = b_image;
	}
}
