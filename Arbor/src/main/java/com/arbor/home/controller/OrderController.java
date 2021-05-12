package com.arbor.home.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.arbor.home.service.OrderServiceImp;
import com.arbor.home.vo.MemberVO;
import com.arbor.home.vo.OrderTblVO;
import com.arbor.home.vo.SubOrderVO;

@Controller
public class OrderController {
	@Inject
	OrderServiceImp orderService;
	
	@RequestMapping(value="/order", method = RequestMethod.POST)
	public ModelAndView orderPage(@Nullable
			@RequestParam(value="optnameArr", required=true) String[] optInfoArr,
			@RequestParam(value="priceArr", required=true) String[] priceArr,
			@RequestParam(value="pnoStr", required=true) String pnoStr,
			@RequestParam(value="quantityArr", required=true) String[] quantityArr,
			MemberVO memberVo, OrderTblVO orderVo, HttpSession session
			) {
		// 여긴 출력값 이런식으로 확인해서 쓰면 된다는 예시를 남긴고얌 지워도 댐!!! 
		for(int i=0; i<priceArr.length; i++) {
			System.out.println("optInfoArr?"+optInfoArr[i]);
			System.out.println("priceArr?"+priceArr[i]);
			System.out.println("quantityArr?"+quantityArr[i]);
		}
		
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		System.out.println("userid==>"+userid);
		if(userid == null || userid.equals("")) {
			mav.setViewName("admin/member/login");
		}else {
			orderVo.setUserid(userid);
			System.out.println("userid->"+userid + ", getUserid()->"+orderVo.getUserid());
			mav.addObject("memberVo", orderService.getMemberInfo(userid));
			mav.addObject("pointVo", orderService.getUserPoint(userid));
			mav.addObject("list", orderService.getUserCoupon(userid));
			mav.addObject("cpnCount", orderService.getCouponCount(userid));			
			mav.setViewName("client/order/order");
		}
		return mav;
	}
	
	@RequestMapping("/orderOk")
	public ModelAndView orderOk(
			OrderTblVO orderVo, String applyNum, HttpSession session,
			@RequestParam(value="pno",required=true) int[] pnoArr,
			@RequestParam(value="pname",required=true) String[] pnameArr,
			@RequestParam(value="quantity",required=true) int[] quantityArr,
			@RequestParam(value="subprice",required=true) int[] subpriceArr
			) {
		String userid = (String)session.getAttribute("logId");
		orderVo.setUserid(userid);
				
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		String today = sdf.format(now);
		String orderSeq = String.valueOf(orderService.getOrderSeq());
		orderVo.setOrderno(today+"-"+orderSeq); //당일날짜+시퀀스 형식으로 주문번호 생성 (ex.210511003)
		
		if(orderService.orderComplete(orderVo)>0) {

			System.out.println("=== SubOrderTblVO List ===");
			for(int i=0; i<pnoArr.length; i++) {
				SubOrderVO subVo = new SubOrderVO();
				subVo.setOrderno(orderVo.getOrderno());
				subVo.setPno(pnoArr[i]);
				subVo.setPname(pnameArr[i]);
				subVo.setQuantity(quantityArr[i]);
				subVo.setSubprice(subpriceArr[i]);
				
				orderService.createSubOrderList(subVo);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberVo", orderService.getMemberInfo(userid));
		mav.addObject("pList", orderService.getSubOrderList(orderVo.getOrderno()));
		System.out.println("listSize->"+orderService.getSubOrderList(orderVo.getOrderno()).size());
		mav.addObject("orderVo", orderService.getOrderInfo(orderVo.getOrderno()));
		mav.addObject("applyNum", applyNum);
		mav.setViewName("client/order/orderOk");
		return mav;
	}
	
	
}
