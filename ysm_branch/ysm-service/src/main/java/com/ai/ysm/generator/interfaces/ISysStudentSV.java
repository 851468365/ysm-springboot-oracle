package com.ai.ysm.generator.interfaces;

import java.util.List;
import com.ai.ysm.generator.entity.SysStudent;
import com.ai.ysm.generator.entity.SysStudentExample;

/**
 * 	学生信息管理
 */
public interface ISysStudentSV {
	/**
	 * 根据ID查询学生信息信息
	 * @param id 学生信息ID
	 * @return 学生信息实体
	 */
	public SysStudent getSysStudentById(Long id);

	/**
	 * 查询学生信息信息
	 * @param SysStudentExample 查询条件
	 * @return 学生信息列表
	 */
	public List<SysStudent> getSysStudents(SysStudentExample SysStudentExample);

	/**
	 * 根据ID更新学生信息信息
	 * @param SysStudent 学生信息信息
	 * @return 更新数量
	 */
	public int updateSysStudentById(SysStudent SysStudent); 
	
	/**
	 * 根据条件更新学生信息信息
	 * @param SysStudent  学生信息信息
	 * @param SysStudentExample  查询条件
	 * @return 更新数量
	 */
	public int updateSysStudent(SysStudent SysStudent, SysStudentExample SysStudentExample); 
	
	/**
	 * 根据ID删除学生信息信息
	 * @param id 学生信息ID
	 * @return 删除数量
	 */
	public int deleteSysStudentById(Long id);
	
	/**
	 * 根据条件删除学生信息信息
	 * @param SysStudentExample 查询条件
	 * @return 删除数量
	 */
	public int deleteSysStudent(SysStudentExample SysStudentExample);
	
	/**
	 * 新增学生信息信息
	 * @param SysStudent 学生信息信息
	 * @return 新增数量
	 */
	public int insertSysStudent(SysStudent SysStudent);
	
}


