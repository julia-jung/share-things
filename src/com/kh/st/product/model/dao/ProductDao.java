package com.kh.st.product.model.dao;

import static com.kh.st.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.st.product.model.vo.PCategory;
import com.kh.st.product.model.vo.Product;

public class ProductDao {
	
	private Properties prop = new Properties();
	public ProductDao() {
		String fileName = ProductDao.class.getResource("/sql/product/product-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<PCategory> selectCtgLv3List(Connection con, String ctgLv2) {

		PreparedStatement pstmt = null;
		ArrayList<PCategory> ctgList = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectCtgLv3List");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, ctgLv2);
			rset = pstmt.executeQuery();
			ctgList = new ArrayList<PCategory>();
			while(rset.next()) {
				PCategory ctg = new PCategory();
				ctg.setCtgId(rset.getInt("CTG_ID"));
				ctg.setCtgLevel(rset.getInt("CTG_LEVEL"));
				ctg.setCtgName(rset.getString("CTG_NAME"));
				ctg.setParentCtgId(rset.getInt("PARENT_CTGID"));
				ctgList.add(ctg);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return ctgList;
	}

	
	/* ------------------------준혁 */
	public int productInsert(Connection con, Product p) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("productInsert");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, p.getUno());
			pstmt.setDate(2, p.getpStartDate());
			pstmt.setDate(3, p.getpEndDate());
			pstmt.setInt(4, p.getPrice());
			pstmt.setInt(5, p.getDeposite());
			pstmt.setString(6, p.getModel());
			pstmt.setInt(7, p.getCtgId());
			pstmt.setDate(8, p.getPurchaseDate());
			pstmt.setInt(9, p.getPurchasePrice());
			pstmt.setString(10, p.getAsHistory());
			pstmt.setString(11, "하");
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		
		return result;
	}

	public int getProductNo(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int pno = 0;
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				pno = rset.getInt("NEXTVAL");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return pno;
	}

	public int regreqProduct(Connection con, int pno) {
		PreparedStatement pstmt =null;
		int rqresult = 0;
		String query = prop.getProperty("reqProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pno);
			pstmt.setInt(2, 1);
			
			rqresult = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		

		
		
		return rqresult;
	}

	public ArrayList<Product> selectList(Connection con, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("pdselectList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			
			while(rset.next()) {
				Product p = new Product();
				
				p.setPno(rset.getInt("PNO"));
				p.setUno(rset.getInt("UNO"));
				p.setpStartDate(rset.getDate("PSTART_DATE"));
				p.setpEndDate(rset.getDate("PEND_DATE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setDeposite(rset.getInt("DEPOSIT"));
				p.setDlFreeAmount(rset.getInt("DL_FREE_AMOUNT"));
				p.setModel(rset.getString("MODEL"));
				p.setCtgId(rset.getInt("CTG_ID"));
				p.setPurchaseDate(rset.getDate("PURCHASE_DATE"));
				p.setPurchasePrice(rset.getInt("PURCHASE_PRICE"));
				p.setAsHistory(rset.getString("ASHISTORY"));
				p.setCondition(rset.getString("CONDITION"));
				p.setSid(rset.getString("STATUS"));
				
				
				
				
				
				list.add(p);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

		
}






















