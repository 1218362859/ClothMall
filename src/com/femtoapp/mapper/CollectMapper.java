package com.femtoapp.mapper;

import java.util.List;

import com.femtoapp.pojo.Collect;
import com.femtoapp.pojo.CollectCustom;
import com.femtoapp.pojo.CollectQueryVo;


public interface CollectMapper {
	public Collect findObjectByid(String   id) throws Exception;
	public void insertObject(Collect collect) throws Exception;
	public List<CollectCustom> findObjectList(CollectQueryVo collectQueryVo) throws Exception;
	public void updateObject(Collect collect) throws Exception;
	public void deleteObject(String id)throws Exception;
}
