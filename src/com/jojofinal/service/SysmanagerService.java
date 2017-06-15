package com.jojofinal.service;

import java.util.List;

import com.jojofinal.po.Sysmanager;

public interface SysmanagerService {
	public void deleteUserById(int uid);
	public void deleteMsgById(int mid);
	public void deleteRes(int rid);
	public List<Sysmanager> findChecksys(Sysmanager sys);
}
