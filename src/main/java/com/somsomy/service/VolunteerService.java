package com.somsomy.service;

import java.util.List;

import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.PageBean;
import com.somsomy.domain.VolunteerBean;
import com.somsomy.domain.VolunteerReplyBean;

public interface VolunteerService {

	Integer getVolunteerCount();

	List<VolunteerBean> getVolunteerList(PageBean pb);

	void writeVolunteer(VolunteerBean vb);

	void updateReadcount(int num);

	List<VolunteerReplyBean> getVolunteerReplyList(FindPageBean pb);

	int getVolunteerReplyCount(int num);

	VolunteerBean getVolunteer(int num);

	void updateVolunteer(VolunteerBean vb);

	void deleteVolunteer(int num);

}
