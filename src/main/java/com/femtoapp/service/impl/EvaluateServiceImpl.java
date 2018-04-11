package com.femtoapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.femtoapp.exception.ClothMallException;
import com.femtoapp.mapper.EvaluateMapper;
import com.femtoapp.pojo.Evaluate;
import com.femtoapp.pojo.EvaluateCustom;
import com.femtoapp.pojo.EvaluateQueryVo;
import com.femtoapp.service.EvaluateService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class EvaluateServiceImpl implements EvaluateService {

	@Autowired
	private EvaluateMapper evaluateMapper;

	@Override
	public Evaluate findObjectByid(String id) throws Exception {
		// TODO Auto-generated method stub
		Evaluate evaluate = evaluateMapper.findObjectByid(id);
		if(evaluate==null) {
			throw new ClothMallException("没有找到");
		}
		return evaluate;
	}

	@Override
	public void insertObject(Evaluate evaluate) throws Exception {
		// TODO Auto-generated method stub
		try {
			evaluateMapper.insertObject(evaluate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("添加失败");
		}
	}

	@Override
	public void updateObject(Evaluate evaluate) throws Exception {
		// TODO Auto-generated method stub
		try {
			evaluateMapper.updateObject(evaluate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("修改失败");
		}
	}

	@Override
	public void deleteObject(String id) throws Exception {
		// TODO Auto-generated method stub
		try {
			evaluateMapper.deleteObject(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("删除失败");
		}
	}

	@Override
	public PageInfo<EvaluateCustom> queryByPage(EvaluateQueryVo evaluateQueryVo, Integer pageNo, Integer pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<EvaluateCustom> list = evaluateMapper.findObjectList(evaluateQueryVo);
	    //用PageInfo对结果进行包装
	    PageInfo<EvaluateCustom> page = new PageInfo<EvaluateCustom>(list);
		return page;
	}


	


}
