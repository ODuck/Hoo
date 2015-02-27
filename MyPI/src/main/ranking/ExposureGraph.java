package main.ranking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ExposureGraph {

	private static Connection getConnection() throws Exception {
		String jdbcDriver = "jdbc:mysql://localhost:3306/debind?"
				+ "useUnicode=true&characterEncoding=UTF-8";

		return DriverManager.getConnection(jdbcDriver, "debind", "chaser/14");
	}

	public static void insertExprecord(ExpDataBean expData) throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int client_num = expData.getClient_num();
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select count(*) from exprecord where client_num = "
							+ client_num);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				if (rs.getInt(1) == 10) {

					pstmt = conn
							.prepareStatement("delete from exprecord where data_index = 1 and client_num = "
									+ client_num);
					pstmt.executeUpdate();

					pstmt = conn
							.prepareStatement("update exprecord set data_index = data_index - 1 where client_num = "
									+ client_num);
					pstmt.executeUpdate();

				}

				int count = rs.getInt(1);
				System.out.println(count);
				if (count < 10) {
					expData.setData_index(count + 1);
				} else if (count == 10) {
					expData.setData_index(count);
				}
				pstmt = conn
						.prepareStatement("insert into exprecord values(?,?,?,?)");

				pstmt.setInt(1, expData.getData_index());
				pstmt.setInt(2, expData.getClient_num());
				pstmt.setDouble(3, expData.getExposure());
				pstmt.setString(4, expData.getDate());

			}
			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	}

	public static ArrayList<ExpDataBean> getExprecord(String email)
			throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ExpDataBean> expDataList = null;
		ExpDataBean expData = null;
		int client_num = 0;

		expDataList = new ArrayList<ExpDataBean>();

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select client_num from member where email = ?");
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				client_num = rs.getInt("client_num");
			}

			pstmt = conn
					.prepareStatement("select * from exprecord where client_num = ?");

			pstmt.setInt(1, client_num);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				expData = new ExpDataBean();

				expData.setExposure(rs.getInt("exposure"));
				expData.setDate(rs.getString("search_date"));
				expDataList.add(expData);

			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}

		}

		return expDataList;

	}

}
