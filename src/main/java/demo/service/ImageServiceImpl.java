package demo.service;

import demo.domain.ProductImage;
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
}
