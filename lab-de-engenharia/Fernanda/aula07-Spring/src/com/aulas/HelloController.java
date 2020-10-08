package com.aulas;

import java.util.Optional;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public class HelloController {

	@GetMapping
	public String teste() {
		return "teste";
	}

	
	@GetMapping("/tabuada")
	public ModelAndView tabuada(@PathVariable("NUMERO") int num, @RequestParam("INICIO") Optional<Integer> inicio, @RequestParam("FIM") Optional<Integer> fim) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("tabuada");
		StringBuffer sb =  new StringBuffer();
		
		for (int i = inicio.orElse(0); i <= fim.orElse(10); i++) {
			sb.append(String.format("<p>%d X %d = %d<p>%n", num, i, num * i));
		}
		return mv;
	}
}
