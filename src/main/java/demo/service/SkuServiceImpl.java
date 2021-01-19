package demo.service;

import demo.domain.SkuInfo;
import demo.domain.SkuInfoExample;
import demo.mapper.SkuInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SkuServiceImpl implements SkuService {
    @Autowired
    private SkuInfoMapper skuInfoMapper;
    @Override
    public void insert(List<SkuInfo> sku) {
        sku.stream().forEach(x->skuInfoMapper.insertSelective(x));
    }

    @Override
    public List<SkuInfo> listByProductId(Long id) {
        SkuInfoExample skuInfoExample = new SkuInfoExample();
        skuInfoExample.createCriteria().andProductIdEqualTo(id);
        return skuInfoMapper.selectByExample(skuInfoExample);
    }

    @Override
    public void deleteByProductId(Long id) {
        SkuInfoExample skuInfoExample = new SkuInfoExample();
        skuInfoExample.createCriteria().andProductIdEqualTo(id);
        skuInfoMapper.deleteByExample(skuInfoExample);
    }
}
