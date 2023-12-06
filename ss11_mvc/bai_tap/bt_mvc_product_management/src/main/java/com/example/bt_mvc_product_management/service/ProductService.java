package com.example.bt_mvc_product_management.service;

import com.example.bt_mvc_product_management.model.Product;
import com.example.bt_mvc_product_management.repository.IProductRepository;
import com.example.bt_mvc_product_management.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService{
private IProductRepository iProductRepository= new ProductRepository();



    @Override
    public List<Product> showList() {
        return iProductRepository.showList();
    }

    @Override
    public void addNewProduct(Product product) {
    iProductRepository.addNewProduct(product);
    }

    @Override
    public void updateProduct(Product product) {
        iProductRepository.updateProduct(product);
    }

    @Override
    public void deleteProduct(int id) {
        iProductRepository.deleteProduct(id);

    }

    @Override
    public Product findByID(int id) {
        return iProductRepository.findByID(id);
    }

}
