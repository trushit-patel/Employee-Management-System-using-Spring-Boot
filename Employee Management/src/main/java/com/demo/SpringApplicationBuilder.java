package com.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan
public class SpringApplicationBuilder {

	public static void main(String[] args) {
		SpringApplication.run(SpringApplicationBuilder.class, args);
	}
}