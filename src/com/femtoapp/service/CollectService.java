package com.femtoapp.service;


import com.femtoapp.pojo.Collect;
import com.femtoapp.pojo.CollectCustom;
import com.femtoapp.pojo.CollectQueryVo;
import com.github.pagehelper.PageInfo;

public interface CollectService {

	public Collect findObjectByid(String   id) throws Exception;
	public void insertObject(Collect collect) throws Exception;
	public void updateObject(Collect collect) throws Exception;
	public void deleteObject(String id)throws Exception;
	public PageInfo<CollectCustom> queryByPage(CollectQueryVo collectQueryVo, Integer pageNo, Integer pageSize)throws Exception;
}
