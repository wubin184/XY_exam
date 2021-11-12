package com.ruoyi.system.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.system.domain.ExQuestions;
import com.ruoyi.system.service.IExQuestionsService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 题库管理Controller
 * 
 * @author wubin
 * @date 2021-11-12
 */
@RestController
@RequestMapping("/questions")
public class ExQuestionsController extends BaseController
{
    @Autowired
    private IExQuestionsService exQuestionsService;

    /**
     * 查询题库管理列表
     */
    @RequiresPermissions("exam:questions:list")
    @GetMapping("/list")
    public TableDataInfo list(ExQuestions exQuestions)
    {
        startPage();
        List<ExQuestions> list = exQuestionsService.selectExQuestionsList(exQuestions);
        return getDataTable(list);
    }

    /**
     * 导出题库管理列表
     */
    @RequiresPermissions("exam:questions:export")
    @Log(title = "题库管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExQuestions exQuestions) throws IOException
    {
        List<ExQuestions> list = exQuestionsService.selectExQuestionsList(exQuestions);
        ExcelUtil<ExQuestions> util = new ExcelUtil<ExQuestions>(ExQuestions.class);
        util.exportExcel(response, list, "题库管理数据");
    }

    /**
     * 获取题库管理详细信息
     */
    @RequiresPermissions("exam:questions:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(exQuestionsService.selectExQuestionsById(id));
    }

    /**
     * 新增题库管理
     */
    @RequiresPermissions("exam:questions:add")
    @Log(title = "题库管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExQuestions exQuestions)
    {
        return toAjax(exQuestionsService.insertExQuestions(exQuestions));
    }

    /**
     * 修改题库管理
     */
    @RequiresPermissions("exam:questions:edit")
    @Log(title = "题库管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExQuestions exQuestions)
    {
        return toAjax(exQuestionsService.updateExQuestions(exQuestions));
    }

    /**
     * 删除题库管理
     */
    @RequiresPermissions("exam:questions:remove")
    @Log(title = "题库管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(exQuestionsService.deleteExQuestionsByIds(ids));
    }
}
