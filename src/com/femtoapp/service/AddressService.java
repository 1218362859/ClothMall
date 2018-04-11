package com.femtoapp.service;


import com.femtoapp.pojo.Address;
import com.femtoapp.pojo.AddressCustom;
import com.femtoapp.pojo.AddressQueryVo;
import com.github.pagehelper.PageInfo;

public interface AddressService {

	public Address findObjectByid(String   id) throws Exception;
	public void insertObject(Address address) throws Exception;
	public void updateObject(Address address) throws Exception;
	public void deleteObject(String id)throws Exception;
	public PageInfo<AddressCustom> queryByPage(AddressQueryVo addressQueryVo, Integer pageNo, Integer pageSize)throws Exception;
}
