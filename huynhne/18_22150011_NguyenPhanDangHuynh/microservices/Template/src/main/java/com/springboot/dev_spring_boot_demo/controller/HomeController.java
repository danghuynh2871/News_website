package com.springboot.dev_spring_boot_demo.controller;

import com.springboot.dev_spring_boot_demo.entity.Product;
import com.springboot.dev_spring_boot_demo.entity.Student;
import com.springboot.dev_spring_boot_demo.service.ProductService;
import com.springboot.dev_spring_boot_demo.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class HomeController {
    private final StudentService studentService;
    private final ProductService productService;

    public HomeController(StudentService studentService, ProductService productService) {
        this.studentService = studentService;
        this.productService = productService;
    }
    @GetMapping("/about-us")
    public String aboutUs() {
        return "about-us";
    }
    
    @GetMapping("/shop")
    public String shop(Model model) {
        List<Student> students = studentService.findAll();
        model.addAttribute("students", students);
        return "shop";
    }
    
    @GetMapping("/service")
    public String service() {
        return "service";
    }
    
    @GetMapping("/blog")
    public String blog() {
        return "blog";
    }
    
    @GetMapping("/contact-us")
    public String contactUs() {
        return "contact-us";
    }

    @GetMapping("/categories")
    public String showCategories() {
        return "categories";
    }

    @GetMapping("/features")
    public String showFeatures() {
        return "features";
    }

    @GetMapping("/products")
    public String showProducts(Model model) {
        List<Product> products = productService.findAll();
        model.addAttribute("products", products);
        return "products";
    }
    @GetMapping("/products/{id}")
    public String showProductDetail(@PathVariable Long id, Model model) {
        Product product = productService.findById(id.intValue());
        model.addAttribute("product", product);
        return "product-detail";
    }
}
