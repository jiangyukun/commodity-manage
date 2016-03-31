package com.ieebook.wxshop.weixin.dto.receive.base;

import com.ieebook.wxshop.core.exception.WeixinMessageConvertException;
import com.ieebook.wxshop.weixin.dto.common.GenericXmlMessage;

/**
 * jiangyukun on 2015-11-07 23:43.
 */
public interface IMessageBuilder {
    GenericXmlMessage build(String xml) throws WeixinMessageConvertException;
}
