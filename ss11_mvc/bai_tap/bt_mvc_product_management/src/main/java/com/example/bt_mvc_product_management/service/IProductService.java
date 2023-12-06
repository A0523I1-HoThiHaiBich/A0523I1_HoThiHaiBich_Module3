package com.example.bt_mvc_product_management.service;

import com.example.bt_mvc_product_management.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> showList();
    void addNewProduct(Product product);
    void updateProduct(Product product);
    void deleteProduct(int id);
    Product findByID(int id);

}
