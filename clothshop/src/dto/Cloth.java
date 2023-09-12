package dto;

public class Cloth {
	private String clothId; // 상품 아이디
	private String clothName; // 상품명
	private int clothCost; // 상품 가격
	private int clothSize; // 상품 사이즈
	private String clothColor; // 상품 색상

	public Cloth() {
	}

	public String getClothId() {
		return clothId;
	}

	public void setClothId(String clothId) {
		this.clothId = clothId;
	}

	public String getClothName() {
		return clothName;
	}

	public void setClothName(String clothName) {
		this.clothName = clothName;
	}

	public int getClothCost() {
		return clothCost;
	}

	public void setClothCost(int clothCost) {
		this.clothCost = clothCost;
	}

	public int getClothSize() {
		return clothSize;
	}

	public void setClothSize(int clothSize) {
		this.clothSize = clothSize;
	}

	public String getClothColor() {
		return clothColor;
	}

	public void setClothColor(String clothColor) {
		this.clothColor = clothColor;
	}

}