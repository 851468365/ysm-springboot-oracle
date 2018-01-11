package com.ai.ysm.sys.controller;


import java.util.List;
import java.util.Map;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ai.ysm.sys.entity.SysLogEntity;
import com.ai.ysm.sys.interfaces.SysLogService;
import com.ai.ysm.utils.PageUtils;
import com.ai.ysm.utils.Query;
import com.ai.ysm.utils.R;

import javax.servlet.http.HttpServletRequest;


/**
 * 系统日志
 * 
 * @author asiainfo
 *  
 * @date 2017-03-08 10:40:56
 */
@Controller
@RequestMapping("/sys/log")
public class SysLogController {
	@Autowired
	private SysLogService sysLogService;
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("sys:log:list")
	public R list(@RequestParam Map<String, Object> params, HttpServletRequest request){
		//查询列表数据
		Query query = new Query(params);
		Page<Object> page = PageHelper.startPage(request);
		List<SysLogEntity> sysLogList = sysLogService.queryList(query);
		PageUtils pageUtil = new PageUtils(sysLogList, page);
		return R.ok().put("page", pageUtil);
	}
	
}
