package semi.game.model.vo;

public class PrologueObj {
	private int no;
	private String content;
	private String fileName;
	
	public PrologueObj() {}

	public PrologueObj(int no, String content, String fileName) {
		this.no = no;
		this.content = content;
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "PrologueObj [no=" + no + ", content=" + content + ", fileName=" + fileName + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
