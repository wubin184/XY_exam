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
import com.ruoyi.system.domain.ExQuestions;
import com.ruoyi.system.service.IExQuestionsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 题库管理Controller
 * 
 * @author wubin
 * @date 2021-12-01
 */
@RestController
@RequestMapping("/questions/questions")
public class ExQuestionsController extends BaseController
{
    @Autowired
    private IExQuestionsService exQuestionsService;

    /**
     * 查询题库管理列表
     */
    @PreAuthorize("@ss.hasPermi('questions:questions:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExQuestions exQuestions)
    {
        startPage();
        List<ExQuestions> list = exQuestionsService.selectExQuestionsList(exQuestions);
//        list.get(1).setAnswer("热部署222");
        return getDataTable(list);
    }

    /**
     * 导出题库管理列表
     */
    @PreAuthorize("@ss.hasPermi('questions:questions:export')")
    @Log(title = "题库管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExQuestions exQuestions)
    {
        List<ExQuestions> list = exQuestionsService.selectExQuestionsList(exQuestions);
        ExcelUtil<ExQuestions> util = new ExcelUtil<ExQuestions>(ExQuestions.class);
        util.exportExcel(response, list, "题库管理数据");
    }

    /**
     * 获取题库管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('questions:questions:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(exQuestionsService.selectExQuestionsById(id));
    }

    /**
     * 新增题库管理
     */
    @PreAuthorize("@ss.hasPermi('questions:questions:add')")
    @Log(title = "题库管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExQuestions exQuestions)
    {
        return toAjax(exQuestionsService.insertExQuestions(exQuestions));
    }

    /**
     * 修改题库管理
     */
    @PreAuthorize("@ss.hasPermi('questions:questions:edit')")
    @Log(title = "题库管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExQuestions exQuestions)
    {
        return toAjax(exQuestionsService.updateExQuestions(exQuestions));
    }

    /**
     * 删除题库管理
     */
    @PreAuthorize("@ss.hasPermi('questions:questions:remove')")
    @Log(title = "题库管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(exQuestionsService.deleteExQuestionsByIds(ids));
    }
}
