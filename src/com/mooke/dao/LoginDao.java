package com.mooke.dao;

import com.mooke.entity.Login;

import java.util.List;

public interface LoginDao {

    public List<Login> login(String id, Login userEntity);

}
