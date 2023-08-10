package com.crfr.service.email;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("eSend")
//@RequiredArgsConstructor
public class EmailSendService implements EmailService {
	private JavaMailSenderImpl mailSender;
	
	@Autowired
		public EmailSendService(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}
	
	public String joinEmail(String email) {

		int authNumber = (int)(Math.random()*888889)+111111;
		
		String setFrom = "albireo9217@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다."+
							"<br><br>"+
							"인증번호: "+authNumber+
							"<br>"+
							"해당 인증번호를 인증번호 확인란에 입력해 주세요.";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNumber);
	}
	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message=mailSender.createMimeMessage();
		
		try {
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		helper.setFrom(setFrom);
		helper.setTo(toMail);
		helper.setSubject(title);
		helper.setText(content, true);//true: html형식으로 전송, 값을 입력하지 않으면 텍스트로 전송
		mailSender.send(message);
	}catch(MessagingException e) {
		e.printStackTrace();
	}
}
}
