package com.femtoapp.mapper;

import java.util.List;

import com.femtoapp.pojo.Evaluate;
import com.femtoapp.pojo.EvaluateCustom;
import com.femtoapp.pojo.EvaluateQueryVo;


public interface EvaluateMapper {
	public Evaluate findObjectByid(String   id) throws Exception;
	public void insertObject(Evaluate cvaluate) throws Exception;
	public List<EvaluateCustom> findObjectList(EvaluateQueryVo cvaluateQueryVo) throws Exception;
	public void updateObject(Evaluate cvaluate) throws Exception;
	public void deleteObject(String id)throws Exception;
}
