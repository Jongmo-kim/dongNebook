package com.dongnebook.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.dongnebook.user.model.vo.User;


@Aspect
@Component
public class UserPwEnc {
	//회원가입, 로그인, 업데이트 포인트컷으로 만들고
	//비밀번호 암호화 로직을 Advice로
	//어느시점에 적용할지 선정하여 적용한다.
	@Autowired
	private SHA256Util enc; 
	
	@Pointcut("execution(* com.dongnebook.user.model.service.UserService.insertUser(..))")
	public void insertPointcut() {}
	
	@Pointcut("execution(* com.dongnebook.user.model.service.UserService.loginUser(..))")
	public void loginPointcut() {}
	
	@Pointcut("execution(* com.dongnebook.user.model.service.UserService.updateUser(..))")
	public void updatePointcut() {}
	
	@Before("insertPointcut()")
	public Object beforeInsert(JoinPoint jp){
		return encype(jp);
	}
	
	@Before("loginPointcut()")
	public Object beforeLogin(JoinPoint jp){
		return encype(jp);
	}
	
	@Before("updatePointcut()")
	public Object beforeUpdate(JoinPoint jp) {
		return encype(jp);
	}
	private JoinPoint encype(JoinPoint jp) {
		Object[] args = jp.getArgs();
		User u = (User)args[0];
		if(u.getUserPw() !=null) {
			try {
				u.setUserPw(enc.encPw(u.getUserPw()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return jp;
	}
}
