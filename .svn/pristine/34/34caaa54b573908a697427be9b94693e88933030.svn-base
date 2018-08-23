package com.hiphop.hiphop.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiphop.hiphop.dao.TestDao;
import com.hiphop.hiphop.domian.TestDo;
import com.hiphop.hiphop.service.TestService;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestDao dao;
	
	@Override
	public List<TestDo> list(Map<String, Object> map) {
		return dao.list(map);
	}

	@Override
	public int save(TestDo test) {
		return dao.save(test);
	}

	@Override
	public TestDo get(Long id) {
		return dao.get(id);
	}

	@Override
	public int update(TestDo test) {
		return dao.update(test);
	}

	@Override
	public int remove(Long id) {
		return dao.remove(id);
	}

}
