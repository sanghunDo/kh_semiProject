package semi.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import semi.member.model.vo.Member;

public class AdminService {

	public List<Member> selectMemberList(int cPage, int numPerPage) {
		List<Member> memberList = new ArrayList<Member>();
		return memberList;
	}

	public int selectMemberCount() {
		int memberCount = 0;
		return memberCount;
	}

}
