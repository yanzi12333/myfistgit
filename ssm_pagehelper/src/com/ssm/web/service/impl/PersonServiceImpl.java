package com.ssm.web.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssm.web.entity.Person;
import com.ssm.web.mapper.PersonMapper;
import com.ssm.web.service.PersonService;

public class PersonServiceImpl implements PersonService {

	@Autowired
	private PersonMapper personMapper;

	@Override
	public List<Person> queryAll() throws Exception {
		// TODO Auto-generated method stub
		return personMapper.queryAll();
	}

	@Override
	public void insert(Person p) throws Exception {
		// TODO Auto-generated method stub
		personMapper.insert(p);
	}

	@Override
	public int update(Person p) throws Exception {
		// TODO Auto-generated method stub
		return personMapper.update(p);
	}

	@Override
	public int delete(int id) throws Exception {
		// TODO Auto-generated method stub
		return personMapper.delete(id);
	}

}
