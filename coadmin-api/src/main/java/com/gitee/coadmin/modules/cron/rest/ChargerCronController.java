package com.gitee.coadmin.modules.cron.rest;

import com.gitee.coadmin.annotation.UnifiedAPI;
import com.gitee.coadmin.base.PageInfo;
import com.gitee.coadmin.modules.logging.annotation.Log;
import com.gitee.coadmin.modules.logging.annotation.type.LogActionType;
import com.gitee.coadmin.modules.cron.service.ChargerCronService;
import com.gitee.coadmin.modules.cron.service.dto.ChargerCronDTO;
import com.gitee.coadmin.modules.cron.service.dto.ChargerCronQueryParam;
import org.springframework.data.domain.Pageable;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.*;
import java.util.Set;
import com.alibaba.excel.write.style.column.LongestMatchColumnWidthStyleStrategy;
import com.alibaba.excel.EasyExcel;
import com.gitee.coadmin.modules.system.service.dto.UserQueryParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;


/*  添加菜单的 SQL
INSERT INTO sys_menu(pid, sub_count, `type`, title, title_letter, component_name, `component`, sort, `path`, i_frame, `cache`, hidden, permission)
    VALUES (121, 4, 1, 'CRON定时', 'CRONds', 'ChargerCron', 'cron/index', 10, '', 0, 0, 0, '');
SELECT @lastId:=LAST_INSERT_ID();
INSERT INTO sys_menu(pid, sub_count, `type`, title, sort, i_frame, `cache`, hidden, permission)
    VALUES (@lastId, 0, 2, '查看CRON定时', 10, 0, 0, 0, 'chargerCron:list');
INSERT INTO sys_menu(pid, sub_count, `type`, title, sort, i_frame, `cache`, hidden, permission)
    VALUES (@lastId, 0, 2, '新增CRON定时', 20, 0, 0, 0, 'chargerCron:add');
INSERT INTO sys_menu(pid, sub_count, `type`, title, sort, i_frame, `cache`, hidden, permission)
    VALUES (@lastId, 0, 2, '修改CRON定时', 30, 0, 0, 0, 'chargerCron:edit');
INSERT INTO sys_menu(pid, sub_count, `type`, title, sort, i_frame, `cache`, hidden, permission)
    VALUES (@lastId, 0, 2, '删除CRON定时', 40, 0, 0, 0, 'chargerCron:del');
*/

/**
 * @author wwe
 * @since 2021-11-22
 **/
@UnifiedAPI
@RestController
@RequiredArgsConstructor
@Api(tags = "CRON定时")
@RequestMapping("/api/cron")
public class ChargerCronController {

    private final ChargerCronService chargerCronService;

    @GetMapping
    @Log("查询CRON定时")
    @ApiOperation("查询CRON定时")
    @PreAuthorize("@el.check('chargerCron:list')")
    public PageInfo<ChargerCronDTO> query(ChargerCronQueryParam query, Pageable pageable){
        return chargerCronService.queryAll(query,pageable);
    }

    @PostMapping
    @Log(value = "新增CRON定时", type = LogActionType.ADD)
    @ApiOperation("新增CRON定时")
    @PreAuthorize("@el.check('chargerCron:add')")
    public Integer create(@Validated @RequestBody ChargerCronDTO res){
        return chargerCronService.insert(res);
    }

    @PutMapping
    @Log(value = "修改CRON定时", type = LogActionType.UPDATE)
    @ApiOperation("修改CRON定时")
    @PreAuthorize("@el.check('chargerCron:edit')")
    public Integer update(@Validated @RequestBody ChargerCronDTO res){
        return chargerCronService.updateById(res);
    }

    @DeleteMapping
    @Log(value = "删除CRON定时", type = LogActionType.DELETE)
    @ApiOperation("删除CRON定时")
    @PreAuthorize("@el.check('chargerCron:del')")
    public Integer delete(@RequestBody Set<Long> ids) {
        return chargerCronService.removeByIds(ids);
    }

    @Log("导出CRON定时")
    @ApiOperation("导出CRON定时")
    @UnifiedAPI(enable = false)
    @GetMapping(value = "/download")
    @PreAuthorize("@el.check('chargerCron:list')")
    public void download(HttpServletResponse response, ChargerCronQueryParam criteria) throws IOException {
        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");
        // 这里URLEncoder.encode可以防止中文乱码
        String fileName = URLEncoder.encode("导出CRON定时", "UTF-8");
        response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
        EasyExcel.write(response.getOutputStream(), ChargerCronDTO.class)
            .sheet("CRON定时")
            .registerWriteHandler(new LongestMatchColumnWidthStyleStrategy())
            .doWrite(chargerCronService.queryAll(criteria));
    }
}
