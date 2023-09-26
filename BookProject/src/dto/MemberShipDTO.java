package dto;

public class MemberShipDTO {
	private String memberid;
	private String memberpw;
	private String membername;
	private String memberaddress;
	private String membertel;

	public MemberShipDTO() {
		super();
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getMemberpw() {
		return memberpw;
	}

	public void setMemberpw(String memberpw) {
		this.memberpw = memberpw;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public String getMemberaddress() {
		return memberaddress;
	}

	public void setMemberaddress(String memberaddress) {
		this.memberaddress = memberaddress;
	}

	public String getMembertel() {
		return membertel;
	}

	public void setMembertel(String membertel) {
		this.membertel = membertel;
	}
}

