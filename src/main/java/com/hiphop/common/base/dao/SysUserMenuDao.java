package com.hiphop.common.base.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hiphop.common.base.domin.SysUserMenu;


@Mapper
public interface SysUserMenuDao {

	List<SysUserMenu> list(Long userID);
}
