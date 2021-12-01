package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.ExScore;

/**
 * 成绩管理Service接口
 * 
 * @author wubin
 * @date 2021-12-01
 */
public interface IExScoreService 
{
    /**
     * 查询成绩管理
     * 
     * @param id 成绩管理主键
     * @return 成绩管理
     */
    public ExScore selectExScoreById(Long id);

    /**
     * 查询成绩管理列表
     * 
     * @param exScore 成绩管理
     * @return 成绩管理集合
     */
    public List<ExScore> selectExScoreList(ExScore exScore);

    /**
     * 新增成绩管理
     * 
     * @param exScore 成绩管理
     * @return 结果
     */
    public int insertExScore(ExScore exScore);

    /**
     * 修改成绩管理
     * 
     * @param exScore 成绩管理
     * @return 结果
     */
    public int updateExScore(ExScore exScore);

    /**
     * 批量删除成绩管理
     * 
     * @param ids 需要删除的成绩管理主键集合
     * @return 结果
     */
    public int deleteExScoreByIds(Long[] ids);

    /**
     * 删除成绩管理信息
     * 
     * @param id 成绩管理主键
     * @return 结果
     */
    public int deleteExScoreById(Long id);
}
