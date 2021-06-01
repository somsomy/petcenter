package com.somsomy;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class Config {

    @Bean
    public String uploadPath(@Value("${uploadPath}") String uploadPath) {
        return uploadPath;
    }
}

