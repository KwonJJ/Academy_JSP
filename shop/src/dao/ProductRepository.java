package dao;

import java.util.ArrayList;

import common.JDBConnect;
import dto.Product;

public class ProductRepository extends JDBConnect {
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	
	// 기본 생성자로 db연결
	public ProductRepository() {
		super();
	}
	
	// db에 있는 자료로 상품 목록 생성
	public void selectProduct() {
		String query = "select * from product";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Product dto = new Product();
				dto.setProductId(rs.getString(1));
				dto.setPname(rs.getString(2));
				dto.setUnitPrice(rs.getInt(3));
				dto.setDescription(rs.getString(4));
				dto.setCategory(rs.getString(5));
				dto.setManufacturer(rs.getString(6));
				dto.setUnitsInStock(rs.getLong(7));
				dto.setCondition(rs.getString(8));
				dto.setProductImage(rs.getString(9));
				listOfProducts.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("상품 목록 가져오기 오류");
		}
	}
	
	
	// 전체 상품 목록 가져오기
	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
		
		Product productById = null;
		
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			if( product.getProductId().equals(productId) ) {
				productById = product;
				break;
			}
		}
		return productById;
	}
	
	
	public int addProduct(Product product) {
		int result=0;
		String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1,product.getProductId());
			psmt.setString(2,product.getPname());
			psmt.setInt(3,product.getUnitPrice());
			psmt.setString(4,product.getDescription());
			psmt.setString(5,product.getCategory());
			psmt.setString(6,product.getManufacturer());
			psmt.setLong(7,product.getUnitsInStock());
			psmt.setString(8,product.getCondition());
			psmt.setString(9,product.getProductImage());
			result = psmt.executeUpdate();

		} catch(Exception e) {
			System.out.println("상품 추가하기 오류");
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	public int deleteProduct(String id) {
		int result=0;
		String sql = "delete from product where p_id=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1,id);
			result=psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("상품 삭제하기 오류");
			e.printStackTrace();
		}
		
		return result;
	}
}









