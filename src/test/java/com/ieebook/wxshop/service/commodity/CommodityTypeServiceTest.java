package com.ieebook.wxshop.service.commodity;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.ieebook.wxshop.app.RootConfig;
import com.ieebook.wxshop.app.WebConfig;
import com.ieebook.wxshop.entity.commodity.CommodityType;

@RunWith(SpringJUnit4ClassRunner.class)
//@WebAppConfiguration
@ContextConfiguration(classes = {RootConfig.class})
public class CommodityTypeServiceTest {
    @Autowired
    private CommodityTypeService commodityTypeService;

    @Test
    public void save() {
        CommodityType commodityType = new CommodityType();
        commodityType.setMid(1);
        commodityType.setPid(1);
        commodityType.setState(0);
        commodityType.setWeight(1);
        commodityType.setName("体育用品");
        commodityTypeService.newCommodityType(commodityType);

    }

}
