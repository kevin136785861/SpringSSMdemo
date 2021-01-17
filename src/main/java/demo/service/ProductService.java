package demo.service;

import demo.domain.dto.ProductDTO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

public interface ProductService {
    void insert(ProductDTO product, MultipartFile[] imgs, HttpServletRequest req);
}
