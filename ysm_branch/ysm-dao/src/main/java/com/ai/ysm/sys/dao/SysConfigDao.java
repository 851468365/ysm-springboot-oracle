package com.ai.ysm.sys.dao;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ai.ysm.sys.entity.SysConfigEntity;

import java.util.Map;

/**
 * 系统配置信息
 * 
 * @author asiainfo
 *  
 * @date 2016年12月4日 下午6:46:16
 */
@Mapper
public interface SysConfigDao extends BaseDao<SysConfigEntity> {

	/**
	 * 获取Oracle中主键信息
	 */
	long getPrimaryKey(Map<String, Object> map);

	/**
	 * 根据key，查询value
	 */
	SysConfigEntity queryByKey(String paramKey);

	/**
	 * 根据key，更新value
	 */
	int updateValueByKey(@Param("key") String key, @Param("value") String value);
	
}
