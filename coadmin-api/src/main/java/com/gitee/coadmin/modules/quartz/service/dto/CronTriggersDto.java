package com.gitee.coadmin.modules.quartz.service.dto;

import lombok.*;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* @author wwe
* @date 2021-11-04
*/
@Data
@Builder
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class CronTriggersDto implements Serializable {
    private static final long serialVersionUID = 1L;

    private String schedName;

    private String triggerName;

    private String triggerGroup;

    private String cronExpression;

    private String timeZoneId;
}
