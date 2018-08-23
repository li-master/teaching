package com.hiphop.common.base.domin;

import java.util.List;

import lombok.Data;

@Data
public class SysUserMenu {

	private Long id;
	private String name;
	private String url;
	private String perm;
	private Long parentID;
	
	private List<SysUserMenu> menus;
}
