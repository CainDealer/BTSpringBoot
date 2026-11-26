package com.example.demo.controller;

import com.example.demo.dto.RegisterForm;
import com.example.demo.entity.User;
import com.example.demo.repository.UserRepository;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
public class AuthController {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    @GetMapping("/")
    public String index() {
        return "redirect:/home";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/register")
    public String registerPage(Model model) {
        model.addAttribute("form", new RegisterForm());
        return "register";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("form") RegisterForm form,
                           BindingResult result,
                           RedirectAttributes redirectAttributes) {

        if (!result.hasFieldErrors("username") && userRepository.existsByUsername(form.getUsername())) {
            result.rejectValue("username", "duplicate", "Username đã tồn tại");
        }
        if (!result.hasFieldErrors("email") && userRepository.existsByEmail(form.getEmail())) {
            result.rejectValue("email", "duplicate", "Email đã được sử dụng");
        }
        if (result.hasErrors()) {
            return "register";
        }

        User user = User.builder()
                .username(form.getUsername())
                .email(form.getEmail())
                .password(passwordEncoder.encode(form.getPassword()))
                .build();
        userRepository.save(user);

        redirectAttributes.addFlashAttribute("success", "Đăng ký thành công, hãy đăng nhập!");
        return "redirect:/login";
    }

    @GetMapping("/home")
    public String home(Authentication authentication, Model model) {
        model.addAttribute("username", authentication.getName());
        return "home";
    }
}