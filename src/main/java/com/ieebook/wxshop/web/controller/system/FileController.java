package com.ieebook.wxshop.web.controller.system;

import com.ieebook.wxshop.business.CloudImageBus;
import com.ieebook.wxshop.core.SystemConfig;
import com.ieebook.wxshop.core.util.HttpUtils;
import com.ieebook.wxshop.core.util.JsonUtils;
import com.ieebook.wxshop.dto.JsonResponse;
import com.ieebook.wxshop.dto.localapi.ImageDto;
import com.ieebook.wxshop.web.support.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * jiangyukun on 15-11-23.
 */
@Controller
@RequestMapping("/file")
public class FileController extends BaseController {
    @Autowired
    private CloudImageBus cloudImageBus;

    @RequestMapping("/upload")
    @ResponseBody
    public JsonResponse<ImageDto> upload(@RequestParam("file") MultipartFile file) throws Exception {
        try {
            String result = HttpUtils.uploadFile(SystemConfig.get("file.upload.server"), SystemConfig.get("file.upload.param"), file.getInputStream());
            logger.debug(result);
            ImageDto imageDto = JsonUtils.readFromString(result, ImageDto.class);
            String imgId = cloudImageBus.saveCloudImage(imageDto);
            imageDto.setImgId(imgId);
            return new JsonResponse<>(imageDto);
        } catch (IOException e) {
            return new JsonResponse<ImageDto>().error();
        }
    }
}
