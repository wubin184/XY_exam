package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ExPaperMapper;
import com.ruoyi.system.domain.ExPaper;
import com.ruoyi.system.service.IExPaperService;

/**
 * 试卷管理Service业务层处理
 * 
 * @author wubin
 * @date 2021-12-01
 */
@Service
public class ExPaperServiceImpl implements IExPaperService 
{
    @Autowired
    private ExPaperMapper exPaperMapper;

    /**
     * 查询试卷管理
     * 
     * @param id 试卷管理主键
     * @return 试卷管理
     */
    @Override
    public ExPaper selectExPaperById(Long id)
    {
        return exPaperMapper.selectExPaperById(id);
    }

    /**
     * 查询试卷管理列表
     * 
     * @param exPaper 试卷管理
     * @return 试卷管理
     */
    @Override
    public List<ExPaper> selectExPaperList(ExPaper exPaper)
    {
        return exPaperMapper.selectExPaperList(exPaper);
    }

    /**
     * 新增试卷管理
     * 
     * @param exPaper 试卷管理
     * @return 结果
     */
    @Override
    public int insertExPaper(ExPaper exPaper)
    {
        exPaper.setCreateTime(DateUtils.getNowDate());
        return exPaperMapper.insertExPaper(exPaper);
    }

    /**
     * 修改试卷管理
     * 
     * @param exPaper 试卷管理
     * @return 结果
     */
    @Override
    public int updateExPaper(ExPaper exPaper)
    {
        exPaper.setUpdateTime(DateUtils.getNowDate());
        return exPaperMapper.updateExPaper(exPaper);
    }

    /**
     * 批量删除试卷管理
     * 
     * @param ids 需要删除的试卷管理主键
     * @return 结果
     */
    @Override
    public int deleteExPaperByIds(Long[] ids)
    {
        return exPaperMapper.deleteExPaperByIds(ids);
    }

    /**
     * 删除试卷管理信息
     * 
     * @param id 试卷管理主键
     * @return 结果
     */
    @Override
    public int deleteExPaperById(Long id)
    {
        return exPaperMapper.deleteExPaperById(id);
    }
}
