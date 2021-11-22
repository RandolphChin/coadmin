package com.gitee.coadmin.modules.quartz.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.gitee.coadmin.base.CommonModel;
import com.gitee.coadmin.modules.quartz.service.dto.TriggersPK;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("qrtz_triggers")
public class Triggers extends CommonModel<CronTriggers> implements Serializable {
    private static final long serialVersionUID = 1L;

    private TriggersPK id;

    private String jobName;
    private String jobGroup;
    private String description;
    private Long prevFireTime;
    private Long nextFireTime;
    private Integer priority;
    private String triggerState;
    private String triggerType;

}
