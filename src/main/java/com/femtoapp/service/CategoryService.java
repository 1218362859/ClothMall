package com.femtoapp.service;


import com.femtoapp.pojo.Category;
import com.femtoapp.pojo.CategoryCustom;
import com.femtoapp.pojo.CategoryQueryVo;
import com.github.pagehelper.PageInfo;

public interface CategoryService {

	public CategoryCustom findObjectByid(String   id) throws Exception;
	public void insertObject(CategoryCustom categoryCustom) throws Exception;
	public void updateObject(CategoryCustom categoryCustom) throws Exception;
	public void deleteObject(String id)throws Exception;
	public PageInfo<CategoryCustom> queryByPage(CategoryQueryVo categoryQueryVo, Integer pageNo, Integer pageSize)throws Exception;
}
