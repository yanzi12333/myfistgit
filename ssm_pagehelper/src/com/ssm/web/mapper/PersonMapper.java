package com.ssm.web.mapper;

import java.util.List;

import com.ssm.web.entity.Person;

public interface PersonMapper {

	public void insert(Person p) throws Exception;// 增加

	public List<Person> queryAll() throws Exception;// 查询所有

	public int update(Person p) throws Exception;// 修改

	public int delete(int id) throws Exception;// 删除

}
