package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 试卷题目对象 ex_paper_questions
 * 
 * @author wubin
 * @date 2021-12-01
 */
public class ExPaperQuestions extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** 试卷ID */
    @Excel(name = "试卷ID")
    private String paperId;

    /** 题目ID */
    @Excel(name = "题目ID")
    private String quId;

    /** 题目类型 */
    @Excel(name = "题目类型")
    private Long quType;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setPaperId(String paperId) 
    {
        this.paperId = paperId;
    }

    public String getPaperId() 
    {
        return paperId;
    }
    public void setQuId(String quId) 
    {
        this.quId = quId;
    }

    public String getQuId() 
    {
        return quId;
    }
    public void setQuType(Long quType) 
    {
        this.quType = quType;
    }

    public Long getQuType() 
    {
        return quType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("paperId", getPaperId())
            .append("quId", getQuId())
            .append("quType", getQuType())
            .toString();
    }
}
