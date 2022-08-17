package com.dorothy.member.order.orderInfo.dao;

import com.dorothy.member.payment.vo.OrderDTO;

public interface OrderInfoDao {
	public int orderInsert(OrderDTO order);
}
