package com.gitee.coadmin.modules.quartz.service.dto;

import lombok.Data;

@Data
public class CronInfoDto {

    private String jobName;
    private String groupName;
    private String jobClass;
    private String param;
    private Long prevFireTime;
    private Long nextFireTime;
    private String triggerState;
    private String cronExpression;
}
