package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 课程管理对象 ex_class
 * 
 * @author wubin
 * @date 2021-12-01
 */
public class ExClass extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 课程ID */
    private Long id;

    /** 课程名 */
    @Excel(name = "课程名")
    private String className;

    /** 课程简介 */
    @Excel(name = "课程简介")
    private String content;

    /** 专业 */
    @Excel(name = "专业")
    private String major;

    /** 授课老师 */
    @Excel(name = "授课老师")
    private String teacher;

    /** 学生成员数组 */
    @Excel(name = "学生成员数组")
    private String students;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setClassName(String className) 
    {
        this.className = className;
    }

    public String getClassName() 
    {
        return className;
    }
    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }
    public void setMajor(String major) 
    {
        this.major = major;
    }

    public String getMajor() 
    {
        return major;
    }
    public void setTeacher(String teacher) 
    {
        this.teacher = teacher;
    }

    public String getTeacher() 
    {
        return teacher;
    }
    public void setStudents(String students) 
    {
        this.students = students;
    }

    public String getStudents() 
    {
        return students;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("className", getClassName())
            .append("content", getContent())
            .append("major", getMajor())
            .append("teacher", getTeacher())
            .append("students", getStudents())
            .toString();
    }
}
