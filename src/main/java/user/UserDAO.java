package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn; //자바와 데이터베이스를 연결
	private PreparedStatement pstmt; //쿼리문 대기 및 설정
	private ResultSet rs; //결과값 받아오기
	
	//기본 생성자
	//UserDAO가 실행되면 자동으로 생성되는 부분
	//메소드마다 반복되는 코드를 이곳에 넣으면 코드가 간소화된다
	public UserDAO() {
		try {
			String dbURL = "jdbc:mariadb://localhost:3306/simliq";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String user_id, String user_pwd) {
		String sql = "select user_pwd from userTbl where user_id = ?";
		try {
			pstmt = conn.prepareStatement(sql); //sql쿼리문을 대기 시킨다
			pstmt.setString(1, user_id); //첫번째 '?'에 매개변수로 받아온 'userID'를 대입
			rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
			if(rs.next()) {
				if(rs.getString(1).equals(user_pwd)) {
					return 1; //로그인 성공
				}else
					return 0; //비밀번호 틀림
			}
			return -1; //아이디 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //오류
	}

	public int signup(String user_id,String user_pwd,String user_name) {
		System.out.println("회원가입");
		String sql="INSERT into userTbl(user_id, user_pwd, user_nname) values (?,?,?)";
		int result;
		
		try {
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1, user_id);
			pstmt.setString(2,user_pwd);
			pstmt.setString(3, user_name);
			result = pstmt.executeUpdate(); 
			if(result==1) {
				return 1;//insert성공
			}else {
				return 0;//insert실패
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//알수없는 에러로 종료
		
	}
	
	public int checkDuplicate(String user_id) {
		String sql = "select user_id from userTbl where user_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id); 
			rs = pstmt.executeQuery(); 
			
			if (rs.next()) {
				return 0;
			} else {
				return 1;
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public String getNname(String user_id) {
		String sql = "SELECT user_nname FROM usertbl WHERE user_id= ?;";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id); 
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				return rs.getString(1);
			}
			return "false";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "database error";
	}
	
	public int saveSched(String user_nname, String sche_date, String sche_time, String counsel_name) {
		String sql = "INSERT INTO calendartbl VALUES( ?, ?, ?, ?);";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_nname);
			pstmt.setString(2, counsel_name);
			pstmt.setString(3,  sche_date);
			pstmt.setString(4, sche_time);
			result = pstmt.executeUpdate();		
			if(result==1) {
				return 0;
			}
			return -1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	
	public int selectStarAvrg(String counsel_name) {
		String sql = "SELECT star_avrg FROM counseltbl WHERE counsel_name= ?;"; 
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, counsel_name);
			result = pstmt.executeUpdate();		
			if(rs.next()) {
				return rs.getInt(1);
			}
			return -1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	public String getSched(String user_nname, String sche_date) {
		String sql = "SELECT sche_time, counsel_name FROM calendartbl WHERE user_nname is ? AND sche_date = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_nname);
			pstmt.setString(2, sche_date);
			rs = pstmt.executeQuery(); 
			
			if(rs.next()) {
				return rs.getString(1) + "%%" + rs.getString(2);
			}
			return "cannot find entity";
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "database error";
	}
}
