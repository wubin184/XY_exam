package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ExClassMapper;
import com.ruoyi.system.domain.ExClass;
import com.ruoyi.system.service.IExClassService;

/**
 * 课程管理Service业务层处理
 * 
 * @author wubin
 * @date 2021-12-01
 */
@Service
public class ExClassServiceImpl implements IExClassService 
{
    @Autowired
    private ExClassMapper exClassMapper;

    /**
     * 查询课程管理
     * 
     * @param id 课程管理主键
     * @return 课程管理
     */
    @Override
    public ExClass selectExClassById(Long id)
    {
        return exClassMapper.selectExClassById(id);
    }

    /**
     * 查询课程管理列表
     * 
     * @param exClass 课程管理
     * @return 课程管理
     */
    @Override
    public List<ExClass> selectExClassList(ExClass exClass)
    {
        return exClassMapper.selectExClassList(exClass);
    }

    /**
     * 新增课程管理
     * 
     * @param exClass 课程管理
     * @return 结果
     */
    @Override
    public int insertExClass(ExClass exClass)
    {
        return exClassMapper.insertExClass(exClass);
    }

    /**
     * 修改课程管理
     * 
     * @param exClass 课程管理
     * @return 结果
     */
    @Override
    public int updateExClass(ExClass exClass)
    {
        return exClassMapper.updateExClass(exClass);
    }

    /**
     * 批量删除课程管理
     * 
     * @param ids 需要删除的课程管理主键
     * @return 结果
     */
    @Override
    public int deleteExClassByIds(Long[] ids)
    {
        return exClassMapper.deleteExClassByIds(ids);
    }

    /**
     * 删除课程管理信息
     * 
     * @param id 课程管理主键
     * @return 结果
     */
    @Override
    public int deleteExClassById(Long id)
    {
        return exClassMapper.deleteExClassById(id);
    }
}
