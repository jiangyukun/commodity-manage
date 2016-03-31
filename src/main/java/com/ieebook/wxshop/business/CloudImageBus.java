package com.ieebook.wxshop.business;

import com.ieebook.wxshop.business.support.BaseBus;
import com.ieebook.wxshop.dto.localapi.ImageDto;
import com.ieebook.wxshop.entity.other.CloudImage;
import com.ieebook.wxshop.service.other.CloudImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

/**
 * jiangyukun on 2015-11-26 20:55.
 */
@Service
public class CloudImageBus extends BaseBus {
    @Autowired
    private CloudImageService cloudImageService;

    public String saveCloudImage(ImageDto imageDto) {
        CloudImage cloudImage = new CloudImage();
        String imgId = UUID.randomUUID().toString();
        cloudImage.setId(imgId);
        cloudImage.setOriginal(imageDto.getImageInfo().getOriginal());
        cloudImage.setThumbnail(imageDto.getImageInfo().getThumbnail());
        cloudImageService.saveCloudImage(cloudImage);
        System.out.println(cloudImage);
        return imgId;
    }
}
