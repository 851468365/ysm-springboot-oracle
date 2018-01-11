package com.ai.ysm.generator.controller;

import java.util.List;
import java.util.Map;

import com.ai.ysm.annotation.SysLog;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ai.ysm.generator.entity.ChannelUserEntity;
import com.ai.ysm.generator.interfaces.ChannelUserService;
import com.ai.ysm.utils.PageUtils;
import com.ai.ysm.utils.Query;
import com.ai.ysm.utils.R;

import javax.servlet.http.HttpServletRequest;

/**
 * 
 * 
 * @author asiainfo
 *  
 * @date 2018-01-03 15:37:17
 */
@RestController
@RequestMapping("channeluser")
public class ChannelUserController {
	@Autowired
	private ChannelUserService channelUserService;
	
	/**
	 * 列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("channeluser:list")
	public R list(@RequestParam Map<String, Object> params, HttpServletRequest request){
		//查询列表数据
        Query query = new Query(params);
		Page<Object> page = PageHelper.startPage(request);
		List<ChannelUserEntity> channelUserList = channelUserService.queryList(query);
		PageUtils pageUtil = new PageUtils(channelUserList, page);
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("channeluser:info")
	public R info(@PathVariable("id") Long id){
		ChannelUserEntity channelUser = channelUserService.queryObject(id);
		
		return R.ok().put("channelUser", channelUser);
	}
	
	/**
	 * 保存
	 */
	@SysLog("保存用户信息")
	@RequestMapping("/save")
	@RequiresPermissions("channeluser:save")
	public R save(@RequestBody ChannelUserEntity channelUser){
		channelUserService.save(channelUser);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@RequestMapping("/update")
	@RequiresPermissions("channeluser:update")
	public R update(@RequestBody ChannelUserEntity channelUser){
		channelUserService.update(channelUser);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping("/delete")
	@RequiresPermissions("channeluser:delete")
	public R delete(@RequestBody Long[] ids){
		channelUserService.deleteBatch(ids);
		
		return R.ok();
	}
	
}
