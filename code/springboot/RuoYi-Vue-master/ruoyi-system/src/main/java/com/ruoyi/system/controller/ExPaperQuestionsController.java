package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.ExPaperQuestions;
import com.ruoyi.system.service.IExPaperQuestionsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 试卷题目Controller
 * 
 * @author wubin
 * @date 2021-12-01
 */
@RestController
@RequestMapping("/exam/paperQu")
public class ExPaperQuestionsController extends BaseController
{
    @Autowired
    private IExPaperQuestionsService exPaperQuestionsService;

    /**
     * 查询试卷题目列表
     */
    @PreAuthorize("@ss.hasPermi('exam:paperQu:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExPaperQuestions exPaperQuestions)
    {
        startPage();
        List<ExPaperQuestions> list = exPaperQuestionsService.selectExPaperQuestionsList(exPaperQuestions);
        return getDataTable(list);
    }

    /**
     * 导出试卷题目列表
     */
    @PreAuthorize("@ss.hasPermi('exam:paperQu:export')")
    @Log(title = "试卷题目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExPaperQuestions exPaperQuestions)
    {
        List<ExPaperQuestions> list = exPaperQuestionsService.selectExPaperQuestionsList(exPaperQuestions);
        ExcelUtil<ExPaperQuestions> util = new ExcelUtil<ExPaperQuestions>(ExPaperQuestions.class);
        util.exportExcel(response, list, "试卷题目数据");
    }

    /**
     * 获取试卷题目详细信息
     */
    @PreAuthorize("@ss.hasPermi('exam:paperQu:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(exPaperQuestionsService.selectExPaperQuestionsById(id));
    }

    /**
     * 新增试卷题目
     */
    @PreAuthorize("@ss.hasPermi('exam:paperQu:add')")
    @Log(title = "试卷题目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExPaperQuestions exPaperQuestions)
    {
        return toAjax(exPaperQuestionsService.insertExPaperQuestions(exPaperQuestions));
    }

    /**
     * 修改试卷题目
     */
    @PreAuthorize("@ss.hasPermi('exam:paperQu:edit')")
    @Log(title = "试卷题目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExPaperQuestions exPaperQuestions)
    {
        return toAjax(exPaperQuestionsService.updateExPaperQuestions(exPaperQuestions));
    }

    /**
     * 删除试卷题目
     */
    @PreAuthorize("@ss.hasPermi('exam:paperQu:remove')")
    @Log(title = "试卷题目", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(exPaperQuestionsService.deleteExPaperQuestionsByIds(ids));
    }
}
