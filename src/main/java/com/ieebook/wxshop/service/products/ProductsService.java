package com.ieebook.wxshop.service.products;

import org.springframework.stereotype.Repository;

import com.ieebook.wxshop.entity.products.Products;
import com.ieebook.wxshop.service.BaseService;
@Repository
public class ProductsService extends BaseService{
	public Products getProducts(String barcode){
        return sqlSessionTemplate.selectOne(ServiceSpec.NAMESPACE + "Products.getProducts", barcode);
	}
	
}
