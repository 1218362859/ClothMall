package com.femtoapp.service;


import com.femtoapp.pojo.CategoryCustom;
import com.femtoapp.pojo.Goods;
import com.femtoapp.pojo.GoodsCustom;
import com.femtoapp.pojo.GoodsQueryVo;
import com.github.pagehelper.PageInfo;

public interface GoodsService {

	public Goods findObjectByid(String   id) throws Exception;
	public void insertObject(CategoryCustom categoryCustom) throws Exception;
	public void updateObject(Goods goods) throws Exception;
	public void deleteObject(String id)throws Exception;
	public PageInfo<GoodsCustom> queryByPage(GoodsQueryVo goodsQueryVo, Integer pageNo, Integer pageSize)throws Exception;
}
