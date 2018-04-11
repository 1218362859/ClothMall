package com.femtoapp.mapper;

import java.util.List;

import com.femtoapp.pojo.Address;
import com.femtoapp.pojo.AddressCustom;
import com.femtoapp.pojo.AddressQueryVo;


public interface AddressMapper {
	public Address findObjectByid(String   id) throws Exception;
	public void insertObject(Address address) throws Exception;
	public List<AddressCustom> findObjectList(AddressQueryVo addressQueryVo) throws Exception;
	public void updateObject(Address address) throws Exception;
	public void deleteObject(String id)throws Exception;
}
