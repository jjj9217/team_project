package com.crfr.service.email;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.crfr.vo.DeliveryVo;
import com.crfr.vo.OrderVo;

@Service("eSendOrderNum")
//@RequiredArgsConstructor
public class EmailSendOrderNumService implements EmailService {
	private JavaMailSenderImpl mailSender;
	
	@Autowired
		public EmailSendOrderNumService(JavaMailSenderImpl mailSender) {
		this.mailSender = mailSender;
	}
	
	public void orderEmail(String email, String order_num) {
		
		String setFrom = "albireo9217@gmail.com";
		String toMail = email;
		String title = "[CrueltyFree] 주문/결제 완료 안내 드립니다.";
		String content = "상품을 구매해주셔서 감사합니다."+
							"<br><br>"+
							"주문번호: "+ order_num +
							"<br>"+
							"해당 주문번호를 홈페이지 주문/배송 조회에 입력하시면 정보를 확인하실 수 있습니다.";
		mailSend(setFrom, toMail, title, content);
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
