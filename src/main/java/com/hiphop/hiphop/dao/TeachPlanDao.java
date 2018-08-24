package com.hiphop.hiphop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hiphop.hiphop.domian.TeachPlan;

@Mapper
public interface TeachPlanDao{
	
	int save(TeachPlan test);

	TeachPlan get(Long id);

	int update(TeachPlan test);

	int remove(Long id);

	List<TeachPlan> list(Map<String, Object> map);

}
