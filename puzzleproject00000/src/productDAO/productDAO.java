package productDAO;



import java.util.ArrayList;

import DBconnect.DBconnect;
import productDTO.productDTO;

public class productDAO extends DBconnect {

	public productDAO() {
		super();
	}
	
	// 상품 목록 가져오기
		public ArrayList<productDTO> getAllProduct() {
			ArrayList<productDTO> productlist = new ArrayList<productDTO>();
			String query = "select * from product";
			try {
				psmt = con.prepareStatement(query);
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					productDTO dto = new productDTO();
					dto.setProductId(rs.getString(1));
					dto.setProductName(rs.getString(2));
					dto.setProductUnitPrice(rs.getInt(3));
					dto.setProductDescription(rs.getString(4));
					dto.setProductBrand(rs.getString(5));
					dto.setProductCategory1(rs.getString(6));
					dto.setProductCategory2(rs.getString(7));
					dto.setProductInStock(rs.getInt(8));
					dto.setProductImage(rs.getString(9));
					productlist.add(dto);
				}
				System.out.println("상품 목록 가져오기 성공");
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("상품 목록 가져오기 오류");
			}
			return productlist;
		}
		
		
		
		// 상품 등록
		public int addProduct(productDTO product) {
			String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
			int result=0;
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1,product.getProductId());
				psmt.setString(2,product.getProductName());
				psmt.setInt(3,product.getProductUnitPrice());
				psmt.setString(4,product.getProductDescription());
				psmt.setString(5,product.getProductBrand());
				psmt.setString(6,product.getProductCategory1());
				psmt.setString(7,product.getProductCategory2());
				psmt.setLong(8,product.getProductInStock());
				psmt.setString(9, product.getProductImage());
				result=psmt.executeUpdate();
				System.out.println("상품 추가하기 성공");
				
			} catch(Exception e) {
				System.out.println("상품 추가하기 오류");
				e.printStackTrace();
			}
			return result;
			
			
		}
		
		//상품 삭제
		public void deleteProduct(String id) {
			String sql = "delete from product where productId=?";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1,id);
				psmt.executeUpdate();
				
				System.out.println("상품 삭제하기 성공");
			} catch(Exception e) {
				System.out.println("상품 삭제하기 오류");
				e.printStackTrace();
			}
			
		}
		// 상품 상세정보가져오기
		public productDTO detailProduct(String productId) {
			productDTO dto= new productDTO();
			String sql="select * from product where productId=?";
			try {
				psmt=con.prepareStatement(sql);
				psmt.setString(1, productId);
				rs=psmt.executeQuery();
				if(rs.next()) {
					dto.setProductId(rs.getString(1));
					dto.setProductName(rs.getString(2));
					dto.setProductUnitPrice(rs.getInt(3));
					dto.setProductDescription(rs.getString(4));
					dto.setProductBrand(rs.getString(5));
					dto.setProductCategory1(rs.getString(6));
					dto.setProductCategory2(rs.getString(7));
					dto.setProductInStock(rs.getInt(8));
					dto.setProductImage(rs.getString(9));
				}
				System.out.println("상품상세보기 성공");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("상품상세보기 실패");
			}
			
			return dto;
		}
		
		// 상품 목록 가져오기[카테고리별로 가져오기]
				public ArrayList<productDTO> getcategoryProduct(String productCategory1, String productCategory2 ) {
					ArrayList<productDTO> productlist = new ArrayList<productDTO>();
					String query = "select * from product where productCategory1=? or productCategory2=?";
					try {
						psmt = con.prepareStatement(query);
						psmt.setString(1, productCategory1);
						psmt.setString(2, productCategory2);
						rs = psmt.executeQuery();
						
						while(rs.next()) {
							productDTO dto = new productDTO();
							dto.setProductId(rs.getString(1));
							dto.setProductName(rs.getString(2));
							dto.setProductUnitPrice(rs.getInt(3));
							dto.setProductDescription(rs.getString(4));
							dto.setProductBrand(rs.getString(5));
							dto.setProductCategory1(rs.getString(6));
							dto.setProductCategory2(rs.getString(7));
							dto.setProductInStock(rs.getInt(8));
							dto.setProductImage(rs.getString(9));
							productlist.add(dto);
						}
						System.out.println("상품 목록 가져오기 성공");
					}catch(Exception e) {
						e.printStackTrace();
						System.out.println("상품 목록 가져오기 오류");
					}
					return productlist;
				}
				
	
}
