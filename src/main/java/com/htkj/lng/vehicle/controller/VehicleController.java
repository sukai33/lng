package com.htkj.lng.vehicle.controller;

import com.htkj.lng.ssm.model.User;
import com.htkj.lng.vehicle.model.Vehicle;
import com.htkj.lng.vehicle.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.enterprise.inject.Model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author lyz
 * @date 2018/1/12 11:11
 */

@Controller
@RequestMapping("/admin")
public class VehicleController
{
    @Autowired
    private VehicleService vehicleService;

    @RequestMapping(value = "findAllVehicle", method = RequestMethod.GET)
    public ModelAndView findAllVehicle()
    {
        ModelAndView modelAndView = new ModelAndView();

        //返回结果List集合  前端遍历显示
        List<Vehicle> list = vehicleService.findAllVehicle();

        //返回车辆信息页面
        modelAndView.setViewName("show-vehicle");
        modelAndView.addObject("VehicleList", list);
        return modelAndView;
    }

    @RequestMapping(value = "findVehicleList" , method = RequestMethod.POST)
    @ResponseBody
    public  List<Vehicle> findVehicleList(HttpServletRequest request,
                                         HttpServletResponse response,
                                         @RequestParam(value = "plateNum", required = false) String plateNum,
                                         @RequestParam(value = "userName", required = false) String userName,
                                         @RequestParam(value = "company", required = false) String company)
    {
        Map<String , Object> requestMap = new HashMap<String , Object>();
        ModelAndView modelAndView = new ModelAndView();

        System.out.println(plateNum);
        System.out.println(userName);
        System.out.println(company);


        if (plateNum != null && plateNum != "")
        {
            requestMap.put("plateNum",plateNum);
        }
        if (userName != null && userName != "")
        {
            requestMap.put("userName", userName);
        }
        if (company != null && company != "")
        {
            requestMap.put("company", company);
        }
        List<Vehicle> list = vehicleService.findVehicleList(requestMap);
        System.out.println(list);
     /*   modelAndView.setViewName("vehicle/vehicle");
        modelAndView.addObject("VehicleList", list);*/
        return list;

    }


    /**
     * 根据id 查询    车辆详细信息
     * @param request ： 请求
     * @param response ： 响应
     * @param id ：车辆id
     * @return ： modelAndView
     */
    @RequestMapping(value = "findVehicleDetail", method = RequestMethod.POST)
    public @ResponseBody
    Vehicle     findVehicleDetail(HttpServletRequest request,
                              HttpServletResponse response, @RequestParam("id") Long id,
                              @RequestParam("plateNum") String plateNum)
    {
        Vehicle vehicle = null;
        Map<String, Object> map = new HashMap<String, Object>();
        if (id != 0)
        {
            map.put("id", id);
            map.put("plateNum", plateNum);
            System.out.println(map);
            vehicle = vehicleService.findVehicleDetail(map);

        }
        return vehicle;
    }


    /*
    * 根据id删除车辆
    * */
    @RequestMapping(value = "deleteVehicle" , method = RequestMethod.GET)
    @ResponseBody
    public ModelAndView deleteVehicle(HttpServletRequest request,
                                @RequestParam("id") Long id)
    {
        Map<String, Object> requestMap = new HashMap<String, Object>();
        ModelAndView modelAndView = new ModelAndView();
        request.getParameter("id");;
        if ( 0 != id)
        {
            requestMap.put("id",id);
            vehicleService.deleteVehicle(requestMap);
            vehicleService.findAllVehicle();
            List<Vehicle> list = vehicleService.findAllVehicle();
            modelAndView.setViewName("show-vehicle");
            modelAndView.addObject("VehicleList", list);
        }
        return modelAndView;
    }


    /*
    *
    * */




}
