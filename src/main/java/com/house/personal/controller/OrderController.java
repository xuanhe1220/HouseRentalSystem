package com.house.personal.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.house.personal.entity.*;
import com.house.personal.service.IAdminService;
import com.house.personal.service.IHouserService;
import com.house.personal.service.IOrderService;
import com.house.personal.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class OrderController {

	@Autowired
	private IOrderService sevice;

	@Autowired
	private IUserService service1;

	@Autowired
	private IHouserService service2;
	
	@RequestMapping("/myorder")
	public String toOrderPage() {
		return "myorder";
	}
	
	@RequestMapping("/updatepwd")
	public String toUpdatepwdPage() {
		return "updatepwd";
	}

	@RequestMapping("/toOrderChartPage")
	public String toChartPage() {return "orderstatisticschart";}

	@RequestMapping("/toConfirmUserPage")
	public String toConfirmUserPage() {return "confirmuser";}

	@RequestMapping("/addOrder")
	@ResponseBody
	public String addOrder(String id,HttpServletRequest request) {
		Users u = (Users) request.getSession().getAttribute("loginUser");
		try {
			Order order = new Order();
			order.sethID(Integer.parseInt(id));
			order.setOrderUser(u.getuNickName());
			order.setuID(u.getuID());
			int n = sevice.addOrder(order);
			if(n>0) {
				service2.updateHouseStatus(Integer.parseInt(id));
				return "OK";
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return "FAIL";
	}

	@RequestMapping("/newOrder")
	@ResponseBody
	public String newOrder(Integer hid,String username,HttpServletRequest request) {
		Admin admin = (Admin) request.getSession().getAttribute("Admin");
		try {
			Order order = new Order();
			Users user=new Users();
			user.setuName(username);
			order.sethID(hid);
			order.setOrderUser(admin.getUsername());
			if(service1.findUserIdByName(user)!=null){
				order.setuID(service1.findUserIdByName(user).getuID());
				int n = sevice.addOrder(order);
				if(n>0) {
					service2.updateHouseStatus(hid);
					return "OK";
				}
			}

		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return "FAIL";
	}

	
	@RequestMapping("/myOrderInfo")
	@ResponseBody
	public UserOrderData findAllOrder(int page, int limit, HttpServletRequest request){
		Page p = new Page();
		p.setPage((page - 1) * limit);
		p.setLimit(limit);
		Users u = (Users) request.getSession().getAttribute("loginUser");
		p.setuID(u.getuID());
		UserOrderData uod = new UserOrderData();
		List<UserOrder> order = sevice.findAllOrder(p);
		uod.setCode(0);
		uod.setCount(sevice.getOrderCount(u.getuID()));
		uod.setData(order);
		uod.setMsg("200");
		return  uod;
	}
	
	@RequestMapping("/deleteOrder")
	@ResponseBody
	public String deleteOrder(int oID) {
		int n = sevice.deleteOrder(oID);
		if(n>0)
			return "OK";
		return "FAIL";
	}
}
