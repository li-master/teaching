package com.hiphop.common.base.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hiphop.common.base.domin.SysUser;

@Mapper
public interface SysUserDao {

	List<SysUser> list(Map<String,Object> map);
	
	SysUser userLogin(SysUser sysUser);
}
