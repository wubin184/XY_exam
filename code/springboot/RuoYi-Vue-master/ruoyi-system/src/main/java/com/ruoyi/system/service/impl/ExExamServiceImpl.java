package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ExExamMapper;
import com.ruoyi.system.domain.ExExam;
import com.ruoyi.system.service.IExExamService;

/**
 * 考试Service业务层处理
 * 
 * @author wubin
 * @date 2021-12-01
 */
@Service
public class ExExamServiceImpl implements IExExamService 
{
    @Autowired
    private ExExamMapper exExamMapper;

    /**
     * 查询考试
     * 
     * @param id 考试主键
     * @return 考试
     */
    @Override
    public ExExam selectExExamById(Long id)
    {
        return exExamMapper.selectExExamById(id);
    }

    /**
     * 查询考试列表
     * 
     * @param exExam 考试
     * @return 考试
     */
    @Override
    public List<ExExam> selectExExamList(ExExam exExam)
    {
        return exExamMapper.selectExExamList(exExam);
    }

    /**
     * 新增考试
     * 
     * @param exExam 考试
     * @return 结果
     */
    @Override
    public int insertExExam(ExExam exExam)
    {
        exExam.setCreateTime(DateUtils.getNowDate());
        return exExamMapper.insertExExam(exExam);
    }

    /**
     * 修改考试
     * 
     * @param exExam 考试
     * @return 结果
     */
    @Override
    public int updateExExam(ExExam exExam)
    {
        exExam.setUpdateTime(DateUtils.getNowDate());
        return exExamMapper.updateExExam(exExam);
    }

    /**
     * 批量删除考试
     * 
     * @param ids 需要删除的考试主键
     * @return 结果
     */
    @Override
    public int deleteExExamByIds(Long[] ids)
    {
        return exExamMapper.deleteExExamByIds(ids);
    }

    /**
     * 删除考试信息
     * 
     * @param id 考试主键
     * @return 结果
     */
    @Override
    public int deleteExExamById(Long id)
    {
        return exExamMapper.deleteExExamById(id);
    }
}
