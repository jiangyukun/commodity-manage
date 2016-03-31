package com.ieebook.wxshop.business;

import com.ieebook.wxshop.app.RootConfig;
import com.ieebook.wxshop.dto.commodity.CommodityDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * jiangyukun on 2015-11-27 10:15
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
public class CommodityBusTest {
    @Autowired
    private CommodityBus commodityBus;

    @Test
    public void testGetCommodityDetail() throws Exception {
        CommodityDto commodityDto = commodityBus.getCommodityDetail(66);
        System.out.println(commodityDto);
    }

//    @Test
    public void testUser() {
        System.out.println(System.getProperty("user"));
    }
}