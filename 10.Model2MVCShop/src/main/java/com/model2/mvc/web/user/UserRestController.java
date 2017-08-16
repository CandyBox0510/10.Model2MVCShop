package com.model2.mvc.web.user;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;

@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	public UserRestController() {
		System.out.println("UserRestController Default Constructor");
	}
	
	//@RequestMapping(value="checkDuplication", method=RequestMethod.POST)
	public String checkDuplication(@RequestParam("userId") String userId, HttpServletRequest request,
										HttpServletResponse response) throws Exception{
		boolean result = userService.checkDuplication(userId);
		
		request.setAttribute("result", new Boolean(result));
		request.setAttribute("userId", userId);
		
		return "forward:/user/checkDuplication.jsp";
	}
	
	//@RequestMapping( value="addUser", method=RequestMethod.GET )
	public String addUser() throws Exception{
	
		System.out.println("/user/json/addUser : GET");
		
		return "redirect:/user/addUserView.jsp";
	}
	
	@RequestMapping( value="/json/addUser", method=RequestMethod.POST )
	public void addUser( @RequestBody User user ) throws Exception {

		System.out.println("/user/json/addUser : POST");

		userService.addUser(user);
	}
	
	//@RequestMapping( value="login", method=RequestMethod.GET )
	public String login() throws Exception{
		
		System.out.println("/user/logon : GET");

		return "redirect:/user/loginView.jsp";
	}
	
	@RequestMapping(value="/json/login", method=RequestMethod.POST)
	public User login(@RequestBody User user,
							HttpServletRequest request,HttpSession session) throws Exception{
		User dbVO = userService.loginUser(user);
		if(dbVO == null){
			request.setAttribute("loginFail", "fail");
			return dbVO;
		}
		session.setAttribute("user", dbVO);
		return dbVO;
	}
	
	//@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value="/json/getUser/{userId}", method=RequestMethod.GET)
	public User getUser(@PathVariable("userId") String userId,
							HttpServletRequest request) throws Exception{
		System.out.println("/json/getUser에서 받은 userId : " + userId);
		
		User user=userService.getUser(userId);
		
		return user;
	}
	
	//@RequestMapping(value="updateUserView", method=RequestMethod.GET)
	public String updateUserView(@RequestParam("userId") String userId,
									HttpServletRequest request) throws Exception{
		User user=userService.getUser(userId);
		
		request.setAttribute("user", user);
		
		return "forward:/user/updateUser.jsp";
		
	}
	
	@RequestMapping(value="/json/updateUser", method=RequestMethod.POST)
	public void updateUser(@RequestBody User user,
								HttpSession session) throws Exception{
		String userId=user.getUserId();
		
		userService.updateUser(user);
		
		String sessionId=((User)session.getAttribute("user")).getUserId();

		if(sessionId.equals(userId)){
			session.setAttribute("user", user);
		}
			
	}
		
	@RequestMapping(value="/json/listUser")
	public Map<String,Object> listUser(@ModelAttribute Search search, HttpServletRequest request) throws Exception{

		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}

		search.setPageUnit(pageUnit);
		
		Map<String,Object> map=userService.getUserList(search);

		Page resultPage = new Page(search.getCurrentPage(), 
									(Integer)map.get("totalCount"), pageUnit, pageSize);

		map.put("search", search);
		map.put("resultPage", resultPage);
		
		//In Map   ( list , search, resultPage )
		return map;
	}
}
