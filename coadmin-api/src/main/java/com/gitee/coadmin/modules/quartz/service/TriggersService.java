package com.gitee.coadmin.modules.quartz.service;


import com.gitee.coadmin.base.CommonService;
import com.gitee.coadmin.modules.quartz.domain.Triggers;

public interface TriggersService extends CommonService<Triggers> {
    Triggers findByJobNameAndGroupName(String jobName, String groupName);
}
