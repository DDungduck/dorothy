package com.dorothy.member.order.customOrder.vo;

import org.springframework.web.multipart.MultipartFile;

import com.dorothy.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CustomOrderBoardVO extends CommonVO {
	private String m_id =""; // ���̵�
	private int c_num =0; // �۹�ȣ
	private String c_title =""; // ������
	private String c_inquiry =""; // ���ǻ���
	private String c_receiptdate =""; // ���ϴ� ������
	private String c_size =""; // ������ɼ�
	private String c_etc =""; // �߰�����ǰ
	private String c_dessert =""; // ����Ʈ����
	private String c_content =""; // �ֹ�����
	private int c_code =0; // ��ǰ�ڵ�
	private int c_price =0; // ��ǰ����
	private int c_amount =0; // ��ǰ����
	private int c_replycnt = 0; // Ŀ���� ��ǰ �ֹ� �Խ��� ���� ��� ����
	
	private MultipartFile file; // ���� ���ε带 ���� �ʵ� 
	private String c_file =""; // ������ ������ �̹��� ���� ��
	
}
