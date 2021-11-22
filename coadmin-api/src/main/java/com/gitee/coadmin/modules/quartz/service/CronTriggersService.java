package com.gitee.coadmin.modules.quartz.service;


import com.gitee.coadmin.base.CommonService;
import com.gitee.coadmin.base.PageInfo;
import com.gitee.coadmin.modules.quartz.domain.CronTriggers;
import com.gitee.coadmin.modules.quartz.service.dto.CronTriggersDto;
import com.gitee.coadmin.modules.quartz.service.dto.CronTriggersQueryParam;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Set;

/**
* @author wwe
* @date 2021-11-04
*/
public interface CronTriggersService extends CommonService<CronTriggers> {

    static final String CACHE_KEY = "cronTriggers";

    /**
    * 查询数据分页
    * @param query 条件
    * @param pageable 分页参数
    * @return PageInfo<CronTriggersDto>
    */
    PageInfo<CronTriggersDto> queryAll(CronTriggersQueryParam query, Pageable pageable);

    /**
    * 查询所有数据不分页
    * @param query 条件参数
    * @return List<CronTriggersDto>
    */
    List<CronTriggersDto> queryAll(CronTriggersQueryParam query);

    CronTriggers getById(String id);
    CronTriggersDto findById(String id);

    /**
     * 插入一条新数据。
     */
    int insert(CronTriggersDto resources);
    int updateById(CronTriggersDto resources);
    int removeById(String id);
    int removeByIds(Set<String> ids);

    /**
    * 导出数据
    * @param all 待导出的数据
    * @param response /
    * @throws IOException /
    */
    // void download(List<CronTriggersDto> all, HttpServletResponse response) throws IOException;
}
