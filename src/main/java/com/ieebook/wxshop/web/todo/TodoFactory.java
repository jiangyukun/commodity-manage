package com.ieebook.wxshop.web.todo;

import com.ieebook.wxshop.entity.commodity.CommodityType;

import java.util.ArrayList;
import java.util.List;

/**
 * 测试返回模拟的对象
 * 这个类出现的地方都是需要替换的代码
 * jiangyukun on 2015-11-09 19:43
 */
public class TodoFactory {
    public static List<CommodityType> getCategoryList() {
        List<CommodityType> categoryList = new ArrayList<>();
        CommodityType category = new CommodityType();
        category.setId(1);
        category.setName("Todo");
        categoryList.add(category);

        category = new CommodityType();
        category.setId(2);
        category.setName("Todo1");
        categoryList.add(category);
        return categoryList;
    }
}
