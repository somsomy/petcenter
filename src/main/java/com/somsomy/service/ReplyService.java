package com.somsomy.service;

import java.util.List;

import com.somsomy.domain.FindPageBean;
import com.somsomy.domain.ReplyBean;

public interface ReplyService {

	void updateReply(ReplyBean rb);

	List<ReplyBean> getReplyList(FindPageBean pb);

	void writeReply(ReplyBean rb);

	void deleteReply(ReplyBean rb);

	void rewriteReply(ReplyBean rb);

}
