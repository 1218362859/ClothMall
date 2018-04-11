package com.femtoapp.mapper;

import java.util.List;

import com.femtoapp.pojo.Shopp;
import com.femtoapp.pojo.ShoppCustom;
import com.femtoapp.pojo.ShoppQueryVo;


public interface ShoppMapper {
	public Shopp findObjectByid(String   id) throws Exception;
	public void insertObject(Shopp shopp) throws Exception;
	public List<ShoppCustom> findObjectList(ShoppQueryVo shoppQueryVo) throws Exception;
	public void updateObject(Shopp shopp) throws Exception;
	public void deleteObject(String id)throws Exception;
}
