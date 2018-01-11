package com.ai.ysm.generator.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import com.ai.ysm.oss.interfaces.SysOssService;
import org.springframework.stereotype.Service;
import com.ai.ysm.generator.dao.SysStudentMapper;
import com.ai.ysm.generator.entity.SysStudent;
import com.ai.ysm.generator.entity.SysStudentExample;
import com.ai.ysm.generator.interfaces.ISysStudentSV;
import com.github.pagehelper.PageHelper;

@Service
public class SysStudentSVImpl implements ISysStudentSV{
	@Resource
	private SysStudentMapper SysStudentMapper;

	@Override
	public SysStudent getSysStudentById(Long id) {
		return SysStudentMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<SysStudent> getSysStudents(SysStudentExample SysStudentExample) {
		return SysStudentMapper.selectByExample(SysStudentExample);
	}

	@Override
	public int updateSysStudentById(SysStudent SysStudent) {

		return SysStudentMapper.updateByPrimaryKeySelective(SysStudent);
	}
	
	@Override
	public int updateSysStudent(SysStudent SysStudent, SysStudentExample SysStudentExample) {
		return SysStudentMapper.updateByExampleSelective(SysStudent, SysStudentExample);
	}

	@Override
	public int insertSysStudent(SysStudent SysStudent) {
		return SysStudentMapper.insertSelective(SysStudent);
	}

	@Override
	public int deleteSysStudentById(Long id) {
		return SysStudentMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	public int deleteSysStudent(SysStudentExample SysStudentExample) {
		return SysStudentMapper.deleteByExample(SysStudentExample);
	}
}
