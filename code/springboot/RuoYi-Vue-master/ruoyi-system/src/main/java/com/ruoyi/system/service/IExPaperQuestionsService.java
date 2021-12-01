package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.ExPaperQuestions;

/**
 * 试卷题目Service接口
 * 
 * @author wubin
 * @date 2021-12-01
 */
public interface IExPaperQuestionsService 
{
    /**
     * 查询试卷题目
     * 
     * @param id 试卷题目主键
     * @return 试卷题目
     */
    public ExPaperQuestions selectExPaperQuestionsById(Long id);

    /**
     * 查询试卷题目列表
     * 
     * @param exPaperQuestions 试卷题目
     * @return 试卷题目集合
     */
    public List<ExPaperQuestions> selectExPaperQuestionsList(ExPaperQuestions exPaperQuestions);

    /**
     * 新增试卷题目
     * 
     * @param exPaperQuestions 试卷题目
     * @return 结果
     */
    public int insertExPaperQuestions(ExPaperQuestions exPaperQuestions);

    /**
     * 修改试卷题目
     * 
     * @param exPaperQuestions 试卷题目
     * @return 结果
     */
    public int updateExPaperQuestions(ExPaperQuestions exPaperQuestions);

    /**
     * 批量删除试卷题目
     * 
     * @param ids 需要删除的试卷题目主键集合
     * @return 结果
     */
    public int deleteExPaperQuestionsByIds(Long[] ids);

    /**
     * 删除试卷题目信息
     * 
     * @param id 试卷题目主键
     * @return 结果
     */
    public int deleteExPaperQuestionsById(Long id);
}
