package demo.service;

import demo.domain.Batch;

import java.util.List;

public interface BatchService {
    List<Batch> list(Integer pageNo, Integer pageSize);
    List<Batch> selectName(Integer pageNo, Integer pageSize,String name);
    void save(Batch batch);
   // Batch curBa
    Batch select(String id);
    int selectActive(Integer active);
    List<Batch> listByAjax();
    Batch curBatch();
    Boolean isSuitable();
    Batch activeBatch();
}
