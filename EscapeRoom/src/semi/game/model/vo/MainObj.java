package semi.game.model.vo;

import java.io.Serializable;

public class MainObj implements Serializable{
	private static final long serialVersionUID = 1L;
	private int objNo;
	private String objName;
	private String coment;
	private String position;
	private int refNo;
	private String isItem;
	
	public MainObj() {}
	
	public MainObj(int objNo, String objName, String coment, String position, int refNo, String isItem) {
		this.objNo = objNo;
		this.objName = objName;
		this.coment = coment;
		this.position = position;
		this.refNo = refNo;
		this.isItem = isItem;
	}

	@Override
	public String toString() {
		return "MainObj [objNo=" + objNo + ", objName=" + objName + ", coment=" + coment + ", position=" + position
				+ ", refNo=" + refNo + ", isItem=" + isItem + "]";
	}

	public int getObjNo() {
		return objNo;
	}

	public void setObjNo(int objNo) {
		this.objNo = objNo;
	}

	public String getObjName() {
		return objName;
	}

	public void setObjName(String objName) {
		this.objName = objName;
	}

	public String getComent() {
		return coment;
	}

	public void setComent(String coment) {
		this.coment = coment;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getRefNo() {
		return refNo;
	}

	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}

	public String getIsItem() {
		return isItem;
	}

	public void setIsItem(String isItem) {
		this.isItem = isItem;
	}
}
