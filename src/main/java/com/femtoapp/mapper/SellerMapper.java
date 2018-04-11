package com.femtoapp.mapper;

import java.util.List;

import com.femtoapp.pojo.Goods;
import com.femtoapp.pojo.Seller;
import com.femtoapp.pojo.SellerCustom;
import com.femtoapp.pojo.SellerQueryVo;


public interface SellerMapper {
	public Seller findObjectByid(String   id) throws Exception;
	public void insertObject(Seller seller) throws Exception;
	public List<SellerCustom> findObjectList(SellerQueryVo sellerQueryVo) throws Exception;
	public void updateObject(Seller seller) throws Exception;
	public void deleteObject(String id)throws Exception;
	
	//查找出卖家的商品及商品详细信息
	public List<Seller> findSeller_Goods_CategoryResultMap()throws Exception;
	public Seller findSellerByUsername(String username)throws Exception;
	public Seller findSellerByPhonenum(String phonenum)throws Exception;
}
