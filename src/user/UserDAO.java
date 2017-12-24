package user;

import java.sql.*;

public class UserDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    
    public UserDAO(){ //���� �κ�
    	try{
    		/* MySQL ���� */
    		String url = "jdbc:mysql://localhost/oursubway?useSSL=false";
    		Class.forName("com.mysql.jdbc.Driver");
    		conn = DriverManager.getConnection(url, "root", "csedbadmin");
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }

    public int login(String userID, String userPassword){ //�α��� �õ� �Լ�
    	String sql="SELECT userPassword FROM user WHERE userID=?"; //?�� userID�� �־���
    	try{
    		pstmt = conn.prepareStatement(sql);
    		pstmt.setString(1,userID);
    		rs = pstmt.executeQuery(); //����� ��� ��ü
    		if(rs.next()){ //���̵� ������ ���
    			if(rs.getString(1).equals(userPassword)){
    				return 1; //�α��� ����
    			}
    			else
    				return 0; //��й�ȣ ����ġ
    		}
    		return -1; //���̵� ����
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return -2; //�����ͺ��̽� ����
    }
    
    public int join(User user){
    	String sql="INSERT INTO user VALUES(? ,? ,? ,? ,?)";
    	try{ //MYSQL���̺� ������ �Է��ϱ�
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
    	return -1; //�����ͺ��̽� ����
    }
}
