package com.somsomy.service;

import java.sql.Timestamp;
import java.util.regex.Pattern;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.somsomy.dao.MemberDAO;
import com.somsomy.domain.MemberBean;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Inject
	private MemberDAO memberDAO;

	@Override
	public MemberBean userCheck(MemberBean mb) {
		
		return memberDAO.userCheck(mb);
	}

	@Override
	public MemberBean getMember(String id) {
		return memberDAO.getMember(id);
	}

	@Override
	public int idCheck(String id) {
		
		String lengthRegex="[a-z0-9_]{5,20}";
		String engLowerRegex="[a-z]";
		String numRegex="[0-9]";
		String specRegex="[_]";
		
		int check = 0;
		
		if(Pattern.matches(lengthRegex, id)) {
			check += Pattern.compile(engLowerRegex).matcher(id).find() ? 1 : 0;
			check += Pattern.compile(numRegex).matcher(id).find() ? 1 : 0;
			check += Pattern.compile(specRegex).matcher(id).find() ? 1 : 0;
			
		} else {
			check = 0;
		}
			
		return check;
	}

	@Override
	public MemberBean findByNick(MemberBean mb) {
		return memberDAO.findByNick(mb);
	}

	@Override
	public int nickCheck(String nick) {
		String lengthRegex="[A-za-z0-9가-힣]{1,10}";
		String engUpperRegex="[A-Z]";
		String engLowerRegex="[a-z]";
		String numRegex="[0-9]";
		String korean="[가-힣]";
		
		int check = 0;
		
		if(Pattern.matches(lengthRegex, nick)) {
			check += Pattern.compile(engUpperRegex).matcher(nick).find() ? 1 : 0;
			check += Pattern.compile(engLowerRegex).matcher(nick).find() ? 1 : 0;
			check += Pattern.compile(numRegex).matcher(nick).find() ? 1 : 0;
			check += Pattern.compile(korean).matcher(nick).find() ? 1 : 0;

		} else {
			check = 0;
		}
			
		return check;
	}
	
	@Override
	public int passCheck(String pass) {
		String lengthRegex="[A-Za-z0-9!@#]{8,16}";
		String engUpperRegex="[A-Z]";
		String engLowerRegex="[a-z]";
		String numRegex="[0-9]";
		String specRegex="[!@#]";
		
		int check = 0;
		
		if(Pattern.matches(lengthRegex, pass)) {
			check += Pattern.compile(engUpperRegex).matcher(pass).find() ? 1 : 0;
			check += Pattern.compile(engLowerRegex).matcher(pass).find() ? 1 : 0;
			check += Pattern.compile(numRegex).matcher(pass).find() ? 1 : 0;
			check += Pattern.compile(specRegex).matcher(pass).find() ? 1 : 0;
			
		} else {
			check = 0;
		}
			
		return check;
	}

	@Override
	public void join(MemberBean mb) {
		String email = mb.getEmailId() + "@" + mb.getEmail();
		String phone = mb.getPhone1() + mb.getPhone2() + mb.getPhone3();
		String address = mb.getAddress();
		
		mb.setEmail(email);
		mb.setPhone(phone);
		mb.setAddress(address);
		mb.setDate(new Timestamp(System.currentTimeMillis()));
		
		memberDAO.join(mb);
	}

	@Override
	public void memberUpdate(MemberBean mb) {
		memberDAO.memberUpdate(mb);
	}



}
