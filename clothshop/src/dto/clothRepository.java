package dto;

import java.util.ArrayList;

public class clothRepository {
	private ArrayList<Cloth> allCloth = new ArrayList();

	public clothRepository() {
		Cloth cloth1 = new Cloth();
		cloth1.setClothId("a1234");
		cloth1.setClothName("셔츠");
		cloth1.setClothCost(35000);
		cloth1.setClothSize(100);
		cloth1.setClothColor("blue");

		allCloth.add(cloth1);

		Cloth cloth2 = new Cloth();
		cloth2.setClothId("a1235");
		cloth2.setClothName("반바지");
		cloth2.setClothCost(40000);
		cloth2.setClothSize(95);
		cloth2.setClothColor("gray");
		allCloth.add(cloth2);

		Cloth cloth3 = new Cloth();
		cloth3.setClothId("a1236");
		cloth3.setClothName("맨투맨");
		cloth3.setClothCost(50000);
		cloth3.setClothSize(105);
		cloth3.setClothColor("black");
		allCloth.add(cloth3);
	}

	public ArrayList<Cloth> getAllCloth() {
		return allCloth;
	}

	public Cloth getClothById(String clothId) {
		Cloth clothById = null;

		for (int i = 0; i < allCloth.size(); i++) {
			Cloth cloth = allCloth.get(i);

			if (cloth.getClothId().equals(clothId)) {
				clothById = cloth;
				break;
			}
		}
		return clothById;
	}
}