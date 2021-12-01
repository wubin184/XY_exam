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
import com.ruoyi.system.domain.ExPaper;
import com.ruoyi.system.service.IExPaperService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 试卷管理Controller
 * 
 * @author wubin
 * @date 2021-12-01
 */
@RestController
@RequestMapping("/exam/paper")
public class ExPaperController extends BaseController
{
    @Autowired
    private IExPaperService exPaperService;

    /**
     * 查询试卷管理列表
     */
    @PreAuthorize("@ss.hasPermi('exam:paper:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExPaper exPaper)
    {
        startPage();
        List<ExPaper> list = exPaperService.selectExPaperList(exPaper);

        return getDataTable(list);
    }

    /**
     * 导出试卷管理列表
     */
    @PreAuthorize("@ss.hasPermi('exam:paper:export')")
    @Log(title = "试卷管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExPaper exPaper)
    {
        List<ExPaper> list = exPaperService.selectExPaperList(exPaper);
        ExcelUtil<ExPaper> util = new ExcelUtil<ExPaper>(ExPaper.class);
        util.exportExcel(response, list, "试卷管理数据");
    }

    /**
     * 获取试卷管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('exam:paper:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(exPaperService.selectExPaperById(id));
    }

    /**
     * 新增试卷管理
     */
    @PreAuthorize("@ss.hasPermi('exam:paper:add')")
    @Log(title = "试卷管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExPaper exPaper)
    {
        return toAjax(exPaperService.insertExPaper(exPaper));
    }

    /**
     * 修改试卷管理
     */
    @PreAuthorize("@ss.hasPermi('exam:paper:edit')")
    @Log(title = "试卷管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExPaper exPaper)
    {
        return toAjax(exPaperService.updateExPaper(exPaper));
    }

    /**
     * 删除试卷管理
     */
    @PreAuthorize("@ss.hasPermi('exam:paper:remove')")
    @Log(title = "试卷管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(exPaperService.deleteExPaperByIds(ids));
    }
}
