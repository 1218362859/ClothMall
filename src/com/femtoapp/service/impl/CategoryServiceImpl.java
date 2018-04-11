package com.femtoapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.femtoapp.exception.ClothMallException;
import com.femtoapp.mapper.CategoryMapper;
import com.femtoapp.pojo.Category;
import com.femtoapp.pojo.CategoryCustom;
import com.femtoapp.pojo.CategoryQueryVo;
import com.femtoapp.service.CategoryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryMapper categoryMapper;

	@Override
	public CategoryCustom findObjectByid(String id) throws Exception {
		// TODO Auto-generated method stub
		CategoryCustom custom = categoryMapper.findObjectByid(id);
		if(custom==null) {
			throw new ClothMallException("没有找到");
		}
		return custom;
	}

	@Override
	public void insertObject(CategoryCustom categoryCustom) throws Exception {
		// TODO Auto-generated method stub
		try {
			categoryMapper.insertObject(categoryCustom);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("添加失败");
		}
	}

	@Override
	public void updateObject(CategoryCustom categoryCustom) throws Exception {
		// TODO Auto-generated method stub
		try {
			categoryMapper.updateObject(categoryCustom);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("修改失败");
		}
	}

	@Override
	public void deleteObject(String id) throws Exception {
		// TODO Auto-generated method stub
		try {
			categoryMapper.deleteObject(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("删除失败");
		}
	}

	@Override
	public PageInfo<CategoryCustom> queryByPage(CategoryQueryVo categoryQueryVo, Integer pageNo, Integer pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<CategoryCustom> list = categoryMapper.findObjectList(categoryQueryVo);
	    //用PageInfo对结果进行包装
	    PageInfo<CategoryCustom> page = new PageInfo<CategoryCustom>(list);
		return page;
	}


	


}
