package com.femtoapp.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.femtoapp.exception.ClothMallException;
import com.femtoapp.mapper.AddressMapper;
import com.femtoapp.pojo.Address;
import com.femtoapp.pojo.AddressCustom;
import com.femtoapp.pojo.AddressQueryVo;
import com.femtoapp.service.AddressService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service("addressServiceImpl")
public class AddressServiceImpl implements AddressService {

	@Autowired
	private AddressMapper addressMapper;

	@Override
	public Address findObjectByid(String id) throws Exception {
		// TODO Auto-generated method stub
		Address address = addressMapper.findObjectByid(id);
		if(address==null) {
			throw new ClothMallException("没有找到");
		}
		return address;
	}

	@Override
	public void insertObject(Address address) throws Exception {
		// TODO Auto-generated method stub
		try {
			addressMapper.insertObject(address);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("添加失败");
		}
	}

	@Override
	public void updateObject(Address address) throws Exception {
		// TODO Auto-generated method stub
		try {
			addressMapper.updateObject(address);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("修改失败");
		}
	}

	@Override
	public void deleteObject(String id) throws Exception {
		// TODO Auto-generated method stub
		try {
			addressMapper.deleteObject(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("删除失败");
		}
	}

	@Override
	public PageInfo<AddressCustom> queryByPage(AddressQueryVo addressQueryVo, Integer pageNo, Integer pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<AddressCustom> list = addressMapper.findObjectList(addressQueryVo);
	    //用PageInfo对结果进行包装
	    PageInfo<AddressCustom> page = new PageInfo<AddressCustom>(list);
		return page;
	}


	


}
