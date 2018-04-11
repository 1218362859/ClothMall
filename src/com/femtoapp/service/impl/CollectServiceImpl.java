package com.femtoapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.femtoapp.exception.ClothMallException;
import com.femtoapp.mapper.CollectMapper;
import com.femtoapp.pojo.Collect;
import com.femtoapp.pojo.CollectCustom;
import com.femtoapp.pojo.CollectQueryVo;
import com.femtoapp.service.CollectService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class CollectServiceImpl implements CollectService {

	@Autowired
	private CollectMapper collectMapper;

	@Override
	public Collect findObjectByid(String id) throws Exception {
		// TODO Auto-generated method stub
		Collect collect = collectMapper.findObjectByid(id);
		if(collect==null) {
			throw new ClothMallException("没有找到");
		}
		return collect;
	}

	@Override
	public void insertObject(Collect collect) throws Exception {
		// TODO Auto-generated method stub
		try {
			collectMapper.insertObject(collect);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("添加失败");
		}
	}

	@Override
	public void updateObject(Collect collect) throws Exception {
		// TODO Auto-generated method stub
		try {
			collectMapper.updateObject(collect);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("修改失败");
		}
	}

	@Override
	public void deleteObject(String id) throws Exception {
		// TODO Auto-generated method stub
		try {
			collectMapper.deleteObject(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("删除失败");
		}
	}

	@Override
	public PageInfo<CollectCustom> queryByPage(CollectQueryVo collectQueryVo, Integer pageNo, Integer pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<CollectCustom> list = collectMapper.findObjectList(collectQueryVo);
	    //用PageInfo对结果进行包装
	    PageInfo<CollectCustom> page = new PageInfo<CollectCustom>(list);
		return page;
	}


	


}
