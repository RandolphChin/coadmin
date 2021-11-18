package com.gitee.coadmin.modules.system.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.IdType;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.bean.copier.CopyOptions;
import com.gitee.coadmin.base.DataEntity;

import javax.validation.constraints.*;
import java.io.Serializable;

/**
* @author jinjin
* @date 2020-09-25
*/
@Data
@TableName("sys_job")
public class Job extends DataEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "ID")
    @TableId(value="id", type= IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "岗位名称")
    @NotBlank
    private String name;

    @ApiModelProperty(value = "岗位状态")
    @NotNull
    private Boolean enabled;

    @ApiModelProperty(value = "排序")
    private Integer sort;

    public void copyFrom(Job source){
        BeanUtil.copyProperties(source,this, CopyOptions.create().setIgnoreNullValue(true));
    }
}
