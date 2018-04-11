package com.femtoapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.femtoapp.exception.ClothMallException;
import com.femtoapp.mapper.UserMapper;
import com.femtoapp.pojo.User;
import com.femtoapp.pojo.UserCustom;
import com.femtoapp.pojo.UserQueryVo;
import com.femtoapp.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public User findObjectByid(String id) throws Exception {
		// TODO Auto-generated method stub
		
		User user = userMapper.findObjectByid(id);
		if((user==null)){
			throw new ClothMallException("用户未找到");
			
		}
		
		return user;
	}

	@Override
	public void insertObject(User user) throws Exception {
		// TODO Auto-generated method stub
		try {
			userMapper.insertObject(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("注册失败");
		}
	}

	@Override
	public void updateObject(User user) throws Exception {
		// TODO Auto-generated method stub
		try {
			userMapper.updateObject(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("修改失败");
		}
	}

	@Override
	public void deleteObject(String id) throws Exception {
		// TODO Auto-generated method stub
		try {
			userMapper.deleteObject(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("修改失败");
		}
	}

	@Override
	public PageInfo<UserCustom> queryByPage(UserQueryVo userQueryVo, Integer pageNo, Integer pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<UserCustom> list = userMapper.findObjectList(userQueryVo);
	    //用PageInfo对结果进行包装
	    PageInfo<UserCustom> page = new PageInfo<UserCustom>(list);
		return page;
	}

	@Override
	public User findUserByUsername(String username) throws Exception {
		// TODO Auto-generated method stub
		User user = userMapper.findUserByUsername(username);
		if(user==null) {
			throw new ClothMallException("用户未找到");
		}
		return user;
	}

	@Override
	public User findUserByPhonenum(String phonenum) throws Exception {
		// TODO Auto-generated method stub
		User user = userMapper.findUserByPhonenum(phonenum);
		if(user==null) {
			
			throw new ClothMallException("该号码未注册");
		}
		return user;
	}


	


}
