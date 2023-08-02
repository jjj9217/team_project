package com.crfr.service.product;

import com.crfr.vo.FileVo;
import com.crfr.vo.ProductVo;

public interface ProductService {
	default ProductVo selectView(int Product_idx) {return null;}
	default FileVo selectThumbnail(int product_idx) {return null;}
}
