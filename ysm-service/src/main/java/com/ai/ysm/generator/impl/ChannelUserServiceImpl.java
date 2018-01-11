package com.ai.ysm.generator.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.ai.ysm.generator.dao.ChannelUserDao;
import com.ai.ysm.generator.entity.ChannelUserEntity;
import com.ai.ysm.generator.interfaces.ChannelUserService;
import com.ai.ysm.sys.dao.SysLogDao;
import com.ai.ysm.sys.entity.SysLogEntity;



@Service
public class ChannelUserServiceImpl implements ChannelUserService {
	@Autowired
	private ChannelUserDao channelUserDao;
	
	@Autowired
	private SysLogDao sysLogDao;
	
	@Override
	public ChannelUserEntity queryObject(Long id){
		return channelUserDao.queryObject(id);
	}
	
	@Override
	public List<ChannelUserEntity> queryList(Map<String, Object> map){
		return channelUserDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return channelUserDao.queryTotal(map);
	}
	
	@Override
	public void save(ChannelUserEntity channelUser){
		channelUserDao.save(channelUser);
	}
	
	@Override
	public void update(ChannelUserEntity channelUser){
		channelUserDao.update(channelUser);
	}
	
	@Override
	public void delete(Long id){
		channelUserDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		channelUserDao.deleteBatch(ids);
	}
	
}
