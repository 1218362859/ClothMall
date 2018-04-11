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
	
	//uid �û�id                      p_type  photo���type                       co_type           collect���е�type   
	public List<Collect> findCollectSellerListResultMap(@Param("uid") String uid,@Param("p_type") String p_type,@Param("co_type") String co_type)throws Exception;
	
	//uid �û�id              co_type  collect���type
	public List<Collect> findCollectCategoryListResultMap(@Param("uid") String uid,@Param("co_type") String co_type)throws Exception;
	
	
}
