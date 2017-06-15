package com.jojofinal.service;

import java.util.List;

import com.jojofinal.po.Msg;

public interface MsgService {
	public int addMsg(Msg msg);

	public void deleteMsgById(int mid);

	public List<Msg> findMsgByDish(int did);
}
