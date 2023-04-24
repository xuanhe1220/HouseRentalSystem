package com.house.personal.service;

import java.util.Date;
import java.util.List;

import com.house.personal.entity.Order;
import com.house.personal.entity.Page;
import com.house.personal.entity.UserOrder;
import org.apache.ibatis.annotations.Mapper;



public interface IOrderService {
	/**
	 * 添加订单信息
	 * @param order
	 * @return
	 */
	public int addOrder(Order order);
	
	/**
	  * 查询单个用户所有订单信息
	  * @return
	  */
	 public List<UserOrder> findAllOrder(Page page);

	/**
	 * 查询单个用户所有订单
	 * @return
	 */
	 public int getOrderCount(int uID);

	 /**
	  * 删除用户订单
	  * @param oID
	  * @return
	  */
	 public int deleteOrder(int oID);

	/**
	 *
	 * @param orderTime
	 * @return
	 */
	public int getOrderCountByDate(Date orderTime);
}
