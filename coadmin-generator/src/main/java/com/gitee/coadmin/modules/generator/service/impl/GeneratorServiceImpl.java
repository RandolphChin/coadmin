/*
 *  Copyright 2019-2020 Zheng Jie
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package com.gitee.coadmin.modules.generator.service.impl;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ZipUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gitee.coadmin.base.PageInfo;
import com.gitee.coadmin.base.impl.BaseServiceImpl;
import com.gitee.coadmin.exception.BadRequestException;
import com.gitee.coadmin.modules.generator.domain.ColumnInfo;
import com.gitee.coadmin.modules.generator.domain.GenConfig;
import com.gitee.coadmin.modules.generator.domain.vo.TableInfo;
import com.gitee.coadmin.modules.generator.service.GeneratorService;
import com.gitee.coadmin.modules.generator.service.mapper.ColumnInfoMapper;
import com.gitee.coadmin.modules.generator.utils.GenUtil;
import com.gitee.coadmin.utils.FileUtil;
import com.gitee.coadmin.utils.PageUtil;
import com.gitee.coadmin.utils.StringUtils;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author Zheng Jie
 * @date 2019-01-02
 */
@Service
@RequiredArgsConstructor
public class GeneratorServiceImpl extends BaseServiceImpl<ColumnInfo> implements GeneratorService {

    private static final Logger log = LoggerFactory.getLogger(GeneratorServiceImpl.class);
    private final ColumnInfoMapper columnInfoMapper;

    @Override
    public List<TableInfo> getTables() {
        /*String sql = "select table_name ,create_time , engine, table_collation, table_comment from information_schema.tables " +
                "where table_schema = (select database()) " +
                "order by create_time desc";*/
        return columnInfoMapper.getTables();
    }

    @Override
    public PageInfo<TableInfo> getTables(String name, Pageable pageable) {
        // ?????????????????????sql??????
        /* String sql = "select table_name ,create_time , engine, table_collation, table_comment from information_schema.tables " +
                "where table_schema = (select database()) " +
                "and table_name like ? order by create_time desc";
        Query query = em.createNativeQuery(sql);
        query.setFirstResult(startEnd[0]);
        query.setMaxResults(startEnd[1] - startEnd[0]);
        query.setParameter(1, StringUtils.isNotBlank(name) ? ("%" + name + "%") : "%%");
        List result = query.getResultList();
        List<TableInfo> tableInfos = new ArrayList<>();
        for (Object obj : result) {
            Object[] arr = (Object[]) obj;
            tableInfos.add(new TableInfo(arr[0], arr[1], arr[2], arr[3], ObjectUtil.isNotEmpty(arr[4]) ? arr[4] : "-"));
        }*/



        IPage<?> page = PageUtil.toMybatisPage(pageable, true);
        IPage<TableInfo> pageList = columnInfoMapper.selectPageOfTables(page, "%"+name+"%");
        return PageUtil.toPage(pageList.getRecords(), pageList.getTotal());

        // Query query1 = em.createNativeQuery("SELECT COUNT(*) from information_schema.tables where table_schema = (select database())");
        //Object totalElements = baseMapper.getTablesTotal();

        //return PageUtil.toPage(tableInfos, totalElements);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public List<ColumnInfo> getColumns(String tableName) {
        QueryWrapper<ColumnInfo> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ColumnInfo::getTableName, tableName).orderByAsc(ColumnInfo::getId);
        List<ColumnInfo> columnInfos = columnInfoMapper.selectList(wrapper);

        if (CollectionUtil.isNotEmpty(columnInfos)) {
            return columnInfos;
        } else {
            columnInfos = query(tableName);
            for (ColumnInfo info: columnInfos) {
                columnInfoMapper.insert(info);
            }
            return columnInfos;
        }
    }

    @Override
    public List<ColumnInfo> query(String tableName) {
        // ?????????????????????sql??????
        /*String sql = "select column_name, is_nullable, data_type, column_comment, column_key, extra from information_schema.columns " +
                "where table_name = ? and table_schema = (select database()) order by ordinal_position";
        Query query = em.createNativeQuery(sql);
        query.setParameter(1, tableName);
        List result = query.getResultList();
        List<ColumnInfo> columnInfos = new ArrayList<>();
        for (Object obj : result) {
            Object[] arr = (Object[]) obj;
            columnInfos.add(
                    new ColumnInfo(
                            tableName,
                            arr[0].toString(),
                            "NO".equals(arr[1]),
                            arr[2].toString(),
                            ObjectUtil.isNotNull(arr[3]) ? arr[3].toString() : null,
                            ObjectUtil.isNotNull(arr[4]) ? arr[4].toString() : null,
                            ObjectUtil.isNotNull(arr[5]) ? arr[5].toString() : null)
            );
        }*/
        return columnInfoMapper.queryColumnInfo(tableName);
    }

    /*
     *
     */
    @Override
    @Transactional
    public void sync(List<ColumnInfo> columnInfos, List<ColumnInfo> columnInfoListFromI_information_schema) {
        // ????????????????????????????????????????????????????????????
        for (ColumnInfo columnInfo : columnInfoListFromI_information_schema) {
            // ????????????????????????
            List<ColumnInfo> columns = columnInfos.stream().filter(c -> c.getColumnName().equals(columnInfo.getColumnName())).collect(Collectors.toList());
            // ????????????????????????????????????????????????
            if (CollectionUtil.isNotEmpty(columns)) {
                ColumnInfo column = columns.get(0);
                column.setColumnType(columnInfo.getColumnType());
                column.setExtra(columnInfo.getExtra());
                column.setKeyType(columnInfo.getKeyType());
                if (StringUtils.isBlank(column.getRemark())) {
                    column.setRemark(columnInfo.getRemark());
                }
                columnInfoMapper.updateById(column);
            } else {
                // ??????????????????????????????????????????
                columnInfoMapper.insert(columnInfo);
            }
        }
        // ??????????????????????????????????????????
        for (ColumnInfo columnInfo : columnInfos) {
            // ????????????????????????
            List<ColumnInfo> columns = columnInfoListFromI_information_schema.stream().filter(c -> c.getColumnName().equals(columnInfo.getColumnName())).collect(Collectors.toList());
            // ????????????????????????????????????????????????????????????????????????
            if (CollectionUtil.isEmpty(columns)) {
                // columnInfoRepository.delete(columnInfo);
                columnInfoMapper.deleteById(columnInfo.getId());
            }
        }
    }

    @Override
    @Transactional
    public void save(List<ColumnInfo> columnInfos) {
        for (ColumnInfo info: columnInfos) {
            if (info.getId() == null) {
                columnInfoMapper.insert(info);
            } else {
                columnInfoMapper.updateById(info);
            }
        }
    }

    @Override
    public void generator(GenConfig genConfig, List<ColumnInfo> columns) {
        if (genConfig.getId() == null) {
            throw new BadRequestException("?????????????????????");
        }
        try {
            GenUtil.generatorCode(columns, genConfig);
        } catch (IOException e) {
            log.error(e.getMessage(), e);
            throw new BadRequestException("????????????????????????????????????????????????");
        }
    }

    @Override
    public ResponseEntity<Object> preview(GenConfig genConfig, List<ColumnInfo> columns) {
        if (genConfig.getId() == null) {
            throw new BadRequestException("?????????????????????");
        }
        List<Map<String, Object>> genList = GenUtil.preview(columns, genConfig);
        return new ResponseEntity<>(genList, HttpStatus.OK);
    }

    @Override
    public void download(GenConfig genConfig, List<ColumnInfo> columns, HttpServletRequest request, HttpServletResponse response) {
        if (genConfig.getId() == null) {
            throw new BadRequestException("?????????????????????");
        }
        try {
            File file = new File(GenUtil.download(columns, genConfig));
            String zipPath = file.getPath() + ".zip";
            ZipUtil.zip(file.getPath(), zipPath);
            FileUtil.downloadFile(request, response, new File(zipPath), true);
        } catch (IOException e) {
            throw new BadRequestException("????????????");
        }
    }
}
