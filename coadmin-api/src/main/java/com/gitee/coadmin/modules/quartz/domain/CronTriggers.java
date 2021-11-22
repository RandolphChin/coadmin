package com.gitee.coadmin.modules.quartz.domain;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import com.baomidou.mybatisplus.annotation.TableName;
import com.gitee.coadmin.base.CommonModel;
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
@TableName("qrtz_cron_triggers")
public class CronTriggers extends CommonModel<CronTriggers> implements Serializable {
    private static final long serialVersionUID = 1L;

    private String schedName;

    private String triggerName;

    private String triggerGroup;

    private String cronExpression;

    private String timeZoneId;

    public void copyFrom(CronTriggers source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
