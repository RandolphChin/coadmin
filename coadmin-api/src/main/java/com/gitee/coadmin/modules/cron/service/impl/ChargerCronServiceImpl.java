package com.gitee.coadmin.modules.cron.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gitee.coadmin.base.impl.CommonServiceImpl;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import com.gitee.coadmin.utils.QueryHelpMybatisPlus;
import com.gitee.coadmin.base.PageInfo;
import com.gitee.coadmin.utils.PageUtil;
import com.gitee.coadmin.modules.cron.domain.ChargerCron;
import com.gitee.coadmin.modules.cron.service.ChargerCronService;
import com.gitee.coadmin.modules.cron.service.dto.ChargerCronDTO;
import com.gitee.coadmin.modules.cron.service.dto.ChargerCronQueryParam;
import com.gitee.coadmin.modules.cron.service.mapper.ChargerCronMapper;
import com.gitee.coadmin.modules.cron.service.converter.ChargerCronConverter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
// 默认不使用缓存
//import org.springframework.cache.annotation.CacheConfig;
//import org.springframework.cache.annotation.CacheEvict;
//import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Pageable;
import java.util.*;

/**
 * @author wwe
 * @since 2021-11-22
 */
@Service
@RequiredArgsConstructor
// @CacheConfig(cacheNames = ChargerCronService.CACHE_KEY)
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true, rollbackFor = Exception.class)
public class ChargerCronServiceImpl extends CommonServiceImpl<ChargerCronMapper, ChargerCron> implements ChargerCronService {

    // private final RedisUtils redisUtils;
    private final ChargerCronMapper chargerCronMapper;
    private final ChargerCronConverter chargerCronConverter;

    @Override
    public PageInfo<ChargerCronDTO> queryAll(ChargerCronQueryParam query, Pageable pageable) {
        IPage<ChargerCron> queryPage = PageUtil.toMybatisPage(pageable);
        IPage<ChargerCron> page = chargerCronMapper.selectPage(queryPage, QueryHelpMybatisPlus.getPredicate(query));
        return chargerCronConverter.convertPage(page);
    }

    @Override
    public List<ChargerCronDTO> queryAll(ChargerCronQueryParam query){
        return chargerCronConverter.toDto(chargerCronMapper.selectList(QueryHelpMybatisPlus.getPredicate(query)));
    }

    @Override
    // @Cacheable(key = "'id:' + #p0")
    public ChargerCronDTO getById(Long id) {
        if (id == null) {
            return null;
        }
        return chargerCronConverter.toDto(chargerCronMapper.selectById(id));
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insert(ChargerCronDTO res) {
        ChargerCron entity = chargerCronConverter.toEntity(res);
        int ret = chargerCronMapper.insert(entity);
        res.setId(entity.getId());
        return ret;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int updateById(ChargerCronDTO res){
        ChargerCron entity = chargerCronConverter.toEntity(res);
        int ret = chargerCronMapper.updateById(entity);
        // delCaches(res.id);
        return ret;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int removeByIds(Set<Long> ids){
        // delCaches(ids);
        return chargerCronMapper.deleteBatchIds(ids);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public int removeById(Long id){
        Set<Long> set = new HashSet<>(1);
        set.add(id);
        return this.removeByIds(set);
    }

    /*
    private void delCaches(Long id) {
        redisUtils.delByKey(CACHE_KEY + "::id:", id);
    }

    private void delCaches(Set<Long> ids) {
        for (Long id: ids) {
            delCaches(id);
        }
    }*/
}
