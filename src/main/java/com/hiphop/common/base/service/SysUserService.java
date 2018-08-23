package com.hiphop.common.base.service;

import java.util.List;
import java.util.Map;

import com.hiphop.common.base.domin.SysUser;

public interface SysUserService {

	List<SysUser> list(Map<String, Object> map);

	SysUser doLog(SysUser sysUser);

}
