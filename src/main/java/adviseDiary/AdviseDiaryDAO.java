package adviseDiary;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class AdviseDiaryDAO {
	
	private Connection conn; //자바와 데이터베이스를 연결
	private PreparedStatement pstmt; //쿼리문 대기 및 설정
	private ResultSet rs; //결과값 받아오기
	
	//기본 생성자
	//AdviseDiaryDAO가 실행되면 자동으로 생성되는 부분
	//메소드마다 반복되는 코드를 이곳에 넣으면 코드가 간소화된다
	public AdviseDiaryDAO() {
		try {
			String dbURL = "jdbc:mariadb://localhost:3306/simliq";
			String dbID = "root";
			String dbPassword = "root";
			Properties p = new Properties();
			p.put("user", "root");
			p.put("password", "root");
			p.put("passwordCharacterEncoding","utf-8");
			
			Class.forName("org.mariadb.jdbc.Driver");
		
			//conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			conn=DriverManager.getConnection(dbURL, p);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int modify(String user_id,String user_pwd,String user_name) {
		System.out.println("상담일지 수정");
		String sql="UPDATE advise_diary SET content = ? WHERE id = ?";
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
	
	public int save(String content,String user_id,String adviseDate) {
		//todo 기존 상담 일지 삭제
		System.out.println("상담일지 저장");
		String sql = "INSERT INTO advise_diary (content,user_id,advise_date) values (?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content); 
			pstmt.setString(2, user_id);
			pstmt.setString(3, adviseDate);
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
	
	public String get(String user_id, String adviseDate) {
		System.out.println("상담일지 조회");
		String sql = "SELECT content FROM advise_diary WHERE user_id = ? AND advise_date = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			pstmt.setString(2, adviseDate);
			rs = pstmt.executeQuery(); 
			
			if (rs.next()) {
				return rs.getString(1);
			} else {
				return "empty"; // 데이터 없음
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "fail"; // 데이터베이스 에러
	}
}
