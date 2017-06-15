package com.jojofinal.mapper;

import java.util.List;

import com.jojofinal.po.User;

public interface UserMapper {
	public void addUser(User u);

	public void updatepass(User u);
	
	public void deleteUserById(int uid);

	public List<User> findUser(int id);

	public List<User> isExist(User u);
	
	public List<User> nameisexist(String uname);
	
	public List<User> showall();
}
