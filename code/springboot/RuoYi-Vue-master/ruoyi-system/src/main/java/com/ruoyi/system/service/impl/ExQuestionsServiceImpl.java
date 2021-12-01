package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ExQuestionsMapper;
import com.ruoyi.system.domain.ExQuestions;
import com.ruoyi.system.service.IExQuestionsService;

/**
 * 题库管理Service业务层处理
 * 
 * @author wubin
 * @date 2021-12-01
 */
@Service
public class ExQuestionsServiceImpl implements IExQuestionsService 
{
    @Autowired
    private ExQuestionsMapper exQuestionsMapper;

    /**
     * 查询题库管理
     * 
     * @param id 题库管理主键
     * @return 题库管理
     */
    @Override
    public ExQuestions selectExQuestionsById(Long id)
    {
        return exQuestionsMapper.selectExQuestionsById(id);
    }

    /**
     * 查询题库管理列表
     * 
     * @param exQuestions 题库管理
     * @return 题库管理
     */
    @Override
    public List<ExQuestions> selectExQuestionsList(ExQuestions exQuestions)
    {
        return exQuestionsMapper.selectExQuestionsList(exQuestions);
    }

    /**
     * 新增题库管理
     * 
     * @param exQuestions 题库管理
     * @return 结果
     */
    @Override
    public int insertExQuestions(ExQuestions exQuestions)
    {
        exQuestions.setCreateTime(DateUtils.getNowDate());
        return exQuestionsMapper.insertExQuestions(exQuestions);
    }

    /**
     * 修改题库管理
     * 
     * @param exQuestions 题库管理
     * @return 结果
     */
    @Override
    public int updateExQuestions(ExQuestions exQuestions)
    {
        exQuestions.setUpdateTime(DateUtils.getNowDate());
        return exQuestionsMapper.updateExQuestions(exQuestions);
    }

    /**
     * 批量删除题库管理
     * 
     * @param ids 需要删除的题库管理主键
     * @return 结果
     */
    @Override
    public int deleteExQuestionsByIds(Long[] ids)
    {
        return exQuestionsMapper.deleteExQuestionsByIds(ids);
    }

    /**
     * 删除题库管理信息
     * 
     * @param id 题库管理主键
     * @return 结果
     */
    @Override
    public int deleteExQuestionsById(Long id)
    {
        return exQuestionsMapper.deleteExQuestionsById(id);
    }
}
