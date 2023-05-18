package kr.go.haman.test;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class TestCase0 {

	@Before
	public void beforetest() {
		System.out.println("테스트 시작 전입니다.");
	}
	
	@Test
	public void test() {
		System.out.println("테스트 시작합니다~~~~~");
	}

	@After
	public void aftertest() {
		System.out.println("테스트 시작 후입니다.");
	}
	
	@Test
	public void test2() {
		System.out.println("테스트 종료!!!!!!!");
	}
}
