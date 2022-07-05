package review;

public class ReviewDTO {
	private String user_nname;
	private String counsel_name;
	private int total_star;
	private int attitude_star;
	private int booking_star;
	private int location_star;
	private String keywd;
	private String visit_date;
	private String review_cont;
	private int nth_visit;
	public int getNth_visit() {
		return nth_visit;
	}
	public void setNth_visit(int i) {
		this.nth_visit = i;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	private String review_date;
	public String getUser_nname() {
		return user_nname;
	}
	public void setUser_nname(String user_nname) {
		this.user_nname = user_nname;
	}
	public String getCounsel_name() {
		return counsel_name;
	}
	public void setCounsel_name(String counsel_name) {
		this.counsel_name = counsel_name;
	}
	public int getTotal_star() {
		return total_star;
	}
	public void setTotal_star(int total_star) {
		this.total_star = total_star;
	}
	public int getAttitude_star() {
		return attitude_star;
	}
	public void setAttitude_star(int attitude_star) {
		this.attitude_star = attitude_star;
	}
	public int getBooking_star() {
		return booking_star;
	}
	public void setBooking_star(int booking_star) {
		this.booking_star = booking_star;
	}
	public int getLocation_star() {
		return location_star;
	}
	public void setLocation_star(int location_star) {
		this.location_star = location_star;
	}
	public String getKeywd() {
		return keywd;
	}
	public void setKeywd(String keywd) {
		this.keywd = keywd;
	}
	public String getVisit_date() {
		return visit_date;
	}
	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}
	public String getReview_cont() {
		return review_cont;
	}
	public void setReview_cont(String review_cont) {
		this.review_cont = review_cont;
	}
	
}
