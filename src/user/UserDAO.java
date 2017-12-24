package user;

import java.sql.*;

public class UserDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    
    public UserDAO(){ //접속 부분
    	try{
    		/* MySQL 연동 */
    		String url = "jdbc:mysql://localhost/oursubway?useSSL=false";
    		Class.forName("com.mysql.jdbc.Driver");
    		conn = DriverManager.getConnection(url, "root", "csedbadmin");
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }

    public int login(String userID, String userPassword){ //로그인 시도 함수
    	String sql="SELECT userPassword FROM user WHERE userID=?"; //?에 userID를 넣어줌
    	try{
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1,userID);
    		rs = pstmt.executeQuery(); //결과를 담는 객체
    		if(rs.next()){ //아이디가 존재할 경우
    			if(rs.getString(1).equals(userPassword)){
    				return 1; //로그인 성공
    			}
    			else
    				return 0; //비밀번호 불일치
    		}
    		return -1; //아이디가 없음
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return -2; //데이터베이스 오류
    }
    
    public int join(User user){
    	String sql="INSERT INTO user VALUES(? ,? ,? ,? ,?)";
    	try{ //MYSQL테이블에 데이터 입력하기
    		pstmt=conn.prepareStatement(sql);
    		pstmt.setString(1, user.getUserID());
    		pstmt.setString(2, user.getUserName());
    		pstmt.setString(3, user.getUserGender());
    		pstmt.setString(4, user.getUserEmail());
    		pstmt.setString(5, user.getUserPassword());
    		return pstmt.executeUpdate();

    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return -1; //데이터베이스 오류
    }
}
