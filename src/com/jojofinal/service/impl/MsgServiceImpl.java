package com.jojofinal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jojofinal.mapper.MsgMapper;
import com.jojofinal.po.Msg;
import com.jojofinal.service.MsgService;

 @Service
public class MsgServiceImpl implements MsgService {
    
	 @Autowired
	private MsgMapper mp;
	
	@Override
	public int addMsg(Msg msg) {
		return mp.addMsg(msg);
		
	}

	@Override
	public void deleteMsgById(int mid) {
		// TODO Auto-generated method stub
		mp.deleteMsgById(mid);
	}

	@Override
	public List<Msg> findMsgByDish(int did) {
		// TODO Auto-generated method stub
		return mp.findMsgByDish(did);
	}

}
