package com.hiphop.hiphop.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiphop.hiphop.dao.TeachPlanDao;
import com.hiphop.hiphop.domian.TeachPlan;
import com.hiphop.hiphop.service.TeachPlanService;

@Service
public class TeachPlanServiceImpl implements TeachPlanService {
	
	@Autowired
	private TeachPlanDao dao;

	@Override
	public List<TeachPlan> list(Map<String, Object> map) {
		return dao.list(map);
	}

	@Override
	public int save(TeachPlan test) {
		return dao.save(test);
	}

	@Override
	public TeachPlan get(Long id) {
		return dao.get(id);
	}

	@Override
	public int update(TeachPlan test) {
		return dao.update(test);
	}

	@Override
	public int remove(Long id) {
		return dao.remove(id);
	}

}
