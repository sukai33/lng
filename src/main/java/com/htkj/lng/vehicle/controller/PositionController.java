package com.htkj.lng.vehicle.controller;

import com.htkj.lng.vehicle.model.Position;
import com.htkj.lng.vehicle.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author lyz
 * @date 2018/1/12 16:01
 */


@Controller
@RequestMapping("/admin")
public class PositionController
{
    @Autowired
    private PositionService positionService;

    @RequestMapping(value = "findAllPosition", method = RequestMethod.GET)
    public ModelAndView findAllPosition()
    {
        ModelAndView modelAndView = new ModelAndView();

        //返回结果List集合  前端遍历显示
        List<Position> list = positionService.findAllPosition();

        //返回位置信息页面
        modelAndView.setViewName("show-position");
        modelAndView.addObject("PositionList", list);
        return modelAndView;
    }

    @RequestMapping(value = "showPosition", method = RequestMethod.GET)
    public ModelAndView showPosition()
    {
        ModelAndView modelAndView = new ModelAndView();
        //返回位置信息页面
        modelAndView.setViewName("position");
        return modelAndView;
    }

    @RequestMapping(value = "findPositionList" , method = RequestMethod.POST)
    @ResponseBody
    public  List<Position> findVehicleList(HttpServletRequest request,
                                          HttpServletResponse response,
                                          @RequestParam(value = "plateNum", required = false) String plateNum,
                                          @RequestParam(value = "status", required = false) String status,
                                          @RequestParam(value = "reportTime", required = false) String reportTime)
    {
        Map<String , Object> requestMap = new HashMap<String , Object>();
        ModelAndView modelAndView = new ModelAndView();

        System.out.println(plateNum);
        System.out.println(status);
        System.out.println(reportTime);


        if (plateNum != null && plateNum != "")
        {
            requestMap.put("plateNum",plateNum);
        }
        if (status != null && status != "")
        {
            requestMap.put("status", status);
        }
        if (reportTime != null && reportTime != "")
        {
            requestMap.put("reportTime", reportTime);
        }
        List<Position> list = positionService.findPositionList(requestMap);
        System.out.println(list);
     /*   modelAndView.setViewName("vehicle/vehicle");
        modelAndView.addObject("VehicleList", list);*/
        return list;

    }

    @RequestMapping(value = "findPosition" , method = RequestMethod.POST)
    @ResponseBody
    public  Position findPosition(HttpServletRequest request,
                                           HttpServletResponse response,
                                           @RequestParam(value = "plateNum", required = false) String plateNum)
    {
        Map<String , Object> requestMap = new HashMap<String , Object>();
        ModelAndView modelAndView = new ModelAndView();
        if (plateNum != null && plateNum != "")
        {
            requestMap.put("plateNum",plateNum.trim());
        }
        System.out.println(positionService.findPosition(requestMap));
        List<Position> list = positionService.findPositionList(requestMap);
        return list.get(0);

    }

}
