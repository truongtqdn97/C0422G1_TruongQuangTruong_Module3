package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepository implements IProductRepository {

    private static Map<Integer, Product> productMap = new HashMap<>();

    //Product(int id, String name, int price, String description, String manufacturer)
    static {
        productMap.put(1, new Product(1, "Laptop", 9999, "98%", "HP"));
        productMap.put(2, new Product(2, "Keyboard", 3333, "new", "Newmen"));
        productMap.put(3, new Product(3, "Mouse", 2222, "99%", "Dareu"));
        productMap.put(4, new Product(4, "Headphone", 4444, "new", "Sony"));
        productMap.put(5, new Product(5, "Screen", 5555, "like new", "Samsung"));
        productMap.put(6, new Product(6, "Girlfriend", 1111, "new", "Herparent"));
    }


    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void save(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void remove(int id) {
        productMap.remove(id);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> productList = new ArrayList<>(productMap.values());
        List<Product> products = new ArrayList<>();
        for (Product product : productList) {
            if (product.getName().contains(name)) {
                products.add(product);
            }
        }
        return products;
    }
}
