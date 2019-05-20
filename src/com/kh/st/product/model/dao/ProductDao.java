package com.kh.st.product.model.dao;

import static com.kh.st.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
			pstmt.setString(11, "최상");
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			
		}
		
		
		return result;
	}
}






















