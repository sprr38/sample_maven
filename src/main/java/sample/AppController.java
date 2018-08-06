package sample;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AppController {
	@RequestMapping("/")
	public String gettingStarted()
	{
	return "Getting Started with Springboot Application deployed on PWS......";
	}
}
