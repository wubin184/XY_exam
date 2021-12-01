package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.ExClass;

/**
 * 课程管理Mapper接口
 * 
 * @author wubin
 * @date 2021-12-01
 */
public interface ExClassMapper 
{
    /**
     * 查询课程管理
     * 
     * @param id 课程管理主键
     * @return 课程管理
     */
    public ExClass selectExClassById(Long id);

    /**
     * 查询课程管理列表
     * 
     * @param exClass 课程管理
     * @return 课程管理集合
     */
    public List<ExClass> selectExClassList(ExClass exClass);

    /**
     * 新增课程管理
     * 
     * @param exClass 课程管理
     * @return 结果
     */
    public int insertExClass(ExClass exClass);

    /**
     * 修改课程管理
     * 
     * @param exClass 课程管理
     * @return 结果
     */
    public int updateExClass(ExClass exClass);

    /**
     * 删除课程管理
     * 
     * @param id 课程管理主键
     * @return 结果
     */
    public int deleteExClassById(Long id);

    /**
     * 批量删除课程管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteExClassByIds(Long[] ids);
}
