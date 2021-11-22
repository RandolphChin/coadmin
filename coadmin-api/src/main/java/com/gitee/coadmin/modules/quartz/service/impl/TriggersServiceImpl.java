package com.gitee.coadmin.modules.quartz.service.impl;


import com.gitee.coadmin.base.impl.CommonServiceImpl;
import com.gitee.coadmin.modules.quartz.domain.Triggers;
import com.gitee.coadmin.modules.quartz.service.TriggersService;
import com.gitee.coadmin.modules.quartz.service.mapper.TriggersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class TriggersServiceImpl extends CommonServiceImpl<TriggersMapper, Triggers> implements TriggersService {
    @Autowired
    private TriggersMapper triggersMapper;

    public Triggers findByJobNameAndGroupName(String jobName, String groupName){
        Triggers triggers =triggersMapper.findByJobNameAndGroupName(jobName,groupName);
        return triggers;
    }
}
