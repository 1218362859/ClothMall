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
		if (collect == null) {
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
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		List<CollectCustom> list = collectMapper.findObjectList(collectQueryVo);
		if (list == null) {
			throw new ClothMallException("没有收藏");
		}
		// 用PageInfo对结果进行包装
		PageInfo<CollectCustom> page = new PageInfo<CollectCustom>(list);
		return page;
	}

	@Override
	public PageInfo<CollectCustom> findCollectSellerListqueryByPage(String uid, Integer pageNo, Integer pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		List<CollectCustom> collectSellerList = collectMapper.findCollectSellerList(uid);
		if (collectSellerList == null) {
			throw new ClothMallException("您没有收藏公司哦");
		}

		// 用PageInfo对结果进行包装
		PageInfo<CollectCustom> page = new PageInfo<CollectCustom>(collectSellerList);
		return page;
	}

	@Override
	public PageInfo<Collect> findCollectSellerListResultMap(String uid,String p_type,String co_type, Integer pageNo, Integer pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		List<Collect> collectSellerList = collectMapper.findCollectSellerListResultMap(uid, p_type, co_type);
		//uid 用户id                      p_type  photo表的type                       co_type           collect表中的type   
		if (collectSellerList == null) {
			throw new ClothMallException("您没有收藏公司哦");
		}

		// 用PageInfo对结果进行包装
		PageInfo<Collect> page = new PageInfo<Collect>(collectSellerList);
		return page;
	}

	@Override
	public PageInfo<Collect> findCollectCategoryListResultMap(String uid, String co_type, Integer pageNo,
			Integer pageSize) throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		 List<Collect> list = collectMapper.findCollectCategoryListResultMap(uid, co_type);
		//uid 用户id                      p_type  photo表的type                       co_type           collect表中的type   
		if (list == null) {
			throw new ClothMallException("您没有收藏面料哦");
		}

		// 用PageInfo对结果进行包装
		PageInfo<Collect> page = new PageInfo<Collect>(list);
		return page;
	}

}
