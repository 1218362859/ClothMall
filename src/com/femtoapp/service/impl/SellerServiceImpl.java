package com.femtoapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.femtoapp.exception.ClothMallException;
import com.femtoapp.mapper.SellerMapper;
import com.femtoapp.pojo.Seller;
import com.femtoapp.pojo.SellerCustom;
import com.femtoapp.pojo.SellerQueryVo;
import com.femtoapp.service.SellerService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class SellerServiceImpl implements SellerService {

	@Autowired
	private SellerMapper sellerMapper;

	@Override
	public Seller findObjectByid(String id) throws Exception {
		// TODO Auto-generated method stub
		return sellerMapper.findObjectByid(id);
	}

	@Override
	public void insertObject(Seller seller) throws Exception {
		// TODO Auto-generated method stub
		sellerMapper.insertObject(seller);
	}

	@Override
	public void updateObject(Seller seller) throws Exception {
		// TODO Auto-generated method stub
		sellerMapper.updateObject(seller);
	}

	@Override
	public void deleteObject(String id) throws Exception {
		// TODO Auto-generated method stub
		sellerMapper.deleteObject(id);
	}

	@Override
	public PageInfo<SellerCustom> queryByPage(SellerQueryVo sellerQueryVo, Integer pageNo, Integer pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<SellerCustom> list = sellerMapper.findObjectList(sellerQueryVo);
	    //用PageInfo对结果进行包装
	    PageInfo<SellerCustom> page = new PageInfo<SellerCustom>(list);
	    
	    
		return page;
	}

	@Override
	public PageInfo<Seller> findSeller_Goods_CategoryResultMap(SellerQueryVo sellerQueryVo, Integer pageNo,
			Integer pageSize) throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<Seller> list = sellerMapper.findSeller_Goods_CategoryResultMap();
	    
	    PageInfo<Seller> page = new PageInfo<Seller>(list);
	    
	    
		return page;
	}

	@Override
	public Seller findSellerByUsername(String username)throws Exception {
		// TODO Auto-generated method stub
		Seller seller = sellerMapper.findSellerByUsername(username);
		if(seller==null) {
			throw new ClothMallException("沒有找到该用户");
		}
		return seller;
	}

	@Override
	public Seller findSellerByPhonenum(String phonenum) throws Exception {
		// TODO Auto-generated method stub
		Seller seller =	sellerMapper.findSellerByPhonenum(phonenum);
		if(seller==null) {
			throw new ClothMallException("沒有找到该用户");
		}
		return seller;
	}


	


}
