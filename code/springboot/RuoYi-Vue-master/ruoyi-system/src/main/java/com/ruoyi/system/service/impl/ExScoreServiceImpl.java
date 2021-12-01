package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ExScoreMapper;
import com.ruoyi.system.domain.ExScore;
import com.ruoyi.system.service.IExScoreService;

/**
 * 成绩管理Service业务层处理
 * 
 * @author wubin
 * @date 2021-12-01
 */
@Service
public class ExScoreServiceImpl implements IExScoreService 
{
    @Autowired
    private ExScoreMapper exScoreMapper;

    /**
     * 查询成绩管理
     * 
     * @param id 成绩管理主键
     * @return 成绩管理
     */
    @Override
    public ExScore selectExScoreById(Long id)
    {
        return exScoreMapper.selectExScoreById(id);
    }

    /**
     * 查询成绩管理列表
     * 
     * @param exScore 成绩管理
     * @return 成绩管理
     */
    @Override
    public List<ExScore> selectExScoreList(ExScore exScore)
    {
        return exScoreMapper.selectExScoreList(exScore);
    }

    /**
     * 新增成绩管理
     * 
     * @param exScore 成绩管理
     * @return 结果
     */
    @Override
    public int insertExScore(ExScore exScore)
    {
        return exScoreMapper.insertExScore(exScore);
    }

    /**
     * 修改成绩管理
     * 
     * @param exScore 成绩管理
     * @return 结果
     */
    @Override
    public int updateExScore(ExScore exScore)
    {
        return exScoreMapper.updateExScore(exScore);
    }

    /**
     * 批量删除成绩管理
     * 
     * @param ids 需要删除的成绩管理主键
     * @return 结果
     */
    @Override
    public int deleteExScoreByIds(Long[] ids)
    {
        return exScoreMapper.deleteExScoreByIds(ids);
    }

    /**
     * 删除成绩管理信息
     * 
     * @param id 成绩管理主键
     * @return 结果
     */
    @Override
    public int deleteExScoreById(Long id)
    {
        return exScoreMapper.deleteExScoreById(id);
    }
}
