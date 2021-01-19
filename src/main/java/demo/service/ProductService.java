package demo.service;

import com.github.pagehelper.PageInfo;
import demo.domain.dto.ProductDTO;
import demo.domain.vo.ProductVo;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface ProductService {
    void insert(ProductDTO product, MultipartFile[] imgs, HttpServletRequest req);

    PageInfo<ProductVo> list(Integer pageNum,Integer pageSize);

    ProductVo selectById(Long id);

    void update(ProductDTO product, MultipartFile[] imgs, HttpServletRequest request);
}
