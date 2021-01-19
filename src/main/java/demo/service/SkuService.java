package demo.service;

import demo.domain.SkuInfo;

import java.util.List;

public interface SkuService {
    void insert(List<SkuInfo> sku);

    List<SkuInfo> listByProductId(Long id);
    void deleteByProductId(Long id);
}
