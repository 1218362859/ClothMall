package com.femtoapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.femtoapp.pojo.Collect;
import com.femtoapp.pojo.CollectCustom;
import com.femtoapp.pojo.CollectQueryVo;


public interface CollectMapper {
	public Collect findObjectByid(String   coid) throws Exception;
	public void insertObject(Collect collect) throws Exception;
	public List<CollectCustom> findObjectList(CollectQueryVo collectQueryVo) throws Exception;
	public void updateObject(Collect collect) throws Exception;
	public void deleteObject(String coid)throws Exception;
	public List<CollectCustom> findCollectSellerList(@Param("uid") String uid)throws Exception;
	
	//uid 用户id                      p_type  photo表的type                       co_type           collect表中的type   
	public List<Collect> findCollectSellerListResultMap(@Param("uid") String uid,@Param("p_type") String p_type,@Param("co_type") String co_type)throws Exception;
	
	//uid 用户id              co_type  collect表的type
	public List<Collect> findCollectCategoryListResultMap(@Param("uid") String uid,@Param("co_type") String co_type)throws Exception;
	
	
}
