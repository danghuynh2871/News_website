package com.springboot.dev_spring_boot_demo.service;

import com.springboot.dev_spring_boot_demo.dao.ProductDAO;
import com.springboot.dev_spring_boot_demo.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    private ProductDAO productDAO;

    @Autowired
    public ProductServiceImpl(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }

    @Override
    public List<Product> findAll() {
        return productDAO.findAll();
    }

    @Override
    public Product findById(int id) {
        return productDAO.findById(id);
    }

    @Override
    public void save(Product product) {
        productDAO.save(product);
    }

    @Override
    public void deleteById(int id) {
        productDAO.deleteById(id);
    }

    @Override
    public List<Product> findLatestProducts(int limit) {
        return productDAO.findLatestProducts(limit);
    }
}