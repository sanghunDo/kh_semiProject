package semi.board.solve.model.vo;

import java.sql.Date;

public class GameRank {
	private int playno;
	private String gameid;
	private int gameruntime;
	private Date gameEscapeDate;
	

	public GameRank() {
		
	}
	
	@Override
	public String toString() {
		return "GameRank [playno=" + playno + ", gameid=" + gameid + ", gameruntime=" + gameruntime
				+ ", gameEscapeDate=" + gameEscapeDate + "]";
	}
	public GameRank(int playno, String gameid, int gameruntime, Date gameEscapeDate) {
		super();
		this.playno = playno;
		this.gameid = gameid;
		this.gameruntime = gameruntime;
		this.gameEscapeDate = gameEscapeDate;
	}
	public int getPlayno() {
		return playno;
	}
	public void setPlayno(int playno) {
		this.playno = playno;
	}
	public String getGameid() {
		return gameid;
	}
	public void setGameid(String gameid) {
		this.gameid = gameid;
	}
	public int getGameruntime() {
		return gameruntime;
	}
	public void setGameruntime(int gameruntime) {
		this.gameruntime = gameruntime;
	}
	public Date getGameEscapeDate() {
		return gameEscapeDate;
	}
	public void setGameEscapeDate(Date gameEscapeDate) {
		this.gameEscapeDate = gameEscapeDate;
	}
}
