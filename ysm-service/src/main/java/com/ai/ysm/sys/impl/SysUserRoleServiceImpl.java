package com.ai.ysm.sys.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.ysm.sys.dao.SysUserRoleDao;
import com.ai.ysm.sys.interfaces.SysUserRoleService;


/**
 * 用户与角色对应关系
 * 
 * @author asiainfo
 *  
 * @date 2016年9月18日 上午9:45:48
 */
@Service
public class SysUserRoleServiceImpl implements SysUserRoleService {
	@Autowired
	private SysUserRoleDao sysUserRoleDao;

	@Override
	public void saveOrUpdate(Long userId, List<Long> roleIdList) {
		if(roleIdList.size() == 0){
			return ;
		}
		
		//先删除用户与角色关系
		sysUserRoleDao.delete(userId);
		
		//保存用户与角色关系
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("roleIdList", roleIdList);
		sysUserRoleDao.save(map);
	}

	@Override
	public List<Long> queryRoleIdList(Long userId) {
		return sysUserRoleDao.queryRoleIdList(userId);
	}

	@Override
	public void delete(Long userId) {
		sysUserRoleDao.delete(userId);
	}

	@Override
	public void deleteBatch(Long[] userIds) {
		sysUserRoleDao.deleteBatch(userIds);
	}


}
