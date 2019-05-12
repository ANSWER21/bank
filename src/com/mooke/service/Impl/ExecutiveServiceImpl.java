package com.mooke.service.Impl;

import com.mooke.dao.ExecutiveDao;
import com.mooke.dao.Impl.ExecutiveDaoImpl;
import com.mooke.entity.Tools;
import com.mooke.service.ExecutiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

@Service
public class ExecutiveServiceImpl implements ExecutiveService {
    @Autowired
    private ExecutiveDaoImpl executiveDao;
    @Override
    public List<Tools> queryListByPage(String id, Map<String,Object> map){

        return executiveDao.queryListByPage(id,map);
    }

    @Override
    public Integer queryTotalCount(String id,Map<String,Object> map){
        return  executiveDao.queryTotalCount(id,map);
    };

    @Override
    public boolean  addUsered(String id, Map<String, Object> map){
        return executiveDao.addUsered(id,map);
    };

    @Override
    public boolean  updateUsered(String id, Map<String, Object> map){
        return executiveDao.updateUsered(id,map);
    };

    @Override
    public boolean  deleteUsered(String id, Map<String, Object> map){
        return executiveDao.deleteUsered(id,map);
    };

    @Override
    public Tools  queryDetailListByDid(String id, Map<String, Object> map){
        return executiveDao.queryDetailListByDid(id,map);
    };

}
