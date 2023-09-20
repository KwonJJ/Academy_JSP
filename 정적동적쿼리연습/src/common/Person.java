package common;

public class Person {
	private String name; // 멤버 변수는 private선언(jsp규칙)
	private int age;

	public Person() {
	} // 기본 생성자(jsp규칙)

	public Person(String name, int age) { // 파라미터 2개짜리 생성자(규칙은 아님)
		this.name = name;
		this.age = age;
	}

	// getter, setter 메소드는 public으로 생성(jsp규칙)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

}