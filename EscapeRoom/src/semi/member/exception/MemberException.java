package semi.member.exception;

/* 
 * 예외처리를 강제화하느냐, 자율적으로 하느냐 차이
 * 요새는 checked로 만들어도 구체적으로 하지 않고 제일 조상인 Exception으로 퉁쳐서 하기 때문에
 * 큰 의미가 없으므로, 예외처리를 강제화하지않고 런타임으로 처리한다.
 * 예외는 최초 호출한 곳에서 처리해준다.
 * controller(!!!) -> service -> dao
 * dao, service는 controller쪽으로 Throw해준다.
 * 예외처리를 controller에서 해주는게 맞다.
 * mvc2패턴참고
 */


public class MemberException extends RuntimeException {
// 상속을 해도 생성자는 상속이 안 되므로 다시 만들어줘야 한다. (명시적으로 부모생성자 호출)
	public MemberException() {
		super();
	}
	
	public MemberException(String message, Throwable cause) {
		super(message, cause);
	}
	
	// 에러메세지용
	public MemberException(String message) {
		super(message);
	}
	
	// 예외 발생 원인 알려주는 용
	public MemberException(Throwable cause) {
		super(cause);
	}
}
