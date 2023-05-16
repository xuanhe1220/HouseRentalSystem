package com.house.personal.controller;

import javax.servlet.http.HttpServletRequest;

import com.house.personal.entity.House;
import com.house.personal.entity.Users;
import com.house.personal.service.IHouserService;
import com.house.personal.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class UserController {
	
	@Autowired
	private IUserService service;
	@Autowired
	private IHouserService dao;
	
	@RequestMapping("/toUserSystem")
	public String toUserSystemPage() {
		return "customer";
	}
	
	@RequestMapping("/toUserRentalPage")
	public String toUserRentalPage() {
		return "myrental";
	}
	
	@RequestMapping("/welcome")
	public String toWelcomePage() {
		return "welcome";
	}

	@RequestMapping("/paymentwindow")
	public String toPayPage() {
		return "paymentwindow";
	}
	
	@RequestMapping("/toUpdateHousePage")
	public String toUpdatePage(int hID,HttpServletRequest request) {
		House house = dao.findHouseDetailsById(hID);
		request.getSession().setAttribute("House", house);
		return "updatehouse";
	}
	
	@RequestMapping("/updateUserPwd")
	@ResponseBody
	public String updateUserPwd(String id,String newPwd,String oldPwd) {
		Users oldUser = new Users();
		oldUser.setuID(Integer.parseInt(id));
		oldUser.setuPassword(oldPwd);
		Users checkUser = service.checkOldPwd(oldUser);
		if(checkUser!=null) {
			Users newUser = new Users();
			newUser.setuID(Integer.parseInt(id));
			newUser.setuPassword(newPwd);
			int n = service.updateUserPwd(newUser);
			if(n>0) {
				return "OK";
			}
		}
		return "FAIL";
	}
	@RequestMapping("/confirmUser")
	@ResponseBody
	public String confirmUser(String username,String phonenumber) {
		Users user=new Users();
		user.setuName(username);
		user.setuPhoneNumber(phonenumber);
		System.out.println(username);
		System.out.println(phonenumber);
		Users u=service.confirmUser(user);
		if(u!=null){
			return "OK";
		}
		return "FAIL";
	}
}
