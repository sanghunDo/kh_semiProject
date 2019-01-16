package semi.board.free.model.vo;

import java.sql.Date;

public class TemporaryData {

	private int dataNo;
	private String dataTitle;
	private String dataWriter;
	private String dataContent;
	private String dataOriginalFile;
	private String dataRenamedFile;
	private Date dataDate;
	
	public TemporaryData() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public TemporaryData(int dataNo, String dataTitle, String dataWriter, String dataContent, String dataOriginalFile,
			String dataRenamedFile, Date dataDate) {
		super();
		this.dataNo = dataNo;
		this.dataTitle = dataTitle;
		this.dataWriter = dataWriter;
		this.dataContent = dataContent;
		this.dataOriginalFile = dataOriginalFile;
		this.dataRenamedFile = dataRenamedFile;
		this.dataDate = dataDate;
	}
	
	@Override
	public String toString() {
		return "TemporaryData [dataNo=" + dataNo + ", dataTitle=" + dataTitle + ", dataWriter=" + dataWriter
				+ ", dataContent=" + dataContent + ", dataOriginalFile=" + dataOriginalFile + ", dataRenamedFile="
				+ dataRenamedFile + ", dataDate=" + dataDate + "]";
	}
	public int getDataNo() {
		return dataNo;
	}
	public void setDataNo(int dataNo) {
		this.dataNo = dataNo;
	}
	public String getDataTitle() {
		return dataTitle;
	}
	public void setDataTitle(String dataTitle) {
		this.dataTitle = dataTitle;
	}
	public String getDataWriter() {
		return dataWriter;
	}
	public void setDataWriter(String dataWriter) {
		this.dataWriter = dataWriter;
	}
	public String getDataContent() {
		return dataContent;
	}
	public void setDataContent(String dataContent) {
		this.dataContent = dataContent;
	}
	public String getDataOriginalFile() {
		return dataOriginalFile;
	}
	public void setDataOriginalFile(String dataOriginalFile) {
		this.dataOriginalFile = dataOriginalFile;
	}
	public String getDataRenamedFile() {
		return dataRenamedFile;
	}
	public void setDataRenamedFile(String dataRenamedFile) {
		this.dataRenamedFile = dataRenamedFile;
	}
	public Date getDataDate() {
		return dataDate;
	}
	public void setDataDate(Date dataDate) {
		this.dataDate = dataDate;
	}

	
	

}
