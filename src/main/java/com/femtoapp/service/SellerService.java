package com.femtoapp.service;


import java.util.List;

import com.femtoapp.pojo.Goods;
import com.femtoapp.pojo.Seller;
import com.femtoapp.pojo.SellerCustom;
import com.femtoapp.pojo.SellerQueryVo;
import com.github.pagehelper.PageInfo;

public interface SellerService {

	public Seller findObjectByid(String   id) throws Exception;
	public void insertObject(Seller seller) throws Exception;
	public void updateObject(Seller seller) throws Exception;
	public void deleteObject(String id)throws Exception;
	public PageInfo<SellerCustom> queryByPage(SellerQueryVo sellerQueryVo, Integer pageNo, Integer pageSize)throws Exception;
	public PageInfo<Seller> findSeller_Goods_CategoryResultMap(SellerQueryVo sellerQueryVo, Integer pageNo, Integer pageSize)throws Exception;
	public Seller findSellerByUsername(String username)throws Exception;
	public Seller findSellerByPhonenum(String phonenum)throws Exception;
}
