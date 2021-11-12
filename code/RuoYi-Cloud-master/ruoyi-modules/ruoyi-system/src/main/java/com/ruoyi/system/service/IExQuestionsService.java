package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.ExQuestions;

/**
 * 题库管理Service接口
 * 
 * @author wubin
 * @date 2021-11-12
 */
public interface IExQuestionsService 
{
    /**
     * 查询题库管理
     * 
     * @param id 题库管理主键
     * @return 题库管理
     */
    public ExQuestions selectExQuestionsById(Long id);

    /**
     * 查询题库管理列表
     * 
     * @param exQuestions 题库管理
     * @return 题库管理集合
     */
    public List<ExQuestions> selectExQuestionsList(ExQuestions exQuestions);

    /**
     * 新增题库管理
     * 
     * @param exQuestions 题库管理
     * @return 结果
     */
    public int insertExQuestions(ExQuestions exQuestions);

    /**
     * 修改题库管理
     * 
     * @param exQuestions 题库管理
     * @return 结果
     */
    public int updateExQuestions(ExQuestions exQuestions);

    /**
     * 批量删除题库管理
     * 
     * @param ids 需要删除的题库管理主键集合
     * @return 结果
     */
    public int deleteExQuestionsByIds(Long[] ids);

    /**
     * 删除题库管理信息
     * 
     * @param id 题库管理主键
     * @return 结果
     */
    public int deleteExQuestionsById(Long id);
}
