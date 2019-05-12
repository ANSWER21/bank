package com.mooke.dao;

import com.mooke.entity.Tools;

import java.util.List;
import java.util.Map;

public interface ExecutiveDao {
    List<Tools> queryListByPage(String id, Map<String, Object> map);

    Integer queryTotalCount(String id, Map<String, Object> map);

    boolean addUsered(String id, Map<String, Object> map);

    boolean updateUsered(String id, Map<String, Object> map);

    boolean deleteUsered(String id, Map<String, Object> map);

    Tools queryDetailListByDid(String id, Map<String, Object> map);
}
