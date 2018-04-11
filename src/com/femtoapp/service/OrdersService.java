package com.femtoapp.service;


import com.femtoapp.pojo.Orders;
import com.femtoapp.pojo.OrdersCustom;
import com.femtoapp.pojo.OrdersQueryVo;
import com.github.pagehelper.PageInfo;

public interface OrdersService {

	public Orders findObjectByid(String   id) throws Exception;
	public void insertObject(Orders orders) throws Exception;
	public void updateObject(Orders orders) throws Exception;
	public void deleteObject(String id)throws Exception;
	public PageInfo<OrdersCustom> queryByPage(OrdersQueryVo ordersQueryVo, Integer pageNo, Integer pageSize)throws Exception;
}
