package com.femtoapp.service;


import com.femtoapp.pojo.Evaluate;
import com.femtoapp.pojo.EvaluateCustom;
import com.femtoapp.pojo.EvaluateQueryVo;
import com.github.pagehelper.PageInfo;

public interface EvaluateService {

	public Evaluate findObjectByid(String   id) throws Exception;
	public void insertObject(Evaluate evaluate) throws Exception;
	public void updateObject(Evaluate evaluate) throws Exception;
	public void deleteObject(String id)throws Exception;
	public PageInfo<EvaluateCustom> queryByPage(EvaluateQueryVo evaluateQueryVo, Integer pageNo, Integer pageSize)throws Exception;
}
