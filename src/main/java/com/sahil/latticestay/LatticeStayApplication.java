package com.sahil.latticestay;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class LatticeStayApplication {

	public static void main(String[] args) {
		SpringApplication.run(LatticeStayApplication.class, args);
	}

}
