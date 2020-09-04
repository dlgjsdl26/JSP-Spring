package kr.or.ddit.exception;

/**
 * 특정 업무나 로직에서 발생하는 특화된 예외. 
 *
 */
public class customException extends RuntimeException{

	public customException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public customException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public customException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public customException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public customException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
 
}
