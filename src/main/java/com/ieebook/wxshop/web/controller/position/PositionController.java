package com.ieebook.wxshop.web.controller.position;


import com.ieebook.wxshop.business.PositionBus;
import com.ieebook.wxshop.dto.JsonResponse;
import com.ieebook.wxshop.entity.place.City;
import com.ieebook.wxshop.entity.place.Province;
import com.ieebook.wxshop.entity.place.Town;
import com.ieebook.wxshop.entity.position.ServeDistrict;
import com.ieebook.wxshop.service.place.PlaceService;
import com.ieebook.wxshop.service.position.ServeDistrictService;
import com.ieebook.wxshop.web.support.BaseController;
import com.ieebook.wxshop.weixin.dto.position.PositionPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * jiangyukun on 2015-11-05 15:02
 */
@Controller
@RequestMapping("/position")
@SessionAttributes({"merchantId"})
public class PositionController extends BaseController {

    @Autowired
    private PlaceService placeService;
    @Autowired
    private ServeDistrictService serve_districtService;
    @Autowired
    private PositionBus positionBus;

    @RequestMapping("/manage")
    public String mybatis(@ModelAttribute("merchantId") int merchantId, ModelMap modelMap) {
        List<PositionPage> positionPageList = positionBus.getPositionPage(merchantId);
        modelMap.put("positionPageList", positionPageList);
        return "/position/positionManage";
    }

    @RequestMapping("/edit")
    public String edit(ModelMap modelMap) {
        List<Province> provinceList = placeService.getAllprovince();
        modelMap.put("provinceList", provinceList);
        String strid = this.getParam("id");
        int isupdate = 1;
        if (strid.equals("")) {
            isupdate = 0;
        } else {
            int id = Integer.valueOf(strid);
            ServeDistrict serveDistrict = serve_districtService.getServe_districtById(id);
            List<City> cityList = placeService.getAllCityByProvince(String.valueOf(serveDistrict.getPid()));
            List<Town> townList = placeService.getAllTownByCityId(serveDistrict.getCid());
            modelMap.put("serveDistrict", serveDistrict);
            modelMap.put("cityList", cityList);
            modelMap.put("townList", townList);
            modelMap.put("id", serveDistrict.getId());
        }
        modelMap.put("isupdate", isupdate);
        return "/position/edit";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse delete(int id) {
        serve_districtService.deleteServe_district(id);
        JsonResponse<ServeDistrict> jsonresponse = new JsonResponse<ServeDistrict>();
        jsonresponse.setSuccess(null);
        return jsonresponse;
    }

    @RequestMapping(value = "/insert", method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse insert(@ModelAttribute("merchantId") int merchantId, ServeDistrict serve_district) {
        serve_district.setMid(merchantId);
        serve_district.setCreatedBy(merchantId);
        serve_district.setUpdatedBy(merchantId);
        serve_districtService.createServe_district(serve_district);
        JsonResponse<ServeDistrict> jsonresponse = new JsonResponse<ServeDistrict>();
        jsonresponse.setSuccess(null);
        return jsonresponse;
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse update(@ModelAttribute("merchantId") int merchantId, ServeDistrict serve_district) {
        serve_district.setUpdatedBy(merchantId);
        serve_districtService.updateServe_district(serve_district);
        JsonResponse<ServeDistrict> jsonresponse = new JsonResponse<ServeDistrict>();
        jsonresponse.setSuccess(null);
        return jsonresponse;
    }

    @RequestMapping(value = "/city", method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse<List<City>> city(String provinceid) {
        List<City> list = placeService.getAllCityByProvince(provinceid);
        JsonResponse<List<City>> jsonresponse = new JsonResponse<List<City>>();
        jsonresponse.setSuccess(list);
        return jsonresponse;
    }

    @RequestMapping(value = "/town", method = RequestMethod.POST)
    @ResponseBody
    public JsonResponse<List<Town>> town(int cityid) {
        List<Town> list = placeService.getAllTownByCityId(cityid);
        JsonResponse<List<Town>> jsonresponse = new JsonResponse<List<Town>>();
        jsonresponse.setSuccess(list);
        return jsonresponse;
    }
}
