package dto;

public class MemberDTO {
	private String id;
	private String name;
	private String pass;
	private String phone;
	private String address;
	private String photoimage;

	public String getPhotoimage() {
		return photoimage;
	}

	public void setPhotoimage(String photoimage) {
		this.photoimage = photoimage;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
