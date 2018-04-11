package com.femtoapp.mapper;

import java.util.List;

import com.femtoapp.pojo.CategoryCustom;
import com.femtoapp.pojo.Goods;
import com.femtoapp.pojo.GoodsCustom;
import com.femtoapp.pojo.GoodsQueryVo;


public interface GoodsMapper {
	public Goods findObjectByid(String   id) throws Exception;
	public void insertObject(CategoryCustom categoryCustom) throws Exception;
	public List<GoodsCustom> findObjectList(GoodsQueryVo goodsQueryVo) throws Exception;
	public void updateObject(Goods goods) throws Exception;
	public void deleteObject(String id)throws Exception;
}
