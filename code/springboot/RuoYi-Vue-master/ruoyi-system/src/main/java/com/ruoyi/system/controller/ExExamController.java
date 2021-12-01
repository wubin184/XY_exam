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
import com.ruoyi.system.domain.ExExam;
import com.ruoyi.system.service.IExExamService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 考试Controller
 * 
 * @author wubin
 * @date 2021-12-01
 */
@RestController
@RequestMapping("/exam/examination")
public class ExExamController extends BaseController
{
    @Autowired
    private IExExamService exExamService;

    /**
     * 查询考试列表
     */
    @PreAuthorize("@ss.hasPermi('exam:examination:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExExam exExam)
    {
        startPage();
        List<ExExam> list = exExamService.selectExExamList(exExam);
        return getDataTable(list);
    }

    /**
     * 导出考试列表
     */
    @PreAuthorize("@ss.hasPermi('exam:examination:export')")
    @Log(title = "考试", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExExam exExam)
    {
        List<ExExam> list = exExamService.selectExExamList(exExam);
        ExcelUtil<ExExam> util = new ExcelUtil<ExExam>(ExExam.class);
        util.exportExcel(response, list, "考试数据");
    }

    /**
     * 获取考试详细信息
     */
    @PreAuthorize("@ss.hasPermi('exam:examination:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(exExamService.selectExExamById(id));
    }

    /**
     * 新增考试
     */
    @PreAuthorize("@ss.hasPermi('exam:examination:add')")
    @Log(title = "考试", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExExam exExam)
    {
        return toAjax(exExamService.insertExExam(exExam));
    }

    /**
     * 修改考试
     */
    @PreAuthorize("@ss.hasPermi('exam:examination:edit')")
    @Log(title = "考试", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExExam exExam)
    {
        return toAjax(exExamService.updateExExam(exExam));
    }

    /**
     * 删除考试
     */
    @PreAuthorize("@ss.hasPermi('exam:examination:remove')")
    @Log(title = "考试", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(exExamService.deleteExExamByIds(ids));
    }
}
