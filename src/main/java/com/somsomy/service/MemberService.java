package com.somsomy.service;

import com.somsomy.domain.MemberBean;

public interface MemberService {

	MemberBean userCheck(MemberBean mb);
	MemberBean getMember(String id);
	int idCheck(String id);
	MemberBean findByNick(MemberBean mb);
	int nickCheck(String nick);
	int passCheck(String pass);
	void join(MemberBean mb);
	void memberUpdate(MemberBean mb);

}
