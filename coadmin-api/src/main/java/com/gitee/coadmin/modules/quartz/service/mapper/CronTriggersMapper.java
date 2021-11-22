package com.gitee.coadmin.modules.quartz.service.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gitee.coadmin.base.CommonMapper;
import com.gitee.coadmin.modules.quartz.domain.CronTriggers;
import com.gitee.coadmin.modules.quartz.service.dto.CronInfoDto;
import org.springframework.stereotype.Repository;

/**
* @author wwe
* @date 2021-11-04
*/
@Repository
public interface CronTriggersMapper extends CommonMapper<CronTriggers> {
    IPage<CronInfoDto> getAllJob(IPage<CronInfoDto> page,String jobName,String triggerState);
}
