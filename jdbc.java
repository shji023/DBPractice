package Java_mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;



public class Jdbc {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/db01?useUnicode=true&serverTimezone=Asia/Seoul&autoReconnect=true&useSSL=false";
	String user = "root";
	String pass = "1234";

	public Jdbc() {

		try {
			Class.forName(driver);
			System.out.println("mysql드라이버 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("mysql드라이버 실패");
		}

	}

	/////////////////////// 커넥션연결
	public Connection getConnection() {
		Connection conn = null;

		try {
			conn = DriverManager.getConnection(url, user, pass);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("db연동실패");
		}

		return conn;
	}

	///////////////////////// insert
	public void insert() {
		Scanner sc = new Scanner(System.in);

		String name, age, salary;

		String sql = "";

		System.out.println("이름?");
		name = sc.nextLine();
		System.out.println("나이?");
		age= sc.nextLine();
		System.out.println("연봉?");
		salary = sc.nextLine();

		sql = "insert into table01 values(null,?,?,?)";

		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			// ?,?,?인자값 완성
			pstmt.setString(1, name);
			pstmt.setString(2, age);
			pstmt.setString(3, salary);

			// 업데이트
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	//////////////////////////////////////// select
	public void select() {
		System.out.println("시퀀스\t 이름 \t나이\t연봉");
		System.out.println("------------------------------");

		String sql = "select * from table01";

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		conn = getConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				System.out.println(rs.getInt("id") + "\t" + rs.getString("name") + "\t" + rs.getString("age") + "\t"
						+ rs.getString("salary"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}
	
	public void selectOne(int a) {
		System.out.println("시퀀스\t 이름 \t나이\t연봉");
		System.out.println("------------------------------");

		String sql = "select * from table01 where id=";

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		conn = getConnection();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql+a);

			while (rs.next()) {
				System.out.println(rs.getInt("id") + "\t" + rs.getString("name") + "\t" + rs.getString("age") + "\t"
						+ rs.getString("salary"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	//////////////////////////////////////// delete
	public void delete() {
		Scanner sc = new Scanner(System.in);
		String no;
		String sql = "";

		System.out.println("몇 번을 삭제하시겠어요?");
		no = sc.nextLine();

		sql = "delete from table01 where id=" + no;

		System.out.println(sql);

		Connection conn = null;
		Statement stmt = null;

		conn = getConnection();
		try {
			stmt=conn.createStatement();
			stmt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("없는 아이디 잆니다");
		}finally {
			try {
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		

	}

	/////////////////////////////// update
	public void update() {
		Scanner sc = new Scanner(System.in);
		String name, age, salary, id;

		System.out.println("수정할 번호 입력");
		id = sc.nextLine();
		System.out.println("수정할 이름 입력");
		name = sc.nextLine();
		System.out.println("수정할 나이 입력");
		age = sc.nextLine();
		System.out.println("수정할 연봉 입력");
		salary = sc.nextLine();

		String sql = "update table01 set name=?, age=?, salary=? where id=?";

		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, name);
			pstmt.setString(2, age);
			pstmt.setString(3, salary);
			pstmt.setString(4, id);

			int a = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	////////////////////////////////////////
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Jdbc mdb = new Jdbc();

		Scanner sc = new Scanner(System.in);
		Scanner sc1 = new Scanner(System.in);
		int n = 0;
		int user;

		while (true) {
			System.out.println("1.insert 2.select 3.delete 4.update 0.종료");
			n = Integer.parseInt(sc.nextLine());

			if (n == 1) 
				mdb.insert();
			else if (n == 0) {
				System.out.println("종료");
				break;
			} else if (n == 2) {
				System.out.println("전체를 불러오려면 0, 특정 id를 불러오려면 id입력");

				user = Integer.parseInt(sc1.nextLine());
				if (user == 0) {
					mdb.select();
				} else {
					mdb.selectOne(user);
				}
			}
			else if (n == 4)
				mdb.update();
			else if(n==3)
				mdb.delete();
		}

	}

}
