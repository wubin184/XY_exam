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
import com.ruoyi.system.domain.ExScore;
import com.ruoyi.system.service.IExScoreService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 成绩管理Controller
 * 
 * @author wubin
 * @date 2021-12-01
 */
@RestController
@RequestMapping("/exam/score")
public class ExScoreController extends BaseController
{
    @Autowired
    private IExScoreService exScoreService;

    /**
     * 查询成绩管理列表
     */
    @PreAuthorize("@ss.hasPermi('exam:score:list')")
    @GetMapping("/list")
    public TableDataInfo list(ExScore exScore)
    {
        startPage();
        List<ExScore> list = exScoreService.selectExScoreList(exScore);
        return getDataTable(list);
    }

    /**
     * 导出成绩管理列表
     */
    @PreAuthorize("@ss.hasPermi('exam:score:export')")
    @Log(title = "成绩管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ExScore exScore)
    {
        List<ExScore> list = exScoreService.selectExScoreList(exScore);
        ExcelUtil<ExScore> util = new ExcelUtil<ExScore>(ExScore.class);
        util.exportExcel(response, list, "成绩管理数据");
    }

    /**
     * 获取成绩管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('exam:score:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(exScoreService.selectExScoreById(id));
    }

    /**
     * 新增成绩管理
     */
    @PreAuthorize("@ss.hasPermi('exam:score:add')")
    @Log(title = "成绩管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ExScore exScore)
    {
        return toAjax(exScoreService.insertExScore(exScore));
    }

    /**
     * 修改成绩管理
     */
    @PreAuthorize("@ss.hasPermi('exam:score:edit')")
    @Log(title = "成绩管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ExScore exScore)
    {
        return toAjax(exScoreService.updateExScore(exScore));
    }

    /**
     * 删除成绩管理
     */
    @PreAuthorize("@ss.hasPermi('exam:score:remove')")
    @Log(title = "成绩管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(exScoreService.deleteExScoreByIds(ids));
    }
}
