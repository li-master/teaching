package com.hiphop.hiphop.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiphop.common.util.R;
import com.hiphop.hiphop.domian.TestDo;
import com.hiphop.hiphop.service.TestService;

@Controller
@RequestMapping("/hiphop/test")
public class TestController {
	
	@Autowired
	private TestService testService;

	/**
	 * 跳转到add
	 * @return
	 */
	@GetMapping("/add")
	String add() {
		return "hiphop/test/add";
	} 
	
	@GetMapping()
	String list() {
		return "hiphop/test/list";
	} 
	
	/**
	 * 获取列表
	 * @param params
	 * @return
	 */
	@ResponseBody
	@GetMapping("/list")
	List<TestDo> list(Map<String,Object> params) {
		return testService.list(params);
	}
	
	@ResponseBody
	@PostMapping("/save")
	R save(TestDo test) {
		if(testService.save(test)>0) {
			return R.OK;
		}
		return R.ERROR;
	}
}
