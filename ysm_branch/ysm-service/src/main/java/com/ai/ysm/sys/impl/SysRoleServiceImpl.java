package com.ai.ysm.sys.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ai.ysm.sys.dao.SysRoleDeptDao;
import com.ai.ysm.sys.dao.SysRoleMenuDao;
import com.ai.ysm.sys.dao.SysUserRoleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ai.ysm.annotation.DataFilter;
import com.ai.ysm.sys.dao.SysRoleDao;
import com.ai.ysm.sys.entity.SysRoleEntity;
import com.ai.ysm.sys.interfaces.SysRoleDeptService;
import com.ai.ysm.sys.interfaces.SysRoleMenuService;
import com.ai.ysm.sys.interfaces.SysRoleService;


/**
 * 角色
 * 
 * @author asiainfo
 *  
 * @date 2016年9月18日 上午9:45:12
 */
@Service
public class SysRoleServiceImpl implements SysRoleService {
	@Autowired
	private SysRoleMenuDao sysRoleMenuDao;
	@Autowired
	private SysRoleDeptDao sysRoleDeptDao;
	@Autowired
	private SysUserRoleDao sysUserRoleDao;

	@Autowired
	private SysRoleDao sysRoleDao;
	@Autowired
	private SysRoleMenuService sysRoleMenuService;
	@Autowired
	private SysRoleDeptService sysRoleDeptService;

	@Override
	public SysRoleEntity queryObject(Long roleId) {
		return sysRoleDao.queryObject(roleId);
	}

	@Override
	@DataFilter(tableAlias = "r", user = false)
	public List<SysRoleEntity> queryList(Map<String, Object> map) {
		return sysRoleDao.queryList(map);
	}

	@Override
	@DataFilter(tableAlias = "r", user = false)
	public int queryTotal(Map<String, Object> map) {
		return sysRoleDao.queryTotal(map);
	}

	@Override
	@Transactional
	public void save(SysRoleEntity role) {
		role.setCreateTime(new Date());
		sysRoleDao.save(role);
		
		//保存角色与菜单关系
		sysRoleMenuService.saveOrUpdate(role.getRoleId(), role.getMenuIdList());

		//保存角色与部门关系
		sysRoleDeptService.saveOrUpdate(role.getRoleId(), role.getDeptIdList());
	}

	@Override
	@Transactional
	public void update(SysRoleEntity role) {
		sysRoleDao.update(role);
		
		//更新角色与菜单关系
		sysRoleMenuService.saveOrUpdate(role.getRoleId(), role.getMenuIdList());

		//保存角色与部门关系
		sysRoleDeptService.saveOrUpdate(role.getRoleId(), role.getDeptIdList());
	}

	@Override
	@Transactional
	public void deleteBatch(Long[] roleIds) {
		sysRoleDao.deleteBatch(roleIds);
		sysRoleMenuDao.deleteBatch(roleIds);
		sysRoleDeptDao.deleteBatch(roleIds);
		sysUserRoleDao.deleteBatchByRoleId(roleIds);
	}

}
