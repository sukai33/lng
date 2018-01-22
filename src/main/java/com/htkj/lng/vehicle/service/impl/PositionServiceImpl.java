package com.htkj.lng.vehicle.service.impl;

import com.htkj.lng.vehicle.dao.PositionDao;
import com.htkj.lng.vehicle.model.Position;
import com.htkj.lng.vehicle.service.PositionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author lyz
 * @date 2018/1/12 15:53
 */

@Service
public class PositionServiceImpl implements PositionService
{
    @Autowired
    private PositionDao positionDao;

    public List<Position> findAllPosition()
    {

        return positionDao.findAllPosition();
    }

    public List<Position> findPositionList
            (Map<String, Object> requestMap)
    {
        return positionDao.findPositionList(requestMap);
    }

    public Position findPosition
            (Map<String, Object> requestMap)
    {
        return positionDao.findPosition(requestMap);
    }
}
