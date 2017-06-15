package com.jojofinal.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jojofinal.mapper.UserMapper;
import com.jojofinal.po.User;
import com.jojofinal.service.UserService;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
	private UserMapper um;
	
	
	@Override
	public void addUser(User u) {

		um.addUser(u);
	}

	@Override
	public void deleteUserById(int uid) {
		um.deleteUserById(uid);
	}

	@Override
	public List<User> findUser(int id) {
		
		return um.findUser(id);
	}

	@Override
	public List<User> findIsExist(User u) {
		return um.isExist(u);
	}

	@Override
	public List<User> findNameIsexist(String uname) {
		// TODO Auto-generated method stub
		return um.nameisexist(uname);
	}

	@Override
	public void updatepass(User u) {
		// TODO Auto-generated method stub
		um.updatepass(u);
	}

	@Override
	public List<User> showall() {
		// TODO Auto-generated method stub
		return um.showall();
	}

}
