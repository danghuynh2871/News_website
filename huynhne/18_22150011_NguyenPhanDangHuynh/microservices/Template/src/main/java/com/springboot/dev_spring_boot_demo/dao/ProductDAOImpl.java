package com.springboot.dev_spring_boot_demo.dao;

import com.springboot.dev_spring_boot_demo.entity.Product;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Repository
public class ProductDAOImpl implements ProductDAO {
    private EntityManager entityManager;

    @Autowired
    public ProductDAOImpl(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    @Override
    public List<Product> findAll() {
        TypedQuery<Product> query = entityManager.createQuery("FROM Product ORDER BY ngayDang DESC", Product.class);
        return query.getResultList();
    }

    @Override
    public Product findById(int id) {
        return entityManager.find(Product.class, id);
    }

    @Override
    @Transactional
    public Product save(Product product) {
        return entityManager.merge(product);
    }

    @Override
    @Transactional
    public void deleteById(int id) {
        Product product = entityManager.find(Product.class, id);
        if (product != null) {
            entityManager.remove(product);
        }
    }

    @Override
    public List<Product> findLatestProducts(int limit) {
        TypedQuery<Product> query = entityManager.createQuery(
            "FROM Product WHERE trangThai = true ORDER BY ngayDang DESC", Product.class);
        query.setMaxResults(limit);
        return query.getResultList();
    }
}