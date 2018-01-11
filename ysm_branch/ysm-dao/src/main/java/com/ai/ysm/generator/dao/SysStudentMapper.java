package com.ai.ysm.generator.dao;

import com.ai.ysm.generator.entity.SysStudent;
import com.ai.ysm.generator.entity.SysStudentExample;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

public interface SysStudentMapper {
    long countByExample(SysStudentExample example);

    int deleteByExample(SysStudentExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysStudent record);

    int insertSelective(SysStudent record);

    List<SysStudent> selectByExample(SysStudentExample example);

    SysStudent selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysStudent record, @Param("example") SysStudentExample example);

    int updateByExample(@Param("record") SysStudent record, @Param("example") SysStudentExample example);

    int updateByPrimaryKeySelective(SysStudent record);

    int updateByPrimaryKey(SysStudent record);
}