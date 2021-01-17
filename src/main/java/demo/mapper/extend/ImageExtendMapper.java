package demo.mapper.extend;

import demo.domain.ProductImage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ImageExtendMapper {
    void inserts(@Param("imgs") List<ProductImage> images);
}
