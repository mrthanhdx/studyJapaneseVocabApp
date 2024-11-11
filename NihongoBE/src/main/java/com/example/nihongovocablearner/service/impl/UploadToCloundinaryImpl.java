package com.example.nihongovocablearner.service.impl;

import com.cloudinary.Cloudinary;
import com.example.nihongovocablearner.service.UploadToCloudinary;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
@Service
@RequiredArgsConstructor
public class UploadToCloundinaryImpl implements UploadToCloudinary {

    private final Cloudinary cloudinary;
    @Override
    public String uploadImage(MultipartFile multipartFile) throws IOException {
        Map<String,Object> uploadParams = new HashMap<>();
        uploadParams.put("folder","productImg");
        uploadParams.put("public_id", UUID.randomUUID().toString());
        return cloudinary.uploader().upload(multipartFile.getBytes(),uploadParams)
                .get("url").toString();
    }

}
