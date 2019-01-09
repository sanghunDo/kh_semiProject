package semi.common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {
	
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String key) {
		String value = "";
		System.out.println("@#!$@$#%#%#%%!$!@$!@#");
		System.out.println(key);
		// 패스워드가 전달됐을때만 암호화
		if(key != null && ("userPassword".equals(key) || "userPassword_New".equals(key))) {
			System.out.println("암호화 전@EncryptWrapper : " + super.getParameter(key));
			
			value = getSha512(super.getParameter(key));
			
			System.out.println(value);
		}
		
		return value;
	}
	
	/**
	 * 해싱은 복호화가 되지 않는다. (=> 원래 암호가 무엇이었는지 알 수 없다)
	 * Hash는 단방향 암호화 기법이고, Encryption은 양방향 암호화 기법이다.
	 * 암호화처리 메소드
	 * @param userPassword
	 * @return
	 */
	private String getSha512(String userPassword) {
		/**
		 * MessageDigest 클래스에는 update() 메소드가 있는데, 
		 * 이 메소드를 호출할때마다 객체 내에 저장된 digest 값이 계속해서 갱신이됩니다. 
		 * 최종적으로 digest() 메서드를 호출하면 그 값을 가져올 수 있습니다.
		 */
		String encUserPassword = null;
		MessageDigest md = null;
		
		// 1. 암호화객체생성 SHA-512방식
		try {
			md = MessageDigest.getInstance("SHA-512");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		// 2. 사용자가 입력한 패스워드(userPassword)를 바이트배열로 변환
		byte[] bytes = userPassword.getBytes(Charset.forName("UTF-8"));
		
		// 3. md객체에 바이트배열전달해서 갱신
		md.update(bytes);
		
		// 4. 암호화처리(return byte[])
		byte[] encBytes = md.digest();
		
		// 5. Base64인코더를 사용해서 암호화된 바이트배열 => 문자열 변환
		// Base64 인코딩 : ByteArray를 64개의 문자로 이루어진 문자열로 변환하는 방법
		encUserPassword = Base64.getEncoder().encodeToString(encBytes);
		System.out.println("암호화 후@EncryptWrapper : " + encUserPassword);
		
		return encUserPassword;
	}

}
