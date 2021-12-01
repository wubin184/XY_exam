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
import com.ruoyi.system.domain.ExClass;
import com.ruoyi.system.service.IExClassService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 课程管理Controller
 * 
 * @author wubin
 * @date 2021-12-01
 */
@RestController
@RequestMapping("/exam/class")
public class ExClassController extends BaseController
{
    @Autowired
    private IExClassService exClassService;

    /**
     * 查询课程管理列表
     */
    @PreAuthorize("@ss.hasPermi('exam:class:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExClass exClass)
    {
        startPage();
        List<ExClass> list = exClassService.selectExClassList(exClass);
        return getDataTable(list);
    }

    /**
     * 导出课程管理列表
     */
    @PreAuthorize("@ss.hasPermi('exam:class:export')")
    @Log(title = "课程管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExClass exClass)
    {
        List<ExClass> list = exClassService.selectExClassList(exClass);
        ExcelUtil<ExClass> util = new ExcelUtil<ExClass>(ExClass.class);
        util.exportExcel(response, list, "课程管理数据");
    }

    /**
     * 获取课程管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('exam:class:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(exClassService.selectExClassById(id));
    }

    /**
     * 新增课程管理
     */
    @PreAuthorize("@ss.hasPermi('exam:class:add')")
    @Log(title = "课程管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExClass exClass)
    {
        return toAjax(exClassService.insertExClass(exClass));
    }

    /**
     * 修改课程管理
     */
    @PreAuthorize("@ss.hasPermi('exam:class:edit')")
    @Log(title = "课程管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExClass exClass)
    {
        return toAjax(exClassService.updateExClass(exClass));
    }

    /**
     * 删除课程管理
     */
    @PreAuthorize("@ss.hasPermi('exam:class:remove')")
    @Log(title = "课程管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(exClassService.deleteExClassByIds(ids));
    }
}
