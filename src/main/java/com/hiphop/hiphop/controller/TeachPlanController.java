package com.hiphop.hiphop.controller;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiphop.common.util.R;
import com.hiphop.hiphop.domian.TeachPlan;
import com.hiphop.hiphop.service.TeachPlanService;

@Controller
@RequestMapping("/teach/plan")
public class TeachPlanController {
	
	@Autowired
	private TeachPlanService teachPlanService;

	/**
	 * 跳转到编辑页面
	 * @return
	 */
	@GetMapping("/edit")
	String add(Long id,Model model) {
		model.addAttribute("id", id);
		return "teach/plan/edit";
	} 
	
	@GetMapping()
	String list() {
		return "teach/plan/list";
	} 
	
	/**
	 * 获取列表
	 * @param params
	 * @return
	 */
	@ResponseBody
	@GetMapping("/list")
	List<TeachPlan> list(Map<String,Object> params) {
		return teachPlanService.list(params);
	}
	
	@ResponseBody
	@GetMapping("/get")
	TeachPlan get(Long id) {
		return teachPlanService.get(id);
	}
	
	
	@ResponseBody
	@PostMapping("/save")
	R save(TeachPlan test) {
		if(null==test.getId()) {
			if(teachPlanService.save(test)>0) {
				return R.OK;
			}
		}else {
			if(teachPlanService.update(test)>0) {
				return R.OK;
			}
		}
		return R.ERROR;
	}
}
