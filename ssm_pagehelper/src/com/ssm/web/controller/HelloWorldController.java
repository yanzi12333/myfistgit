package com.ssm.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.web.entity.Person;
import com.ssm.web.service.PersonService;

@Controller
// 为了对url进行分类管理 ，可以在这里定义根路径，最终访问url是根路径+子路径
// 比如：商品列表：/items/queryItems.action
@RequestMapping("/person")
public class HelloWorldController {
	@Autowired
	private PersonService personService;

	// 人员查询
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/query", method = { RequestMethod.POST,
			RequestMethod.GET })
	public ModelAndView queryAll(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		int num = 1;
		int size = 3;
		if (pageNum != null && !"".equals(pageNum)) {
			num = Integer.parseInt(pageNum);
		}
		if (pageSize != null && !"".equals(pageSize)) {
			size = Integer.parseInt(pageSize);
		}
		String sortString = "id.desc";
		Order.formString(sortString);

		PageHelper.startPage(num, size);
		List<Person> personList = personService.queryAll();

		for (Person p : personList) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			p.setBirthdayStr(sdf.format(p.getBirthday()));
		}
		PageInfo<Person> pagehelper = new PageInfo<Person>(personList);////用PageInfo对结果进行包装
		

		// 返回ModelAndView
		ModelAndView modelAndView = new ModelAndView();
		// 相当 于request的setAttribut，在jsp页面中通过personList取数据
		// modelAndView.addObject("personList", personList);
		modelAndView.addObject("pagehelper", pagehelper);

		// 指定视图
		// 下边的路径，如果在视图解析器中配置jsp路径的前缀和jsp路径的后缀，修改为
		// modelAndView.setViewName("/jsp/personList.jsp");
		// 上边的路径配置可以不在程序中指定jsp路径的前缀和jsp路径的后缀
		modelAndView.setViewName("/personList");
		return modelAndView;

	}

	@RequestMapping(value = "/save", method = { RequestMethod.POST,
			RequestMethod.GET })
	// @RequestParam里边指定request传入参数名称和形参进行绑定。
	// 通过required属性指定参数是否必须要传入
	// 通过defaultValue可以设置默认值，如果id参数没有传入，将默认值和形参绑定。
	public void savePerson(HttpServletRequest request,
			HttpServletResponse response, Person person) {

		// 插入一个对象(Person)到数据库对应的表中(t_person)
		/*
		 * Person p = new Person(); // p.setId(3); p.setName("张总");
		 * p.setAge(43);
		 */
		/*
		 * String name = request.getParameter("name"); String age =
		 * request.getParameter("age"); Person person = new Person();
		 * person.setName(name); person.setAge(Integer.parseInt(age));
		 * person.setBirthday(new Date());
		 */
		// 将对象持久化到数据库中
		// 需要通过PersonMapper中定义的sql语句完成一个映射过程
		try {
			personService.insert(person);
			String jsonStr = JSON.toJSONString(person);
			sendJsonData(response, jsonStr);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}

	// 修改
	@RequestMapping(value = "/update", method = { RequestMethod.POST,
			RequestMethod.GET })
	public ModelAndView update(HttpServletRequest request,
			HttpServletResponse response, Integer id, Person person)
			throws Exception {

		// 调用service 修改
		try {
			int rows = 0;
			rows = personService.update(person);

			Map<String, String> map = new HashMap<String, String>();
			if (rows > 0) {
				map.put("result", "修改成功！");
			} else {
				map.put("result", "修改失败！");
			}

			String jsonStr = JSON.toJSONString(map);
			sendJsonData(response, jsonStr);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return null;

	}

	// 删除
	@RequestMapping(value = "/delete", method = { RequestMethod.POST,
			RequestMethod.GET })
	public ModelAndView delete(HttpServletRequest request,
			HttpServletResponse response, Integer id) throws Exception {

		// 调用service 删除
		try {
			int rows = 0;
			rows = personService.delete(id);

			Map<String, String> map = new HashMap<String, String>();
			if (rows > 0) {
				map.put("personId", id.toString());
				map.put("result", "success");
			} else {
				map.put("result", "fail");
			}

			String jsonStr = JSON.toJSONString(map);
			sendJsonData(response, jsonStr);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return null;

	}

	/**
	 * 通过JSON向前台发送数据
	 * 
	 * @param data
	 * @throws IOException
	 */
	@SuppressWarnings("unused")
	private void sendJsonData(HttpServletResponse response, String data)
			throws IOException {
		// HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");

		PrintWriter out;
		out = response.getWriter();
		out.println(data);
		out.flush();
		out.close();
	}

}