package com.htkj.lng.vehicle.service.impl;

import com.htkj.lng.vehicle.dao.VehicleDao;
import com.htkj.lng.vehicle.model.Vehicle;
import com.htkj.lng.vehicle.service.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author lyz
 * @date 2018/1/12 10:46
 */


@Service
public class VehicleServiceImpl implements VehicleService
{


    @Autowired
    protected VehicleDao vehicleDao;

    public List<Vehicle> findAllVehicle()
    {
        return vehicleDao.findAllVehicle();
    }

    public List<Vehicle> findVehicleList(Map<String, Object> requestMap)
    {
        return vehicleDao.findVehicleList(requestMap);
    }

    public Vehicle findVehicleDetail(Map<String, Object> map)
    {
        return vehicleDao.findVehicleDetail(map);
    }

    public void deleteVehicle(Map<String, Object> requestMap)
    {
         vehicleDao.deleteVehicle(requestMap);
    }

    public void updateVehicle(Vehicle vehicle)
    {
        vehicleDao.updateVehicle(vehicle);
    }
}
