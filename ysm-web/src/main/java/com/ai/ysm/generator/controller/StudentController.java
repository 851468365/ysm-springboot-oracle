package com.ai.ysm.generator.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.ai.ysm.annotation.SysLog;
import com.ai.ysm.generator.entity.Student;
import com.ai.ysm.generator.entity.StudentExample;
import com.ai.ysm.generator.interfaces.IStudentSV;
import com.ai.ysm.utils.PageUtils;
import com.ai.ysm.utils.R;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@RestController
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private IStudentSV studentSV;
	
	private static Logger logger = LoggerFactory.getLogger(StudentController.class);  
	
	@ResponseBody
	@RequestMapping(value="/info/{id}")
	public Map info(@PathVariable("id") Long id) {
		Student Student = studentSV.getStudentById(id);
		return R.ok().put("student", Student);
	}
	
	@ResponseBody
	@RequestMapping(value="list")
	@RequiresPermissions("student:list")
	public R list(@RequestParam Map<String, Object> params, HttpServletRequest request) {
		System.out.println(params);
		Page<Object> page = PageHelper.startPage(request);
		StudentExample StudentExample = new StudentExample();
		if (params.get("sidx") != null && params.get("sidx").toString().length() > 0) {
			StudentExample.setOrderByClause(params.get("sidx")+" "+params.get("order"));
		}
		List<Student> studentList = studentSV.getStudents(StudentExample);
		PageUtils pageUtil = new PageUtils(studentList, page);
		return R.ok().put("page", pageUtil);
	}

	@ResponseBody
	@RequestMapping(value="update")
	@RequiresPermissions("student:update")
	public R update(@RequestBody Student Student){
		studentSV.updateStudentById(Student);
		return R.ok();
	}
	
	@ResponseBody
	@RequestMapping(value="delete")
	@RequiresPermissions("student:delete")
	public R delete(@RequestBody Long[] ids){
		StudentExample studentExample = new StudentExample();
		studentExample.createCriteria().andIdIn(Arrays.asList(ids));
		studentSV.deleteStudent(studentExample);
		return R.ok();
	}
	
	@SysLog("保存学生信息")
	@ResponseBody
	@RequestMapping(value="save")
	@RequiresPermissions("student:save")
	public R save(@RequestBody Student student){
		studentSV.insertStudent(student);
		return R.ok();
	}

}
