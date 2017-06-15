package com.jojofinal.mapper;

import java.util.List;

import com.jojofinal.po.Msg;

public interface MsgMapper {
	public int addMsg(Msg msg);

	public void deleteMsgById(int mid);

	public List<Msg> findMsgByDish(int did);
	
	
}
