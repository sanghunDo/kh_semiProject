package semi.game.model.vo;

public class StoryObj {
	private int no;
	private String content;
	private String fileName;
	private String audioName;
	
	public StoryObj() {
		
	}
	
	public StoryObj(int no, String content, String fileName, String audioName) {
		this.no = no;
		this.content = content;
		this.fileName = fileName;
		this.audioName = audioName;
	}
	
	@Override
	public String toString() {
		return no + " " + content + " " + fileName + " " + audioName;
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
	
	public String getAudioName() {
		return audioName;
	}
	
	public void setAudioName(String audioName) {
		this.audioName = audioName;
	}
}
