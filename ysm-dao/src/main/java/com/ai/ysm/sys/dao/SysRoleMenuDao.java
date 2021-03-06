package com.ai.ysm.sys.dao;

import org.apache.ibatis.annotations.Mapper;

import com.ai.ysm.sys.entity.SysRoleMenuEntity;

import java.util.List;

/**
 * 角色与菜单对应关系
 * 
 * @author asiainfo
 *  
 * @date 2016年9月18日 上午9:33:46
 */
@Mapper
public interface SysRoleMenuDao extends BaseDao<SysRoleMenuEntity> {
	
	/**
	 * 根据角色ID，获取菜单ID列表
	 */
	List<Long> queryMenuIdList(Long roleId);

	int deleteBatchByMenuId(Object[] id);
}
