package counsel;

public class CounselDTO {
	String counsel_name;
	double star_avrg;
	String counsel_add;
	public String getCounsel_add() {
		return counsel_add;
	}
	public void setCounsel_add(String counsel_add) {
		this.counsel_add = counsel_add;
	}
	public String getCounsel_name() {
		return counsel_name;
	}
	public void setCounsel_name(String counsel_name) {
		this.counsel_name = counsel_name;
	}
	public double getStar_avrg() {
		return star_avrg;
	}
	public void setStar_avrg(double d) {
		this.star_avrg = d;
	}
}
