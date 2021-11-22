package com.gitee.coadmin.modules.cron.service;

import com.gitee.coadmin.base.CommonService;
import com.gitee.coadmin.base.PageInfo;
import com.gitee.coadmin.modules.cron.domain.ChargerCron;
import com.gitee.coadmin.modules.cron.service.dto.ChargerCronDTO;
import com.gitee.coadmin.modules.cron.service.dto.ChargerCronQueryParam;
import org.springframework.data.domain.Pageable;
import java.util.List;
import java.util.Set;

/**
 * CRON定时
 * @author wwe
 * @since 2021-11-22
 */
public interface ChargerCronService extends CommonService<ChargerCron> {

    String CACHE_KEY = "cron/charger-cron";

    /**
    * 查询数据分页
    * @param query 条件
    * @param pageable 分页参数
    * @return PageInfo<ChargerCronDTO>
    */
    PageInfo<ChargerCronDTO> queryAll(ChargerCronQueryParam query, Pageable pageable);

    /**
    * 查询所有数据不分页
    * @param query 条件参数
    * @return List<ChargerCronDTO>
    */
    List<ChargerCronDTO> queryAll(ChargerCronQueryParam query);

    ChargerCronDTO getById(Long id);

    /**
     * 插入一条新数据。
     */
    int insert(ChargerCronDTO res);
    int updateById(ChargerCronDTO res);
    int removeById(Long id);
    int removeByIds(Set<Long> ids);
}
