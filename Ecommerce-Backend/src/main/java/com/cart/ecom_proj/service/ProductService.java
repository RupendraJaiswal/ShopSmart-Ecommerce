package com.cart.ecom_proj.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cart.ecom_proj.model.Product;
import com.cart.ecom_proj.repo.ProductRepo;


@Service
public class ProductService {

    @Autowired
    private ProductRepo repo;


    public List<Product> getAllProducts() {
        return repo.findAll();
    }

    public Product getProductById(int id){
        return repo.findById(id).orElse(null);
    }

    public Product addProduct(Product product, MultipartFile imageFile) throws IOException {
        product.setImage(imageFile.getOriginalFilename());

        return repo.save(product);
    }

    public Product updateProduct(int id, Product product, MultipartFile imageFile) throws IOException {
        product.setImage(imageFile.getOriginalFilename());
        return repo.save(product);
    }

    public void deleteProduct(int id) {
        repo.deleteById(id);
    }

 
	public List<Product> saveAllProducts(List<Product> products) {
//		 String uploadDir = "uploads/";
//
//		    File dir = new File(uploadDir);
//		    if (!dir.exists()) dir.mkdirs();
//
//		    for (Product product : products) {
//		        String imageUrl = product.getImage(); // temporarily holds the image URL
//		        if (imageUrl != null && !imageUrl.isBlank()) {
//		            try {
//		                // Extract file name from URL
//		                String fileName = UUID.randomUUID() + "-" + Paths.get(new URL(imageUrl).getPath()).getFileName().toString();
//		                Path targetPath = Paths.get(uploadDir).resolve(fileName).normalize();
//
//		                // Download and save the image
//		                try (InputStream in = new URL(imageUrl).openStream()) {
//		                    Files.copy(in, targetPath, StandardCopyOption.REPLACE_EXISTING);
//		                    product.setImage(fileName); // store only the name in DB
//		                }
//
//		            } catch (IOException e) {
//		                System.err.println("Failed to download image for product: " + product.getTitle());
//		                e.printStackTrace();
//		                product.setImage(null); // or set a default image
//		            }
//		        }
//		    }

		    return repo.saveAll(products);	}
}
