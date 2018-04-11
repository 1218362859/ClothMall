package com.femtoapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.femtoapp.exception.ClothMallException;
import com.femtoapp.mapper.GoodsMapper;
import com.femtoapp.pojo.CategoryCustom;
import com.femtoapp.pojo.Goods;
import com.femtoapp.pojo.GoodsCustom;
import com.femtoapp.pojo.GoodsQueryVo;
import com.femtoapp.service.GoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public Goods findObjectByid(String id) throws Exception {
		// TODO Auto-generated method stub
		Goods goods = goodsMapper.findObjectByid(id);
		if(goods==null)
			throw new ClothMallException("没有找到");
		return goods;
	}

	@Override
	public void insertObject(CategoryCustom categoryCustom) throws Exception {
		// TODO Auto-generated method stub
		try {
			goodsMapper.insertObject(categoryCustom);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("添加失败");
		}
	}

	@Override
	public void updateObject(Goods goods) throws Exception {
		// TODO Auto-generated method stub
		try {
			goodsMapper.updateObject(goods);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("修改失败");
		}
	}

	@Override
	public void deleteObject(String id) throws Exception {
		// TODO Auto-generated method stub
		try {
			goodsMapper.deleteObject(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("删除失败，请先删除类别信息");
		}
	}

	@Override
	public PageInfo<GoodsCustom> queryByPage(GoodsQueryVo goodsQueryVo, Integer pageNo, Integer pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<GoodsCustom> list = goodsMapper.findObjectList(goodsQueryVo);
	    if(list==null) {
	    	
	    	throw new ClothMallException("没有搜索到");
	    }
	    List newlist = removeDuplicate(list);
	    //用PageInfo对结果进行包装
	    PageInfo<GoodsCustom> page = new PageInfo<GoodsCustom>(newlist);
		return page;
	}


	public      List  removeDuplicate(List list)  {       
		  for  ( int  i  =   0 ; i  <  list.size()  -   1 ; i ++ )  {       
		      for  ( int  j  =  list.size()  -   1 ; j  >  i; j -- )  {       
		           if  (list.get(j).equals(list.get(i))||list.get(j)==(list.get(i)))  {       
		              list.remove(j);       
		            }        
		        }        
		      }        
		    return list;       
		}


}
