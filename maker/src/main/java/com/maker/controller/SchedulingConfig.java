package com.maker.controller;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

@Configuration
@EnableScheduling
public class SchedulingConfig {
	 @Bean
	    public ThreadPoolTaskScheduler taskScheduler() {
	        ThreadPoolTaskScheduler taskScheduler = new ThreadPoolTaskScheduler();
	        taskScheduler.setPoolSize(10); // 스레드 풀 크기를 10으로 설정
	        return taskScheduler;
	    }
}
