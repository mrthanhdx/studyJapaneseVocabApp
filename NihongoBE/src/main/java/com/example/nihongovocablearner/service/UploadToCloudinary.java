package com.example.nihongovocablearner.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

public interface UploadToCloudinary {
    public String uploadImage(MultipartFile multipartFile) throws IOException;
}
