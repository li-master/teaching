package com.hiphop.hiphop.service;

import java.util.List;
import java.util.Map;

import com.hiphop.hiphop.domian.TeachPlan;

public interface TeachPlanService {

	List<TeachPlan> list(Map<String,Object> map);
	
	int save(TeachPlan test);
	
	TeachPlan get(Long id);
	
	int update(TeachPlan test);
	
	int remove(Long id);
}
