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
	
	public Rank() {}

	public Rank(int playno, String gameId, String userprofilerenamedfile, long gameruntime, Date gameescapedate) {
		this.playno = playno;
		this.gameId = gameId;
		this.userprofilerenamedfile = userprofilerenamedfile;
		this.gameruntime = gameruntime;
		this.gameescapedate = gameescapedate;
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
		return "Rank [playno=" + playno + ", gameId=" + gameId + ", userprofilerenamedfile=" + userprofilerenamedfile
				+ ", gameruntime=" + gameruntime + ", gameescapedate=" + gameescapedate + "]";
	}
}