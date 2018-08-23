package com.hiphop.hiphop.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hiphop.hiphop.domian.TestDo;

@Mapper
public interface TestDao{
	int save(TestDo test);

	TestDo get(Long id);

	int update(TestDo test);

	int remove(Long id);

	List<TestDo> list(Map<String, Object> map);

}
