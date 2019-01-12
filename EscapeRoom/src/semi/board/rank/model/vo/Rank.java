package semi.board.rank.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Rank implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private int playno;
	private String gameId;
	private String userprofilerenamedfile;
	private long gameruntime;
	private Date gameescapedate;
	private String endRuntime;
	
	public Rank() {}

	public Rank(int playno, String gameId, String userprofilerenamedfile, long gameruntime, Date gameescapedate) {
		this.playno = playno;
		this.gameId = gameId;
		this.userprofilerenamedfile = userprofilerenamedfile;
		this.gameruntime = gameruntime;
		this.gameescapedate = gameescapedate;
	}

	public Rank(String gameId, long gameruntime, String userprofilerenamedfile, Date gameescapedate, String endRuntime) {
		this.gameId = gameId;
		this.gameruntime = gameruntime;
		this.userprofilerenamedfile = userprofilerenamedfile;
		this.gameescapedate = gameescapedate;
		this.setEndRuntime(endRuntime);
	}

	public int getPlayno() {
		return playno;
	}

	public void setPlayno(int playno) {
		this.playno = playno;
	}

	public String getGameId() {
		return gameId;
	}

	public void setGameId(String gameId) {
		this.gameId = gameId;
	}

	public String getUserprofilerenamedfile() {
		return userprofilerenamedfile;
	}

	public void setUserprofilerenamedfile(String userprofilerenamedfile) {
		this.userprofilerenamedfile = userprofilerenamedfile;
	}

	public long getGameruntime() {
		return gameruntime;
	}

	public void setGameruntime(long gameruntime) {
		this.gameruntime = gameruntime;
	}

	public Date getGameescapedate() {
		return gameescapedate;
	}

	public void setGameescapedate(Date gameescapedate) {
		this.gameescapedate = gameescapedate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "게임 아이디=" + gameId + ", 유저 프로필 이미지(renamed)=" + userprofilerenamedfile
				+ ", 게임 런타임(밀리초)=" + gameruntime + ", 게임 클리어 날짜=" + gameescapedate + ", 게임 런타임(시간 변환)=" + endRuntime + "\n";
	}

	public String getEndRuntime() {
		return endRuntime;
	}

	public void setEndRuntime(String endRuntime) {
		this.endRuntime = endRuntime;
	}
}