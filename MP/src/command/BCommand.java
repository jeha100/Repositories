package command;
//여러command있고 BCommand인터페이스가있다.
//나머지 커멘드들은 bcommand를 구현하고있다.

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//BCommand는 인터페이스 한가지 메소드 실행메소드 하나만있고 매개변수로 rq,rs받고있다
//나머지 는 bcommand를 구현하고있다.선언해준 execute()오버라이드해주고 적절한 로직을 수행한다.

public interface BCommand {
	
	void execute(HttpServletRequest request, HttpServletResponse response);
	//execute한가지메소드만있구요
	//추상메소드
}