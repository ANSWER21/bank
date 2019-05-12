package com.mooke.dao.Impl;

import com.mooke.dao.LoginDao;
import com.mooke.entity.Login;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LoginDaoImpl extends SqlSessionDaoSupport implements LoginDao {

    @Autowired
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory)
    {
        super.setSqlSessionFactory(sqlSessionFactory);
    }
    @Override
    public List<Login> login(String id, Login userEntity){
       return getSqlSession().selectList(id, userEntity);
    };
}
