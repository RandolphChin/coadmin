package com.gitee.coadmin.modules.quartz.service.mapper;

import com.gitee.coadmin.base.CommonMapper;
import com.gitee.coadmin.modules.quartz.domain.Triggers;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface TriggersMapper extends CommonMapper<Triggers> {
    @Select("select SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP,JOB_NAME,JOB_GROUP,DESCRIPTION,PREV_FIRE_TIME,NEXT_FIRE_TIME,PRIORITY,TRIGGER_STATE,TRIGGER_TYPE from qrtz_triggers where TRIGGER_NAME = #{jobName} and TRIGGER_GROUP = #{groupName}")
    @Results({
            @Result(id=true, property = "id.schedName", column = "SCHED_NAME"),
            @Result(id=true, property = "id.triggerName", column = "TRIGGER_NAME"),
            @Result(id=true, property = "id.triggerGroup", column = "TRIGGER_GROUP"),
            @Result(property = "jobName", column = "JOB_NAME"),
            @Result(property = "jobGroup", column = "JOB_GROUP"),
            @Result(property = "description", column = "DESCRIPTION"),
            @Result(property = "prevFireTime", column = "PREV_FIRE_TIME"),
            @Result(property = "nextFireTime", column = "NEXT_FIRE_TIME"),
            @Result(property = "priority", column = "PRIORITY"),
            @Result(property = "triggerState", column = "TRIGGER_STATE"),
            @Result(property = "triggerType", column = "TRIGGER_TYPE")
    })
    Triggers findByJobNameAndGroupName(String jobName, String groupName);
}
