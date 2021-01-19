package demo.service;

import demo.domain.ProductImage;

import java.util.List;

public interface ImageService {
    void insert(List<ProductImage> images);

    List<ProductImage> listByProductId(Long id);
    void delete(Long id, List<String> oldImgs);
}
