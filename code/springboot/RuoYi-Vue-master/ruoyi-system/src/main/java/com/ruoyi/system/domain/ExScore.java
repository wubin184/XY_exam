package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 成绩管理对象 ex_score
 * 
 * @author wubin
 * @date 2021-12-01
 */
public class ExScore extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 成绩ID */
    private Long id;

    /** 考试ID */
    @Excel(name = "考试ID")
    private String examId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private String userId;

    /** 分数 */
    @Excel(name = "分数")
    private Long score;

    /** 课程id */
    @Excel(name = "课程id")
    private String classId;

    /** 答题卡id */
    @Excel(name = "答题卡id")
    private Long sheetId;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setExamId(String examId) 
    {
        this.examId = examId;
    }

    public String getExamId() 
    {
        return examId;
    }
    public void setUserId(String userId) 
    {
        this.userId = userId;
    }

    public String getUserId() 
    {
        return userId;
    }
    public void setScore(Long score) 
    {
        this.score = score;
    }

    public Long getScore() 
    {
        return score;
    }
    public void setClassId(String classId) 
    {
        this.classId = classId;
    }

    public String getClassId() 
    {
        return classId;
    }
    public void setSheetId(Long sheetId) 
    {
        this.sheetId = sheetId;
    }

    public Long getSheetId() 
    {
        return sheetId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("examId", getExamId())
            .append("userId", getUserId())
            .append("score", getScore())
            .append("classId", getClassId())
            .append("sheetId", getSheetId())
            .toString();
    }
}
