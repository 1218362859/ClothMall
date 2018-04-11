package com.femtoapp.mapper;

import java.util.List;

import com.femtoapp.pojo.User;
import com.femtoapp.pojo.UserCustom;
import com.femtoapp.pojo.UserQueryVo;


public interface UserMapper {
	public User findObjectByid(String   id) throws Exception;
	public void insertObject(User user) throws Exception;
	public List<UserCustom> findObjectList(UserQueryVo userQueryVo) throws Exception;
	public void updateObject(User user) throws Exception;
	public void deleteObject(String id)throws Exception;
	
	
	public User findUserByUsername(String username)throws Exception;
	public User findUserByPhonenum(String phonenum)throws Exception;
}
