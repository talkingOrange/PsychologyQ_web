package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReviewDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private int urs;
	private ResultSet rs;
	
	public ReviewDAO() {
		try{
			String dbURL = "jdbc:mariadb://127.0.0.1:3306/simliq";
			String dbID ="root";
			String dbPassword = "root";
			Class.forName("org.mariadb.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int postReview(String user_nname, String counsel_name, int total_star, int attitude_star, int booking_star, int location_star, String keywd, String visit_date, int nth_visit, String content) {
		int success = 0;
		String SQL = "INSERT INTO reviewtbl(user_nname, counsel_name, total_star, attitude_star, booking_star, location_star, keywd, visit_date, nth_visit, review_cont) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user_nname);
			pstmt.setString(2, counsel_name);
			pstmt.setInt(3, total_star);
			pstmt.setInt(4, attitude_star);
			pstmt.setInt(5, booking_star);
			pstmt.setInt(6, location_star);
			pstmt.setString(7, keywd);
			pstmt.setString(8, visit_date);
			pstmt.setInt(9, nth_visit);
			pstmt.setString(10, content);
			success = pstmt.executeUpdate();
			if(success == 1) {
				return 1;	//DB저장 성공
			}
			else return 0;	//DB저장 실패
			
		}catch(SQLException e) {
			e.printStackTrace();
		}		
		return -1;	//DB연결 실패
	}
	
	public ArrayList<ReviewDTO> getReviews() {
		String SQL = "select * from reviewtbl;";

		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
//		    rs.last();     
//		    int rowcount = rs.getRow();
			ArrayList<ReviewDTO> reviewdto = new ArrayList<ReviewDTO>();
//		    rs.beforeFirst();
		    while(rs.next()) {
				ReviewDTO reviewDTO = new ReviewDTO();
				reviewDTO.setUser_nname(rs.getString("user_nname"));
				reviewDTO.setCounsel_name(rs.getString("counsel_name"));
				reviewDTO.setTotal_star(rs.getInt("total_star"));
				reviewDTO.setAttitude_star(rs.getInt("attitude_star"));
				reviewDTO.setBooking_star(rs.getInt("booking_star"));
				reviewDTO.setLocation_star(rs.getInt("location_star"));
				reviewDTO.setKeywd(rs.getString("keywd"));
				reviewDTO.setReview_cont(rs.getString("review_cont"));
				reviewDTO.setVisit_date(rs.getString("visit_date"));
				reviewDTO.setNth_visit(rs.getInt("nth_visit"));
				reviewDTO.setReview_date(rs.getString("review_date"));
				reviewdto.add(reviewDTO);
		    }
		    return reviewdto;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
		
}
