package com.gitee.coadmin.modules.cron.service.converter;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.gitee.coadmin.base.PageInfo;
import com.gitee.coadmin.modules.cron.domain.ChargerCron;
import com.gitee.coadmin.modules.cron.service.dto.ChargerCronDTO;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

import java.util.List;

/**
 * @author wwe
 * @since 2021-11-22
 */
@Mapper(componentModel = "spring", unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface ChargerCronConverter {
    /**
     * DTO转Entity
     * @param dto /
     * @return /
     */
    ChargerCron toEntity(ChargerCronDTO dto);

    /**
     * Entity转DTO
     * @param entity /
     * @return /
     */
    ChargerCronDTO toDto(ChargerCron entity);

    /**
     * DTO集合转Entity集合
     * @param dtoList /
     * @return /
     */
    List<ChargerCron> toEntity(List<ChargerCronDTO> dtoList);

    /**
     * Entity集合转DTO集合
     * @param entityList /
     * @return /
     */
    List <ChargerCronDTO> toDto(List<ChargerCron> entityList);

    default PageInfo<ChargerCronDTO> convertPage(IPage<ChargerCron> page) {
        if (page == null) {
            return null;
        }
        PageInfo<ChargerCronDTO> pageInfo = new PageInfo<>();
        pageInfo.setTotalElements(page.getTotal());
        pageInfo.setContent(toDto(page.getRecords()));
        return pageInfo;
    }
}
