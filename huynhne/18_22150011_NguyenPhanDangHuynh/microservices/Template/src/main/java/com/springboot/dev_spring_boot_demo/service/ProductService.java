package com.springboot.dev_spring_boot_demo.service;

import com.springboot.dev_spring_boot_demo.entity.Product;
import java.util.List;

public interface ProductService {
    List<Product> findAll();
    Product findById(int id);
    void save(Product product);
    void deleteById(int id);
    List<Product> findLatestProducts(int limit);
}