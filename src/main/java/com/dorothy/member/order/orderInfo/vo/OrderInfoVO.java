package com.dorothy.member.order.orderInfo.vo;

import lombok.Data;

@Data
public class OrderInfoVO {
	private int o_num;
	private String p_merchant_uid;
	private String g_name;
	private int g_size;
	private int gc_amount;
	private int g_price;
	private String o_status = "결제완료";
	
}
