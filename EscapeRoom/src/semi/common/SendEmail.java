package semi.common;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import semi.member.model.dao.MemberDao;
import semi.member.model.vo.Member;

public class SendEmail {
	
	public static String getRandomPassword(int len) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
				'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' }; 
		
		int idx = 0;
		StringBuffer sb = new StringBuffer();
		
		System.out.println("charSet.length@SendEmail = " + charSet.length);
		
		for(int i = 0; i < len; i++) {
			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를  Int로 추출 (소숫점제거)
			System.out.println("idx@SendEmail = " + idx);
			sb.append(charSet[idx]);
		}
		
		return sb.toString();
	}

	public static Member sendEmail(String userId, String userEmail, int len) {
		Member m = new Member();
		m.getUserEmail();
		
		String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		final String USER = "escape_if_you_can@naver.com"; // 이메일 주소
		final String PASSWORD = "escapeifyoucan!"; // 비밀번호

		// SMTP 서버 정보를 설정한다.
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", "true");

		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(USER, PASSWORD);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(USER));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail)); // 수신자 이메일 주소

			String temporary_Pw = getRandomPassword(8); // 8자리 랜덤한 문자 생성
			
			m.setUserPassword(temporary_Pw);
			
			message.setSubject("EscapeRoom 임시 비밀번호입니다."); // 메일 제목
			message.setText("임시 비밀번호는 " + temporary_Pw + "입니다."); // 메일 내용
			
			// send the message
			Transport.send(message);
			System.out.println("Success Message Send");

		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return m;
	}


}
