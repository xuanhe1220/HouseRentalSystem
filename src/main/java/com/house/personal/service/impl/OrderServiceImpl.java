package com.house.personal.service.impl;

import java.util.Date;
import java.util.List;

import com.house.personal.dao.OrderMapper;
import com.house.personal.entity.Order;
import com.house.personal.entity.Page;
import com.house.personal.entity.UserOrder;
import com.house.personal.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private OrderMapper mapper;
	
	@Override
	public int addOrder(Order order) {
		return mapper.addOrder(order);
	}

	@Override
	public List<UserOrder> findAllOrder(Page page) {return mapper.findAllOrder(page);}

	@Override
	public int getOrderCount(int uID) {
		return mapper.getOrderCount(uID);
	}

	@Override
	public int deleteOrder(int oID) {
		return mapper.deleteOrder(oID);
	}

	@Override
	public int getOrderCountByDate(Date orderTime){return mapper.getOrderCountByDate(orderTime);}

}
