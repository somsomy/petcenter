package com.somsomy.dao;

import com.somsomy.domain.MemberBean;

public interface MemberDAO {
	MemberBean userCheck(MemberBean mb);
	MemberBean getMember(String id);
	MemberBean findByNick(MemberBean mb);
	void join(MemberBean mb);
	void memberUpdate(MemberBean mb);
}
