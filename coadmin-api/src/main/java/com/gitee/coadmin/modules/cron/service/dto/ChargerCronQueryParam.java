package com.gitee.coadmin.modules.cron.service.dto;

import lombok.Getter;
import lombok.Setter;
import java.util.List;
import java.util.Date;
import com.gitee.coadmin.annotation.Query;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * @author wwe
 * @since 2021-11-22
 */
@Getter
@Setter
public class ChargerCronQueryParam{

    /** 模糊 */
    @Query(type = Query.Type.INNER_LIKE)
    private String name;

    /** 精确 */
    
    @Query
    private String cronOpen;

    /** 精确 */
    
    @Query
    private String cronClose;

}
