package community;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
	
public class CommDAO{	
	private Connection conn;
	private PreparedStatement pstmt;
	private int urs;
	private ResultSet rs;
	
	public CommDAO() {	
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

public int postComm(String post_writer, String post_title, String post_cont) {
	int success = 0;
	String SQL = "INSERT INTO commposttbl VALUES(?, ?, ?)";
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1,post_writer);
		pstmt.setString(2, post_title);
		pstmt.setString(3, post_cont);
		success = pstmt.executeUpdate();
		if(success == 1) {
			return 1;	//DB���� ����
		}
		else return 0;	//DB���� ����
	}catch(SQLException e) {
		e.printStackTrace();
	}		
	return -1;	//DB���� ����
}

public ArrayList<CommDTO> getComms() {
	String SQL = "select * from commposttbl;";
	
	try {
		pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
	    rs.last();     
	    int rowcount = rs.getRow();
		ArrayList<CommDTO> commdto = new ArrayList<CommDTO>();
	    rs.beforeFirst();
	    while(rs.next()) {
			CommDTO commDTO = new CommDTO();
			commDTO.setPost_writer(rs.getString("user_id"));
			commDTO.setPost_title(rs.getString("post_title"));
			commDTO.setPost_cont(rs.getString("post_cont"));		
			commdto.add(commDTO);
	    }
	    return commdto;
	}catch(SQLException e) {
		e.printStackTrace();
	}
	return null;
}
	
}



