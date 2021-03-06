package com.leelab.blogproject.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GeneralExceptionHandler {
	
	private static final Logger logger = LoggerFactory.getLogger(GeneralExceptionHandler.class);
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception e) {
		logger.info("{}", e.getMessage());
		e.printStackTrace();
		ModelAndView mv = new ModelAndView("error");
		mv.addObject("e", e);
		return mv;
	}
	
}
