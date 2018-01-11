package com.ai.ysm.sys.interfaces;



import java.util.List;
import java.util.Map;

import com.ai.ysm.sys.entity.SysConfigEntity;

/**
 * 系统配置信息
 * 
 * @author asiainfo
 *  
 * @date 2016年12月4日 下午6:49:01
 */
public interface SysConfigService {

	/**
	 * 获取Oracle中主键信息
	 */
	long getPrimaryKey(String tableName);

	/**
	 * 保存配置信息
	 */
	public void save(SysConfigEntity config);
	
	/**
	 * 更新配置信息
	 */
	public void update(SysConfigEntity config);
	
	/**
	 * 根据key，更新value
	 */
	public void updateValueByKey(String key, String value);
	
	/**
	 * 删除配置信息
	 */
	public void deleteBatch(Long[] ids);
	
	/**
	 * 获取List列表
	 */
	public List<SysConfigEntity> queryList(Map<String, Object> map);
	/**
	 * 获取总记录数
	 */
	public int queryTotal(Map<String, Object> map);
	
	public SysConfigEntity queryObject(Long id);
	
	/**
	 * 根据key，获取配置的value值
	 * 
	 * @param key           key
	 */
	public String getValue(String key);
	
	/**
	 * 根据key，获取value的Object对象
	 * @param key    key
	 * @param clazz  Object对象
	 */
	public <T> T getConfigObject(String key, Class<T> clazz);
	
}
