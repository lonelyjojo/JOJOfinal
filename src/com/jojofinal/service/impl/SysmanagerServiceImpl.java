package com.jojofinal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jojofinal.mapper.MsgMapper;
import com.jojofinal.mapper.RestaurantMapper;
import com.jojofinal.mapper.SysmanagerMapper;
import com.jojofinal.mapper.UserMapper;
import com.jojofinal.po.Sysmanager;
import com.jojofinal.service.SysmanagerService;

@Service
public class SysmanagerServiceImpl implements SysmanagerService {

	@Autowired
	private RestaurantMapper rmap;
	@Autowired
	private UserMapper um;
	@Autowired
	private MsgMapper mp;

	@Autowired	
	private SysmanagerMapper sm;
	
	@Override
	public void deleteUserById(int uid) {
		um.deleteUserById(uid);
	}

	@Override
	public void deleteMsgById(int mid) {
		// TODO Auto-generated method stub
		mp.deleteMsgById(mid);
	}

	@Override
	public void deleteRes(int rid) {
		// TODO Auto-generated method stub
		rmap.deleteRes(rid);
	}

	@Override
	public List<Sysmanager> findChecksys(Sysmanager sys) {
		// TODO Auto-generated method stub
		return sm.checksys(sys);
	}

}
