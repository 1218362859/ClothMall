package com.femtoapp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.femtoapp.exception.ClothMallException;
import com.femtoapp.mapper.OrdersMapper;
import com.femtoapp.pojo.Orders;
import com.femtoapp.pojo.OrdersCustom;
import com.femtoapp.pojo.OrdersQueryVo;
import com.femtoapp.service.OrdersService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
@Service
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	private OrdersMapper ordersMapper;

	@Override
	public Orders findObjectByid(String id) throws Exception {
		// TODO Auto-generated method stub
		Orders orders = ordersMapper.findObjectByid(id);
		if(orders==null) {
			throw new ClothMallException("û���ҵ�");
		}
		return orders;
	}

	@Override
	public void insertObject(Orders orders) throws Exception {
		// TODO Auto-generated method stub
		try {
			ordersMapper.insertObject(orders);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("���ʧ��");
		}
	}

	@Override
	public void updateObject(Orders orders) throws Exception {
		// TODO Auto-generated method stub
		try {
			ordersMapper.updateObject(orders);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("�޸�ʧ��");
		}
	}

	@Override
	public void deleteObject(String id) throws Exception {
		// TODO Auto-generated method stub
		try {
			ordersMapper.deleteObject(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new ClothMallException("ɾ��ʧ��");
		}
	}

	@Override
	public PageInfo<OrdersCustom> queryByPage(OrdersQueryVo ordersQueryVo, Integer pageNo, Integer pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		pageNo = pageNo == null?1:pageNo;
	    pageSize = pageSize == null?10:pageSize;
	    PageHelper.startPage(pageNo, pageSize);
	    List<OrdersCustom> list = ordersMapper.findObjectList(ordersQueryVo);
	    //��PageInfo�Խ�����а�װ
	    PageInfo<OrdersCustom> page = new PageInfo<OrdersCustom>(list);
		return page;
	}


	


}
