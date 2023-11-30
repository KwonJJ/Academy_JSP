package productDTO;


public class productDTO {
	private String productId; //상품코드
	private String productName; //상품명
	private int productUnitPrice; //상품가격
	private String productDescription; //상품설명
	private String productBrand; //브랜드
	private String productCategory1; //카테고리[대분류]
	private String productCategory2; //카테고리[소분류]
	private int productInStock; //재고
	private String productImage; //이미지
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductUnitPrice() {
		return productUnitPrice;
	}
	public void setProductUnitPrice(int productUnitPrice) {
		this.productUnitPrice = productUnitPrice;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(String productBrand) {
		this.productBrand = productBrand;
	}
	public String getProductCategory1() {
		return productCategory1;
	}
	public void setProductCategory1(String productCategory1) {
		this.productCategory1 = productCategory1;
	}
	public String getProductCategory2() {
		return productCategory2;
	}
	public void setProductCategory2(String productCategory2) {
		this.productCategory2 = productCategory2;
	}
	public int getProductInStock() {
		return productInStock;
	}
	public void setProductInStock(int productInStock) {
		this.productInStock = productInStock;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	
	
	
}
