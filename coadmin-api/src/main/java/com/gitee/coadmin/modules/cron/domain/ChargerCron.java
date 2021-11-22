package com.gitee.coadmin.modules.cron.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.IdType;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import java.util.Date;
import java.util.Objects;
import com.gitee.coadmin.base.BaseEntity;

/**
 * CRON定时
 * @author wwe
 * @since 2021-11-22
 */
@Getter
@Setter
@NoArgsConstructor
@TableName("ali_charger_cron")
public class ChargerCron extends BaseEntity {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "星期几")
    private String name;

    @ApiModelProperty(value = "开机cron表达式")
    private String cronOpen;

    @ApiModelProperty(value = "关机cron表达式")
    private String cronClose;

    @ApiModelProperty(value = "是否暂停")
    private Boolean status;

    @ApiModelProperty(value = "场馆")
    private Long jobId;

    @ApiModelProperty(value = "场馆与星期数组合")
    private String jobWeek;

    @ApiModelProperty(value = "ID")
    @TableId(type= IdType.AUTO)
    private Long id;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ChargerCron obj = (ChargerCron) o;
        return Objects.equals(id, obj.id);
    }
    
    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    public void copyFrom(ChargerCron source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
