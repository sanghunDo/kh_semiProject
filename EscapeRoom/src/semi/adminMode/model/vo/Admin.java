package semi.adminMode.model.vo;

public class Admin {
	private String adminId;
	private int adminVote;
	
	public Admin() {}
	
	public Admin(String adminId, int adminVote) {
		this.adminId = adminId;
		this.adminVote = adminVote;
	}
	
	@Override
	public String toString() {
		return adminId + " " + adminVote;
	}
	
	public String getAdminId() {
		return adminId;
	}
	
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	
	public int getAdminVote() {
		return adminVote;
	}
	
	public void setAdminVote(int adminVote) {
		this.adminVote = adminVote;
	}
}
