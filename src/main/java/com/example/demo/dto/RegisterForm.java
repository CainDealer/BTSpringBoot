package com.example.demo.dto;

import jakarta.validation.constraints.*;
import lombok.Data;

@Data
public class RegisterForm {
    @NotBlank(message = "Username không được để trống")
    @Size(min = 3, max = 50, message = "Username từ 3 đến 50 ký tự")
    private String username;

    @NotBlank(message = "Email không được để trống")
    @Email(message = "Email không đúng định dạng")
    private String email;

    @NotBlank(message = "Mật khẩu không được để trống")
    @Size(min = 6, max = 100, message = "Mật khẩu tối thiểu 6 ký tự")
    private String password;
}