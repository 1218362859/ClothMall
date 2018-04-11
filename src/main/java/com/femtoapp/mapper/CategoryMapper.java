package com.femtoapp.mapper;

import java.util.List;

import com.femtoapp.pojo.Category;
import com.femtoapp.pojo.CategoryCustom;
import com.femtoapp.pojo.CategoryQueryVo;


public interface CategoryMapper {
	public CategoryCustom findObjectByid(String   id) throws Exception;
	public void insertObject(CategoryCustom categoryCustom) throws Exception;
	public List<CategoryCustom> findObjectList(CategoryQueryVo categoryQueryVo) throws Exception;
	public void updateObject(CategoryCustom categoryCustom) throws Exception;
	public void deleteObject(String id)throws Exception;
}
