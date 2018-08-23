package com.hiphop.common.util;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import com.hiphop.common.base.domin.SysUserMenu;

public class UserMenuUtil {

	public static List<SysUserMenu> tree(List<SysUserMenu> list,Long id) {
		List<SysUserMenu> tree=new ArrayList<SysUserMenu>();
		for (SysUserMenu userMenu : list) {
			SysUserMenu right=null;
			if(userMenu.getParentID()==null) {
				if(id==null) {
					right=new SysUserMenu();
				}
			}else if(userMenu.getParentID()==id){
				right=new SysUserMenu();
			}
			if(right!=null) {
				try {
					BeanUtils.copyProperties(right, userMenu);
				} catch (IllegalAccessException | InvocationTargetException e) {
					e.printStackTrace();
				}
				//查询子菜单
				List<SysUserMenu> childList = tree(list, userMenu.getId());
				
				right.setMenus(childList);
				
				tree.add(right);
			}
		}
		return tree;
	}
}
