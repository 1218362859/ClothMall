package com.femtoapp.service;


import com.femtoapp.pojo.User;
import com.femtoapp.pojo.UserCustom;
import com.femtoapp.pojo.UserQueryVo;
import com.github.pagehelper.PageInfo;

public interface UserService {

	public User findObjectByid(String   id) throws Exception;
	public void insertObject(User user) throws Exception;
	public void updateObject(User user) throws Exception;
	public void deleteObject(String id)throws Exception;
	public PageInfo<UserCustom> queryByPage(UserQueryVo userQueryVo, Integer pageNo, Integer pageSize)throws Exception;
	public User findUserByUsername(String username)throws Exception;
	public User findUserByPhonenum(String phonenum)throws Exception;
}
