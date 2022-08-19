package com.dorothy.member.order.customOrder.dao;

import java.util.List;

import com.dorothy.member.order.customOrder.vo.CustomOrderBoardVO;

public interface CustomOrderBoardDao {
	public List<CustomOrderBoardVO> customOrderList(CustomOrderBoardVO cobvo);
	public int customOrderInsert(CustomOrderBoardVO cobvo);
	public int customOrderListCnt(CustomOrderBoardVO cobvo);
	public CustomOrderBoardVO customOrderDetail(CustomOrderBoardVO cobvo);
	public int customOrderDelete(CustomOrderBoardVO cobvo) throws Exception;
	public CustomOrderBoardVO customOrderupdateForm(CustomOrderBoardVO cobvo);
	public int customOrderUpdate(CustomOrderBoardVO cobvo) throws Exception;
	public int customOrderPriceupdate(CustomOrderBoardVO cobvo);
	
	

	
}
