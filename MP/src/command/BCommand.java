package command;
//����command�ְ� BCommand�������̽����ִ�.
//������ Ŀ������ bcommand�� �����ϰ��ִ�.

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//BCommand�� �������̽� �Ѱ��� �޼ҵ� ����޼ҵ� �ϳ����ְ� �Ű������� rq,rs�ް��ִ�
//������ �� bcommand�� �����ϰ��ִ�.�������� execute()�������̵����ְ� ������ ������ �����Ѵ�.

public interface BCommand {
	
	void execute(HttpServletRequest request, HttpServletResponse response);
	//execute�Ѱ����޼ҵ常�ֱ���
	//�߻�޼ҵ�
}