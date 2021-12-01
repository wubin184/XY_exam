package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.ExPaper;

/**
 * 试卷管理Service接口
 * 
 * @author wubin
 * @date 2021-12-01
 */
public interface IExPaperService 
{
    /**
     * 查询试卷管理
     * 
     * @param id 试卷管理主键
     * @return 试卷管理
     */
    public ExPaper selectExPaperById(Long id);

    /**
     * 查询试卷管理列表
     * 
     * @param exPaper 试卷管理
     * @return 试卷管理集合
     */
    public List<ExPaper> selectExPaperList(ExPaper exPaper);

    /**
     * 新增试卷管理
     * 
     * @param exPaper 试卷管理
     * @return 结果
     */
    public int insertExPaper(ExPaper exPaper);

    /**
     * 修改试卷管理
     * 
     * @param exPaper 试卷管理
     * @return 结果
     */
    public int updateExPaper(ExPaper exPaper);

    /**
     * 批量删除试卷管理
     * 
     * @param ids 需要删除的试卷管理主键集合
     * @return 结果
     */
    public int deleteExPaperByIds(Long[] ids);

    /**
     * 删除试卷管理信息
     * 
     * @param id 试卷管理主键
     * @return 结果
     */
    public int deleteExPaperById(Long id);
}
