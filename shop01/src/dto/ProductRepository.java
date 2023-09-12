package dto;

import java.util.ArrayList;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();

	public static ProductRepository getInstance() {
		return instance;
	}

	public ProductRepository() {

		Product phone = new Product("P1234", "아이폰 14Pro Max", 1600000);
		phone.setDescription("6.7인치 OLED 디스플레이,후면 카메라3대");
		phone.setCategory("스마트 폰");
		phone.setManufacturer("애플");
		phone.setUnitsInStock(1000);
		phone.setCondition("신상품");

		Product notebook = new Product("P1235", "LG PC그램", 1200000);
		notebook.setDescription("15.6인치 AMOLED 디스플레이, i5 12세대 중고노트북");
		notebook.setCategory("노트북");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(30);
		notebook.setCondition("중고상품");

		Product tablet = new Product("P1236", "삼성탭9 플러스", 1100000);
		tablet.setDescription("12.4인치 AMOLED 디스플레이, 안드로이드13");
		tablet.setCategory("태블릿");
		tablet.setManufacturer("삼성");
		tablet.setUnitsInStock(100);
		tablet.setCondition("재생품");

		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
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

	public void addProduct(Product product) {
		listOfProducts.add(product);
	}

}