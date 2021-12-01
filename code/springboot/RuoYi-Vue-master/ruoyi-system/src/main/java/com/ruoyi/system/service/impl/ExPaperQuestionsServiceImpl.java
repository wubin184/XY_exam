package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ExPaperQuestionsMapper;
import com.ruoyi.system.domain.ExPaperQuestions;
import com.ruoyi.system.service.IExPaperQuestionsService;

/**
 * 试卷题目Service业务层处理
 * 
 * @author wubin
 * @date 2021-12-01
 */
@Service
public class ExPaperQuestionsServiceImpl implements IExPaperQuestionsService 
{
    @Autowired
    private ExPaperQuestionsMapper exPaperQuestionsMapper;

    /**
     * 查询试卷题目
     * 
     * @param id 试卷题目主键
     * @return 试卷题目
     */
    @Override
    public ExPaperQuestions selectExPaperQuestionsById(Long id)
    {
        return exPaperQuestionsMapper.selectExPaperQuestionsById(id);
    }

    /**
     * 查询试卷题目列表
     * 
     * @param exPaperQuestions 试卷题目
     * @return 试卷题目
     */
    @Override
    public List<ExPaperQuestions> selectExPaperQuestionsList(ExPaperQuestions exPaperQuestions)
    {
        return exPaperQuestionsMapper.selectExPaperQuestionsList(exPaperQuestions);
    }

    /**
     * 新增试卷题目
     * 
     * @param exPaperQuestions 试卷题目
     * @return 结果
     */
    @Override
    public int insertExPaperQuestions(ExPaperQuestions exPaperQuestions)
    {
        return exPaperQuestionsMapper.insertExPaperQuestions(exPaperQuestions);
    }

    /**
     * 修改试卷题目
     * 
     * @param exPaperQuestions 试卷题目
     * @return 结果
     */
    @Override
    public int updateExPaperQuestions(ExPaperQuestions exPaperQuestions)
    {
        return exPaperQuestionsMapper.updateExPaperQuestions(exPaperQuestions);
    }

    /**
     * 批量删除试卷题目
     * 
     * @param ids 需要删除的试卷题目主键
     * @return 结果
     */
    @Override
    public int deleteExPaperQuestionsByIds(Long[] ids)
    {
        return exPaperQuestionsMapper.deleteExPaperQuestionsByIds(ids);
    }

    /**
     * 删除试卷题目信息
     * 
     * @param id 试卷题目主键
     * @return 结果
     */
    @Override
    public int deleteExPaperQuestionsById(Long id)
    {
        return exPaperQuestionsMapper.deleteExPaperQuestionsById(id);
    }
}
