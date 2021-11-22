/*
 *  Copyright 2019-2020 Zheng Jie
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package com.gitee.coadmin.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;


/**
 * @author ZhangHouYing
 * @date 2019-08-24 15:44
 */
@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	/**
			* 添加这个Endpoint，这样在网页中就可以通过websocket连接上服务,
			* 也就是我们配置websocket的服务地址,并且可以指定是否使用socketjs
     *
			 * @param registry
     */
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		/*
		 * 1. 将 /api/my-device-app 路径注册为STOMP的端点，
		 *    用户连接了这个端点后就可以进行websocket通讯，支持socketJs
		 * 2. setAllowedOriginPatterns("*")表示可以跨域
		 * 3. withSockJS()表示支持socktJS访问
		 */

		registry
				.addEndpoint("/api/my-device-app")
				// Spring Boot Starter Parent < 2.4.0 使用如下
				// .setAllowedOrigins("*")
				// Spring Boot Starter Parent >=2.4.0 使用如下
				.setAllowedOriginPatterns("*")
				.withSockJS();

		/*
		 * 添加多个端点
		 * 它的实现类是WebMvcStompEndpointRegistry ，
		 * addEndpoint是添加到WebMvcStompWebSocketEndpointRegistration的集合中，
		 * 所以可以添加多个端点
		 */
		registry.addEndpoint("/stomp/websocket");
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		/*
		// 自定义调度器，用于控制心跳线程
		ThreadPoolTaskScheduler taskScheduler = new ThreadPoolTaskScheduler();
		// 线程池线程数，心跳连接开线程
		taskScheduler.setPoolSize(1);
		// 线程名前缀
		taskScheduler.setThreadNamePrefix("websocket-heartbeat-thread-");
		// 初始化
		taskScheduler.initialize();
		// 设置广播节点
		registry.enableSimpleBroker("/ad", "/device", "/pay", "/data", "/warn", "/alone").setHeartbeatValue(new long[]{10000, 10000})
				.setTaskScheduler(taskScheduler);
		*/
		// 客户端向服务端发送消息需有/app 前缀
		registry.setApplicationDestinationPrefixes("/app");
		// 指定用户发送（一对一）的前缀 /topic/
		registry.enableSimpleBroker("/topic");
	}

	/**
	 * 配置发送与接收的消息参数，可以指定消息字节大小，缓存大小，发送超时时间
	 *
	 * @param registration
	 */
	/**
	 * 解决报错
	 * StompConversionException: STOMP 'content-length' header value 67826  exceeds configured buffer size limit 65536
	 */
	@Override
	public void configureWebSocketTransport(WebSocketTransportRegistration registry) {
		/*
		 * 1. setMessageSizeLimit 设置消息缓存的字节数大小 字节
		 * 2. setSendBufferSizeLimit 设置websocket会话时，缓存的大小 字节
		 * 3. setSendTimeLimit 设置消息发送会话超时时间，毫秒
		 */
		registry.setMessageSizeLimit(Integer.MAX_VALUE); // default : 64 * 1024
		registry.setSendBufferSizeLimit(Integer.MAX_VALUE);  // default : 512 * 1024
		registry.setSendTimeLimit(20 * 10000); // default : 10 * 10000
	}

}
