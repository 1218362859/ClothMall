package com.femtoapp.mapper;

import java.util.List;

import com.femtoapp.pojo.Orders;
import com.femtoapp.pojo.OrdersCustom;
import com.femtoapp.pojo.OrdersQueryVo;


public interface OrdersMapper {
	public Orders findObjectByid(String   id) throws Exception;
	public void insertObject(Orders orders) throws Exception;
	public List<OrdersCustom> findObjectList(OrdersQueryVo ordersQueryVo) throws Exception;
	public void updateObject(Orders orders) throws Exception;
	public void deleteObject(String id)throws Exception;
}
