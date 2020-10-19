package com.example.restservice;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.atomic.AtomicLong;

@RestController
public class GreetingController {

	private static final String template = "Hello, %s!";
	private final AtomicLong counter = new AtomicLong();

	@GetMapping("/greeting")
	public Greeting greeting(@RequestParam(value = "name", defaultValue = "World") String name) {
		return new Greeting(counter.incrementAndGet(), String.format(template, name));
	}

	/*Potential Path for server side user validation
	Method could accept username and password then verify that password server side
	Respond with user succesfully validated or failed and the app could process that error message.
	 */
	@GetMapping("/validateUser")
	public ValidateUser validateUser(@RequestParam String username, @RequestParam String password) {
		System.out.println("running out of options");
		return new ValidateUser(counter.incrementAndGet(), username, password);
	}

	@GetMapping("/savePatient")
	public Greeting savePatient(@RequestParam(value = "name", defaultValue = "World") String name) {
		return new Greeting(counter.incrementAndGet(), String.format(template, name));
	}

	@GetMapping("/updatePatient")
	public Greeting updatePatient(@RequestParam(value = "name", defaultValue = "World") String name) {
		return new Greeting(counter.incrementAndGet(), String.format(template, name));
	}

	@GetMapping("/removePatient")
	public Greeting removePatient(@RequestParam(value = "name", defaultValue = "World") String name) {
		return new Greeting(counter.incrementAndGet(), String.format(template, name));
	}
	/*
	If we go the route of having the mobile app/web portal validate the password there side we could use this method to do so.
	 */
	@GetMapping("/getPassword")
	public Greeting getPassword(@RequestParam(value = "name", defaultValue = "World") String name) {
		return new Greeting(counter.incrementAndGet(), String.format(template, name));
	}

	@GetMapping("/createProvider")
	public Greeting createProvider(@RequestParam(value = "name", defaultValue = "World") String name) {
		return new Greeting(counter.incrementAndGet(), String.format(template, name));
	}

	@GetMapping("/updateProvider")
	public Greeting updateProvider(@RequestParam(value = "name", defaultValue = "World") String name) {
		return new Greeting(counter.incrementAndGet(), String.format(template, name));
	}

	@GetMapping("/removeProvider")
	public Greeting removeProvider(@RequestParam(value = "name", defaultValue = "World") String name) {
		return new Greeting(counter.incrementAndGet(), String.format(template, name));
	}


}
