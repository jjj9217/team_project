package com.crfr.service.email;

public interface EmailService {
	default String joinEmail(String email) {return null;}
}
