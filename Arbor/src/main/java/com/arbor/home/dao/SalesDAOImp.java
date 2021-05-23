package com.arbor.home.dao;

import java.util.List;

import com.arbor.home.vo.PageSearchVO;
import com.arbor.home.vo.SalesVO;

public interface SalesDAOImp {
	public List<SalesVO> totalRecord(SalesVO salesVo);	//일자별 매출(날짜, 총매출액, 주문건수, 총배송비)
	public List<SalesVO> salesDetailInfo(String orderDate);	//주문상세정보
	public int totalRecord(PageSearchVO pageVo);

	public List<SalesVO> getDailySales(PageSearchVO pageVo);	//일자별 매출(날짜, 총매출액, 주문건수, 총배송비)

}