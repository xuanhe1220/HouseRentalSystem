package com.house.personal.service;


import com.house.personal.entity.Users;
import org.apache.ibatis.annotations.Mapper;


public interface IUserService {
	/**
	 *  用户登录
	 * @return
	 */
	public Users login(Users user);
	/**
	 * 用户注册
	 * 
	 * @param user
	 * @return
	 */
	public int regist(Users user);
	/**
	 * 修改密码
	 * @return
	 */
	public int updateUserPwd(Users users);
	/**
	 * 检查旧密码
	 * @param users
	 * @return
	 */
	public Users checkOldPwd(Users users);

	public Users confirmUser(Users users);

	public Users findUserIdByName(Users users);
}
