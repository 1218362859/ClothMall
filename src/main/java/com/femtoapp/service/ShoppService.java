package com.femtoapp.service;


import com.femtoapp.pojo.Shopp;
import com.femtoapp.pojo.ShoppCustom;
import com.femtoapp.pojo.ShoppQueryVo;
import com.github.pagehelper.PageInfo;

public interface ShoppService {

	public Shopp findObjectByid(String   id) throws Exception;
	public void insertObject(Shopp shopp) throws Exception;
	public void updateObject(Shopp shopp) throws Exception;
	public void deleteObject(String id)throws Exception;
	public PageInfo<ShoppCustom> queryByPage(ShoppQueryVo shoppQueryVo, Integer pageNo, Integer pageSize)throws Exception;
}
