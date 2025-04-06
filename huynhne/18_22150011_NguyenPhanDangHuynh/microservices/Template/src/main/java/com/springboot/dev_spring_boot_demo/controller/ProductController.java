package com.springboot.dev_spring_boot_demo.controller;
import com.springboot.dev_spring_boot_demo.entity.Product;
import com.springboot.dev_spring_boot_demo.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

// Add these imports at the top
import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;

@Controller
@RequestMapping("/admin/products")
public class ProductController {
    private final ProductService productService;
    private final String UPLOAD_DIR = "uploads/"; // Changed to root uploads folder

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/list-product")
    public String listProducts(Model model) {
        model.addAttribute("products", productService.findAll());
        return "admin/products/list-product";
    }

    @GetMapping("/product-form-insert")
    public String showForm(Model model) {
        model.addAttribute("product", new Product());
        return "admin/products/product-form-insert";  // Updated path
    }

    @PostMapping("/save")
    public String saveProduct(
            @Valid @ModelAttribute("product") Product product,
            BindingResult bindingResult,
            @RequestParam(value = "imageFile", required = false) MultipartFile imageFile,
            @RequestParam(value = "imageUrl", required = false) String imageUrl,
            @RequestParam(value = "imageSource", required = false) String imageSource,
            Model model) throws IOException {
        
        if (bindingResult.hasErrors()) {
            return "admin/products/product-form-insert";
        }

        // Handle image upload
        if ("file".equals(imageSource) && imageFile != null && !imageFile.isEmpty()) {
            // Create uploads directory if it doesn't exist
            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Generate unique filename
            String fileName = System.currentTimeMillis() + "_" + imageFile.getOriginalFilename();
            Path filePath = Paths.get(UPLOAD_DIR + fileName);
            
            // Save file
            Files.copy(imageFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
            
            // Save image path to product
            product.setHinhAnh("/uploads/" + fileName);
        } else if ("url".equals(imageSource) && imageUrl != null && !imageUrl.isEmpty()) {
            product.setHinhAnh(imageUrl);
        }

        productService.save(product);
        return "redirect:/admin/products/list-product";
    }

    @GetMapping("/product-form-update")
    public String showUpdateForm(@RequestParam("id") int id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "admin/products/product-form-update";
    }

    @GetMapping("/delete")
    public String deleteProduct(@RequestParam("id") int id) {
        // Get product to delete its image if exists
        Product product = productService.findById(id);
        if (product != null && product.getHinhAnh() != null) {
            // Delete the image file
            String imagePath = UPLOAD_DIR + product.getHinhAnh().replace("/uploads/", "");
            try {
                Files.deleteIfExists(Paths.get(imagePath));
            } catch (IOException e) {
                // Log error but continue with product deletion
                e.printStackTrace();
            }
        }
        
        // Delete the product
        productService.deleteById(id);
        return "redirect:/admin/products/list-product";
    }
}