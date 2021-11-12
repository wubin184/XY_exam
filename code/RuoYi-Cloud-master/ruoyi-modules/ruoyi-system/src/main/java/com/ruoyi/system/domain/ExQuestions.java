package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 题库管理对象 ex_questions
 * 
 * @author wubin
 * @date 2021-11-12
 */
public class ExQuestions extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 题目ID */
    private Long id;

    /** 题目类型，选择判断填空简答编程 */
    @Excel(name = "题目类型，选择判断填空简答编程")
    private Long type;

    /** 题目内容 */
    @Excel(name = "题目内容")
    private String content;

    /** 题目图片 */
    @Excel(name = "题目图片")
    private String image;

    /** 课程ID */
    @Excel(name = "课程ID")
    private String classId;

    /** 知识点 */
    @Excel(name = "知识点")
    private String point;

    /** 答案 */
    @Excel(name = "答案")
    private String answer;

    /** 出题人id */
    @Excel(name = "出题人id")
    private Long setterid;

    /** 整题解析 */
    @Excel(name = "整题解析")
    private String analysis;

    /** 是否删除 */
    @Excel(name = "是否删除")
    private Long isDelete;

    /** A选项 */
    @Excel(name = "A选项")
    private String optionA;

    /** B选项 */
    @Excel(name = "B选项")
    private String optionB;

    /** C选项 */
    @Excel(name = "C选项")
    private String optionC;

    /** D选项 */
    @Excel(name = "D选项")
    private String optionD;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setType(Long type) 
    {
        this.type = type;
    }

    public Long getType() 
    {
        return type;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setImage(String image) 
    {
        this.image = image;
    }

    public String getImage() 
    {
        return image;
    }
    public void setClassId(String classId) 
    {
        this.classId = classId;
    }

    public String getClassId() 
    {
        return classId;
    }
    public void setPoint(String point) 
    {
        this.point = point;
    }

    public String getPoint() 
    {
        return point;
    }
    public void setAnswer(String answer) 
    {
        this.answer = answer;
    }

    public String getAnswer() 
    {
        return answer;
    }
    public void setSetterid(Long setterid) 
    {
        this.setterid = setterid;
    }

    public Long getSetterid() 
    {
        return setterid;
    }
    public void setAnalysis(String analysis) 
    {
        this.analysis = analysis;
    }

    public String getAnalysis() 
    {
        return analysis;
    }
    public void setIsDelete(Long isDelete) 
    {
        this.isDelete = isDelete;
    }

    public Long getIsDelete() 
    {
        return isDelete;
    }
    public void setOptionA(String optionA) 
    {
        this.optionA = optionA;
    }

    public String getOptionA() 
    {
        return optionA;
    }
    public void setOptionB(String optionB) 
    {
        this.optionB = optionB;
    }

    public String getOptionB() 
    {
        return optionB;
    }
    public void setOptionC(String optionC) 
    {
        this.optionC = optionC;
    }

    public String getOptionC() 
    {
        return optionC;
    }
    public void setOptionD(String optionD) 
    {
        this.optionD = optionD;
    }

    public String getOptionD() 
    {
        return optionD;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("type", getType())
            .append("content", getContent())
            .append("image", getImage())
            .append("classId", getClassId())
            .append("point", getPoint())
            .append("answer", getAnswer())
            .append("setterid", getSetterid())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("analysis", getAnalysis())
            .append("isDelete", getIsDelete())
            .append("optionA", getOptionA())
            .append("optionB", getOptionB())
            .append("optionC", getOptionC())
            .append("optionD", getOptionD())
            .toString();
    }
}
