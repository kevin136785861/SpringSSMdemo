package demo.service;

import demo.domain.ProductImage;
import demo.domain.ProductImageExample;
import demo.mapper.ProductImageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageServiceImpl implements ImageService {
    @Autowired
    private ProductImageMapper pim;

    @Override
    public void insert(List<ProductImage> images) {
        pim.inserts(images);
    }

    @Override
    public List<ProductImage> listByProductId(Long id) {
        ProductImageExample productImageExample = new ProductImageExample();
        productImageExample.createCriteria().andProductIdEqualTo(id);
        return pim.selectByExample(productImageExample);
    }

    @Override
    public void delete(Long id, List<String> oldImgs) {
        ProductImageExample example = new ProductImageExample();
        example.createCriteria().andProductIdEqualTo(id).andPathNotIn(oldImgs);
        pim.deleteByExample(example);
    }
}
