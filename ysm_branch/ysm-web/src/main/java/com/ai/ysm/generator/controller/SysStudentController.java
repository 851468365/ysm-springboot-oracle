package com.ai.ysm.generator.controller;

import java.util.List;
import java.util.Arrays;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.ai.ysm.generator.entity.SysStudent;
import com.ai.ysm.generator.entity.SysStudentExample;
import com.ai.ysm.generator.interfaces.ISysStudentSV;
import com.ai.ysm.utils.R;
import com.ai.ysm.utils.PageUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.ai.ysm.annotation.SysLog;

@RestController
@RequestMapping("/sysStudent")
public class SysStudentController {
	@Autowired
	private ISysStudentSV sysStudentSV;
	
	private static Logger logger = LoggerFactory.getLogger(SysStudentController.class);  
	
	@ResponseBody
	@RequestMapping(value="/info/{id}")
	public Map info(@PathVariable("id") Long id) {
		SysStudent sysStudent = sysStudentSV.getSysStudentById(id);
		return R.ok().put("sysStudent", sysStudent);
	}
	
	@ResponseBody
	@RequestMapping(value="list")
	@RequiresPermissions("sysStudent:list")
	public R list(@RequestParam Map<String, Object> params, HttpServletRequest request) {
		Page<Object> page = PageHelper.startPage(request);
		SysStudentExample sysStudentExample = new SysStudentExample();
		if (params.get("sidx") != null && params.get("sidx").toString().length() > 0) {
			sysStudentExample.setOrderByClause(params.get("sidx")+" "+params.get("order"));
		}
		List<SysStudent> sysStudentList = sysStudentSV.getSysStudents(sysStudentExample);
		PageUtils pageUtil = new PageUtils(sysStudentList, page);
		return R.ok().put("page", pageUtil);
	}
	
	@ResponseBody
	@RequestMapping(value="update")
	@RequiresPermissions("sysStudent:update")
	public R update(@RequestBody SysStudent sysStudent){
		sysStudentSV.updateSysStudentById(sysStudent);
		return R.ok();
	}
	
	@ResponseBody
	@RequestMapping(value="delete")
	@RequiresPermissions("sysStudent:delete")
	public R delete(@RequestBody Long[] ids){
		SysStudentExample sysStudentExample = new SysStudentExample();
		sysStudentExample.createCriteria().andIdIn(Arrays.asList(ids));
		sysStudentSV.deleteSysStudent(sysStudentExample);
		return R.ok();
	}
	
	@SysLog("保存学生信息")
	@ResponseBody
	@RequestMapping(value="save")
	@RequiresPermissions("sysStudent:save")
	public R save(@RequestBody SysStudent sysStudent){
		sysStudentSV.insertSysStudent(sysStudent);
		return R.ok();
	}


}
