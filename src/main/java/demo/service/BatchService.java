package demo.service;

import demo.domain.Batch;

import java.util.List;

public interface BatchService {
    List<Batch> list(Integer pageNo, Integer pageSize);
    void save(Batch batch);
   // Batch curBa
}
