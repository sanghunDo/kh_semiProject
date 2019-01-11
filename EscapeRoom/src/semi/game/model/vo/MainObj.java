package semi.game.model.vo;

import java.io.Serializable;

public class MainObj implements Serializable{
	private static final long serialVersionUID = 1L;
	private int objNo;
	private String objName;
	private String secondName;
	private String thirdName;
	private String position;
	private int objLevel;
	private int refNo;
	private String isItem;
	
	public MainObj() {}
	
	public MainObj(int objNo, String objName, String secondName, String thirdName, String coment, String position, int objLevel, int refNo, String isItem) {
		this.objNo = objNo;
		this.objName = objName;
		this.secondName = secondName;
		this.thirdName = thirdName;
		this.position = position;
		this.objLevel = objLevel;
		this.refNo = refNo;
		this.isItem = isItem;
	}

	@Override
	public String toString() {
		return "MainObj [objNo=" + objNo + ", objName=" + objName + ", secondName=" + secondName + ", thirdName="
				+ thirdName + ", position=" + position + ", objLevel=" + objLevel + ", refNo=" + refNo + ", isItem="
				+ isItem + "]";
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

	public String getSecondName() {
		return secondName;
	}

	public void setSecondName(String secondName) {
		this.secondName = secondName;
	}

	public String getThirdName() {
		return thirdName;
	}

	public void setThirdName(String thirdName) {
		this.thirdName = thirdName;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getObjLevel() {
		return objLevel;
	}

	public void setObjLevel(int objLevel) {
		this.objLevel = objLevel;
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
