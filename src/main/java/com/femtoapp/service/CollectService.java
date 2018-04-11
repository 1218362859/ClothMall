package com.femtoapp.service;



import java.util.List;

import org.apache.ibatis.annotations.Param;

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
	public PageInfo<CollectCustom> findCollectSellerListqueryByPage( String uid, Integer pageNo, Integer pageSize)throws Exception;
	
	//uid �û�id                      p_type  photo���type                       co_type           collect���е�type   
	public PageInfo<Collect> findCollectSellerListResultMap( String uid,String p_type,String co_type, Integer pageNo, Integer pageSize)throws Exception;
	
	
	
	//uid �û�id              co_type  collect���type
		public PageInfo<Collect> findCollectCategoryListResultMap( String uid, String co_type, Integer pageNo, Integer pageSize)throws Exception;
		
}
