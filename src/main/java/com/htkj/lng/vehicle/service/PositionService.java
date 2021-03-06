package com.htkj.lng.vehicle.service;

import com.htkj.lng.vehicle.model.Position;

import java.util.List;
import java.util.Map;

/**
 * @author lyz
 * @date 2018/1/12 15:52
 */

public interface PositionService
{
    public List<Position> findAllPosition();

    /*
     *  用户根据条件查询车辆
     *  @param requestMap ：查询条件
     *  @return requestMap ：车辆位置信息列表
     * */
    public  List<Position> findPositionList(Map<String, Object> requestMap);

    /*
     *  用户根据条件查询车辆
     *  @param requestMap ：查询条件
     *  @return Position ：车辆位置信息
     * */
    public  Position findPosition(Map<String, Object> requestMap);
}
