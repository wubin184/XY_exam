package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.ExExam;

/**
 * 考试Mapper接口
 * 
 * @author wubin
 * @date 2021-12-01
 */
public interface ExExamMapper 
{
    /**
     * 查询考试
     * 
     * @param id 考试主键
     * @return 考试
     */
    public ExExam selectExExamById(Long id);

    /**
     * 查询考试列表
     * 
     * @param exExam 考试
     * @return 考试集合
     */
    public List<ExExam> selectExExamList(ExExam exExam);

    /**
     * 新增考试
     * 
     * @param exExam 考试
     * @return 结果
     */
    public int insertExExam(ExExam exExam);

    /**
     * 修改考试
     * 
     * @param exExam 考试
     * @return 结果
     */
    public int updateExExam(ExExam exExam);

    /**
     * 删除考试
     * 
     * @param id 考试主键
     * @return 结果
     */
    public int deleteExExamById(Long id);

    /**
     * 批量删除考试
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteExExamByIds(Long[] ids);
}
