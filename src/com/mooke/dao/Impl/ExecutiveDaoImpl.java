package com.mooke.dao.Impl;

import com.mooke.dao.ExecutiveDao;
import com.mooke.entity.Tools;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ExecutiveDaoImpl extends SqlSessionDaoSupport implements ExecutiveDao {

    @Autowired
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory)
    {
        super.setSqlSessionFactory(sqlSessionFactory);
    }
    @Override
    public List<Tools> queryListByPage(String id,  Map<String,Object> map){
        return getSqlSession().selectList(id, map);
    };
    @Override
    public Integer queryTotalCount(String id, Map<String,Object> map){
        return getSqlSession().selectOne(id, map);
    };

    @Override
    public boolean addUsered (String id, Map<String, Object> map){
        if(	getSqlSession().insert(id, map)>0)return true;
        return false;
    };
    @Override
    public boolean updateUsered (String id, Map<String, Object> map){
        if(	getSqlSession().update(id, map)>0)return true;
        return false;
    };

    @Override
    public boolean deleteUsered (String id, Map<String, Object> map){
        if(	getSqlSession().delete(id, map)>0)return true;
        return false;
    };


    @Override
    public Tools queryDetailListByDid (String id, Map<String, Object> map){
        return getSqlSession().selectOne(id, map);
    };

}
