package com.femtoapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.femtoapp.mapper.ShoppMapper;
import com.femtoapp.pojo.Shopp;
import com.femtoapp.pojo.ShoppCustom;
import com.femtoapp.pojo.ShoppQueryVo;
import com.femtoapp.service.ShoppService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class ShoppServiceImpl implements ShoppService {

	@Autowired
	private ShoppMapper shoppMapper;

	@Override
	public Shopp findObjectByid(String id) throws Exception {
		// TODO Auto-generated method stub
		return shoppMapper.findObjectByid(id);
	}

	@Override
	public void insertObject(Shopp shopp) throws Exception {
		// TODO Auto-generated method stub
		shoppMapper.insertObject(shopp);
	}

	@Override
	public void updateObject(Shopp shopp) throws Exception {
		// TODO Auto-generated method stub
		shoppMapper.updateObject(shopp);
	}

	@Override
	public void deleteObject(String id) throws Exception {
		// TODO Auto-generated method stub
		shoppMapper.deleteObject(id);
	}

	@Override
	public PageInfo<ShoppCustom> queryByPage(ShoppQueryVo shoppQueryVo, Integer pageNo, Integer pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<ShoppCustom> list = shoppMapper.findObjectList(shoppQueryVo);
	    //用PageInfo对结果进行包装
	    PageInfo<ShoppCustom> page = new PageInfo<ShoppCustom>(list);
		return page;
	}


	


}
