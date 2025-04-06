package com.springboot.dev_spring_boot_demo.entity;
import java.util.Date;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;

@Entity
@Table(name = "products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ma")
    private int ma;

    @NotBlank(message = "Tiêu đề không được để trống")
    @Column(name = "ten")
    private String ten;

    @NotBlank(message = "Tóm tắt không được để trống")
    @Column(name = "mo_ta")
    private String moTa;

    @NotBlank(message = "Nội dung không được để trống")
    @Column(name = "noi_dung", columnDefinition = "TEXT")
    private String noiDung;

    @NotBlank(message = "Tác giả không được để trống")
    @Column(name = "tac_gia")
    private String tacGia;

    @Column(name = "hinh_anh")
    private String hinhAnh;

    @Column(name = "ngay_dang")
    @Temporal(TemporalType.TIMESTAMP)
    private Date ngayDang;

    @Column(name = "luot_xem")
    private int luotXem;

    @Column(name = "trang_thai")
    private boolean trangThai;

    public Product() {
        this.ngayDang = new Date();
        this.luotXem = 0;
        this.trangThai = true;
    }

    public Product(String ten, String moTa, String noiDung, String tacGia) {
        this.ten = ten;
        this.moTa = moTa;
        this.noiDung = noiDung;
        this.tacGia = tacGia;
        this.ngayDang = new Date();
        this.luotXem = 0;
        this.trangThai = true;
    }

    // Getters and setters for all fields
    public int getMa() { return ma; }
    public void setMa(int ma) { this.ma = ma; }

    public String getTen() { return ten; }
    public void setTen(String ten) { this.ten = ten; }

    public String getMoTa() { return moTa; }
    public void setMoTa(String moTa) { this.moTa = moTa; }

    public String getNoiDung() { return noiDung; }
    public void setNoiDung(String noiDung) { this.noiDung = noiDung; }

    public Date getNgayDang() { return ngayDang; }
    public void setNgayDang(Date ngayDang) { this.ngayDang = ngayDang; }

    public String getTacGia() { return tacGia; }
    public void setTacGia(String tacGia) { this.tacGia = tacGia; }

    public int getLuotXem() { return luotXem; }
    public void setLuotXem(int luotXem) { this.luotXem = luotXem; }

    public boolean isTrangThai() { return trangThai; }
    public void setTrangThai(boolean trangThai) { this.trangThai = trangThai; }

    @Override
    public String toString() {
        return "Product{" +
                "ma=" + ma +
                ", ten='" + ten + '\'' +
                ", moTa='" + moTa + '\'' +
                ", noiDung='" + noiDung + '\'' +
                ", ngayDang=" + ngayDang +
                ", tacGia='" + tacGia + '\'' +
                ", luotXem=" + luotXem +
                ", trangThai=" + trangThai +
                '}';
    }

    // Add getter and setter
    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    // Update constructor
    public Product(String ten, String moTa, String noiDung, String tacGia, String hinhAnh) {
        this.ten = ten;
        this.moTa = moTa;
        this.noiDung = noiDung;
        this.tacGia = tacGia;
        this.hinhAnh = hinhAnh;
        this.ngayDang = new Date();
        this.luotXem = 0;
        this.trangThai = true;
    }
}