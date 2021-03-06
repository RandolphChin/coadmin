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
package com.gitee.coadmin.modules.system.rest;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.write.style.column.LongestMatchColumnWidthStyleStrategy;
import com.gitee.coadmin.annotation.UnifiedAPI;
import com.gitee.coadmin.base.PageInfo;
import com.gitee.coadmin.utils.SecurityUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import com.gitee.coadmin.modules.logging.annotation.Log;
import com.gitee.coadmin.config.RsaProperties;
import com.gitee.coadmin.modules.system.domain.User;
import com.gitee.coadmin.exception.BadRequestException;
import com.gitee.coadmin.modules.system.domain.vo.UserPassVo;
import com.gitee.coadmin.modules.system.service.RoleService;
import com.gitee.coadmin.modules.system.service.dto.RoleSmallDto;
import com.gitee.coadmin.modules.system.service.dto.UserDto;
import com.gitee.coadmin.modules.system.service.VerifyService;
import com.gitee.coadmin.modules.system.service.dto.UserQueryParam;
import com.gitee.coadmin.modules.system.service.UserService;
import com.gitee.coadmin.utils.enums.CodeEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Pageable;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author Zheng Jie
 * @date 2018-11-23
 */
@Slf4j
@Api(tags = "?????????????????????")
@UnifiedAPI
@RestController
@RequestMapping("/api/users")
@RequiredArgsConstructor
public class UserController {

    private final PasswordEncoder passwordEncoder;
    private final UserService userService;
    private final RoleService roleService;
    private final VerifyService verificationCodeService;

    @Log("??????????????????")
    @ApiOperation("??????????????????")
    @UnifiedAPI(enable = false)
    @GetMapping(value = "/download")
    @PreAuthorize("@el.check('user:list')")
    public void download(HttpServletResponse response, UserQueryParam criteria) throws IOException {
        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");
        // ??????URLEncoder.encode????????????????????????
        String fileName = URLEncoder.encode("??????????????????", "UTF-8");
        response.setHeader("Content-disposition", "attachment;filename=" + fileName + ".xlsx");
        EasyExcel.write(response.getOutputStream(), UserDto.class)
                .sheet("????????????")
                .registerWriteHandler(new LongestMatchColumnWidthStyleStrategy())
                .doWrite(userService.queryAll(criteria));
    }

    @Log("????????????")
    @ApiOperation("????????????")
    @GetMapping
    @PreAuthorize("@el.check('user:list')")
    public PageInfo<UserDto> query(UserQueryParam query, Pageable pageable){
        return userService.queryAll(query, pageable);
     }

    @Log("????????????")
    @ApiOperation("????????????")
    @PostMapping
    @PreAuthorize("@el.check('user:add')")
    public Integer create(@Validated @RequestBody UserDto resources){
        checkLevel(resources);
        // ???????????? 123456
        resources.setPassword(passwordEncoder.encode("123456"));
        return userService.save(resources)?1:0;
    }

    @Log("????????????")
    @ApiOperation("????????????")
    @PutMapping
    @PreAuthorize("@el.check('user:edit')")
    public Integer update(@Validated(User.Update.class) @RequestBody UserDto resources){
        checkLevel(resources);
        return userService.updateById(resources)?1:0;
    }

    @Log("???????????????????????????")
    @ApiOperation("???????????????????????????")
    @PutMapping(value = "center")
    public void center(@Validated(User.Update.class) @RequestBody User resources){
        if(!resources.getId().equals(SecurityUtils.getCurrentUserId())){
            throw new BadRequestException("????????????????????????");
        }
        userService.updateCenter(resources);
    }

    @Log("????????????")
    @ApiOperation("????????????")
    @DeleteMapping
    @PreAuthorize("@el.check('user:del')")
    public Integer delete(@RequestBody Set<Long> ids){
        for (Long id : ids) {
            Integer currentLevel =  Collections.min(roleService.findByUsersId(SecurityUtils.getCurrentUserId()).stream().map(RoleSmallDto::getLevel).collect(Collectors.toList()));
            Integer optLevel =  Collections.min(roleService.findByUsersId(id).stream().map(RoleSmallDto::getLevel).collect(Collectors.toList()));
            if (currentLevel > optLevel) {
                throw new BadRequestException("????????????????????????????????????" + userService.findById(id).getUsername());
            }
        }
        return userService.removeByIds(ids)?1:0;
    }

    @ApiOperation("????????????")
    @PostMapping(value = "/updatePass")
    public void updatePass(@RequestBody UserPassVo passVo) throws Exception {
        String oldPass = com.gitee.coadmin.utils.RsaUtils.decryptByPrivateKey(RsaProperties.privateKey,passVo.getOldPass());
        String newPass = com.gitee.coadmin.utils.RsaUtils.decryptByPrivateKey(RsaProperties.privateKey,passVo.getNewPass());
        UserDto user = userService.findByName(SecurityUtils.getCurrentUsername());
        if(!passwordEncoder.matches(oldPass, user.getPassword())){
            throw new BadRequestException("??????????????????????????????");
        }
        if(passwordEncoder.matches(newPass, user.getPassword())){
            throw new BadRequestException("?????????????????????????????????");
        }
        userService.updatePass(user.getUsername(),passwordEncoder.encode(newPass));
    }

    @ApiOperation("????????????")
    @PostMapping(value = "/updateAvatar")
    public Map<String, String> updateAvatar(@RequestParam MultipartFile avatar){
        return userService.updateAvatar(avatar);
    }

    @Log("????????????")
    @ApiOperation("????????????")
    @PostMapping(value = "/updateEmail/{code}")
    public void updateEmail(@PathVariable String code,@RequestBody User user) throws Exception {
        String password = com.gitee.coadmin.utils.RsaUtils.decryptByPrivateKey(RsaProperties.privateKey,user.getPassword());
        UserDto userDto = userService.findByName(SecurityUtils.getCurrentUsername());
        if(!passwordEncoder.matches(password, userDto.getPassword())){
            throw new BadRequestException("????????????");
        }
        verificationCodeService.validated(CodeEnum.EMAIL_RESET_EMAIL_CODE.getKey() + user.getEmail(), code);
        userService.updateEmail(userDto.getUsername(),user.getEmail());
    }

    /**
     * ???????????????????????????????????????????????????????????????????????????????????????????????????
     * @param resources /
     */
    private void checkLevel(UserDto resources) {
        Integer currentLevel =  Collections.min(roleService.findByUsersId(SecurityUtils.getCurrentUserId()).stream().map(RoleSmallDto::getLevel).collect(Collectors.toList()));
        Integer optLevel = roleService.findByRoles(resources.getRoles());
        if (currentLevel > optLevel) {
            throw new BadRequestException("??????????????????");
        }
    }
}
