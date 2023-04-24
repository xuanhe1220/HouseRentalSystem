package com.house.personal.dao;

import com.house.personal.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
public interface AdminMapper {
	/**
	 * 管理员登录
	 * @param admin
	 * @return
	 */
	public Admin adminAccess(Admin admin);
	
	/**
	 * 查询所有用户
	 * @return
	 */
	public List<Users> findAllUser();
	
	/**
	 * 查询所有房源信息
	 * @return
	 */
	public List<House> findAllHouse(Page page);
	
	/**
	 * 管理员删除房源信息
	 * @return
	 */
	public int deleteHouse(int hID);
	
	/**
	 * 通过id查询用户
	 * @param uID
	 * @return
	 */
	public Users findUserById(int uID);
	
	/**
	 * 管理员更新普通用户信息
	 * @return
	 */
	public int updateUser(Users users);
	/**
	 * 管理员删除用户
	 * @param uID
	 * @return
	 */
	public int deleteUser(int uID);
	
	/**
	 *  检查修改密码原密码
	 * @param admin
	 * @return
	 */
	public Admin checkAdminPwd(Admin admin);
	
	/**
	 *  修改管理员密码
	 * @param admin
	 * @return
	 */
	public int updateAdminPwd(Admin admin);

	/**
	 * 查询所有订单信息
	 * @return
	 */
	public List<UserOrder> AllOrder(Page page);

	/**
	 * 查询所有订单数
	 * @return
	 */
	public int getAllOrderCount();
}
