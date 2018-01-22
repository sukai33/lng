package com.htkj.lng.vehicle.service;

import com.htkj.lng.vehicle.model.Vehicle;

import java.util.List;
import java.util.Map;

/**
 * @author lyz
 * @date 2018/1/12 10:46
 */
public interface VehicleService
{
   public List<Vehicle> findAllVehicle();

   /*
    *  用户根据条件查询车辆
    *  @param requestMap ：查询条件
    *  @return requestMap ：车辆列表
    * */
   public List<Vehicle> findVehicleList(Map<String, Object> requestMap);

   /*
   * 根据id查询 车辆记录详细信息
   *@param map : id plateNum
   *@returnr : 记录信息
   * */
   public Vehicle findVehicleDetail(Map<String, Object> map);


   /*
    * 根据id删除车辆信息
    * */
   public void deleteVehicle(Map<String, Object> requestMap);

   /*
    * 修改车辆信息
    * */
   public void updateVehicle(Vehicle vehicle);
}
