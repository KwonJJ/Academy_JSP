package dao;

import java.util.ArrayList;

import common.JDBConnect;
import dto.MemberDTO;
import dto.Product;

public class ProductRepository extends JDBConnect {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	/*
	 * private static ProductRepository instance = new ProductRepository();
	 * 
	 * public static ProductRepository getInstance() { return instance; }
	 */

	/*
	 * public ProductRepository() { Product phone = new Product("P1234",
	 * "아이폰 14Pro Max", 1600000); phone.setDescription("6.7인치 OLED 디스플레이,후면 카메라3대");
	 * phone.setCategory("스마트 폰"); phone.setManufacturer("애플");
	 * phone.setUnitsInStock(1000); phone.setCondition("신상품");
	 * 
	 * Product notebook = new Product("P1235", "LG PC그램", 1200000);
	 * notebook.setDescription("15.6인치 AMOLED 디스플레이, i5 12세대 중고노트북");
	 * notebook.setCategory("노트북"); notebook.setManufacturer("LG");
	 * notebook.setUnitsInStock(30); notebook.setCondition("중고상품");
	 * 
	 * Product tablet = new Product("P1236", "삼성탭9 플러스", 1100000);
	 * tablet.setDescription("12.4인치 AMOLED 디스플레이, 안드로이드13");
	 * tablet.setCategory("태블릿"); tablet.setManufacturer("삼성");
	 * tablet.setUnitsInStock(100); tablet.setCondition("재생품");
	 * 
	 * listOfProducts.add(phone); listOfProducts.add(notebook);
	 * listOfProducts.add(tablet); }
	 */

	public ProductRepository() {
		// 기본 생성자로 DB연결
		super();
	}

	public void selectProduct() {
		String query = "select * from product";

		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();

			while (rs.next()) {
				Product dto = new Product();
				dto.setProductId(rs.getString(1));
				dto.setPname(rs.getString(2));
				dto.setUnitPrice(rs.getInt(3));
				dto.setDescription(rs.getString(4));
				dto.setCategory(rs.getString(5));
				dto.setManufacturer(rs.getString(6));
				dto.setUnitsInStock(rs.getLong(7));
				dto.setCondition(rs.getString(8));
				listOfProducts.add(dto);
			}

		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("상품 목록 가져오기 실패");
		}

	}

	public ArrayList<Product> getAllProducts() {
		return listOfProducts;
	}

	public Product getProductById(String productId) {
		Product productById = null;

		for (int i = 0; i < listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);

			if (productId != null && product.getProductId() != null && product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}

		return productById;
	}

	public int addProduct(Product product) {
		// listOfProducts.add(product);
		int result = 0;
		String sql = "insert into product values(?,?,?,?,?,?,?,?)";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, product.getProductId());
			psmt.setString(2, product.getPname());
			psmt.setInt(3, product.getUnitPrice());
			psmt.setString(4, product.getDescription());
			psmt.setString(5, product.getCategory());
			psmt.setString(6, product.getManufacturer());
			psmt.setLong(7, product.getUnitsInStock());
			psmt.setString(8, product.getCondition());
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("상품 추가하기 오류");
			e.printStackTrace();
		}

		return result;
	}

	public int deleteProduct(String id) {
		int result = 0;
		String sql = "delete from product where p_id=?";

		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("상품 삭제하기 오류");
			e.printStackTrace();
		}

		return result;
	}

}