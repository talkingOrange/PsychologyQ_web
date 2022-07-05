package counsel;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import review.ReviewDTO;

public class CounselDAO {
	private Connection conn; //자바와 데이터베이스를 연결
	private PreparedStatement pstmt; //쿼리문 대기 및 설정
	private ResultSet rs; //결과값 받아오기
	public CounselDAO() {
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
	public ArrayList<CounselDTO> selectCounsel() {
		String sql = "select * from counseltbl;";
		try {
			pstmt = conn.prepareStatement(sql); //sql쿼리문을 대기 시킨다
			rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
			ArrayList<CounselDTO> counseldto = new ArrayList<CounselDTO>();
		    while(rs.next()) {
				CounselDTO counselDTO = new CounselDTO();
				counselDTO.setCounsel_name(rs.getString("counsel_name"));
				counselDTO.setStar_avrg(rs.getDouble("star_avrg"));
				counselDTO.setCounsel_add(rs.getString("counsel_add"));
				counseldto.add(counselDTO);
		    }
			return counseldto; //아이디 없음
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null; //오류
	}

}
