package com.gitee.coadmin.modules.cron.service.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import java.util.Objects;
import java.util.Date;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import javax.validation.constraints.*;
import com.gitee.coadmin.base.BaseDto;

/**
 * CRON定时
 * @author wwe
 * @since 2021-11-22
 */
@Getter
@Setter
@NoArgsConstructor
public class ChargerCronDTO extends BaseDto {
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
    @JsonSerialize(using= ToStringSerializer.class) // 防止精度丢失
    private Long jobId;

    @ApiModelProperty(value = "场馆与星期数组合")
    private String jobWeek;

    @ApiModelProperty(value = "ID")
    @JsonSerialize(using= ToStringSerializer.class) // 防止精度丢失
    private Long id;

    @Override
    public boolean equals(Object o) {
      if (this == o) {
        return true;
      }
      if (o == null || getClass() != o.getClass()) {
        return false;
      }
      ChargerCronDTO obj = (ChargerCronDTO) o;
      return Objects.equals(id, obj.id);
    }

    @Override
    public int hashCode() {
      return Objects.hash(id);
    }
}
