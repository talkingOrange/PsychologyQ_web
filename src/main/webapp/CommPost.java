package Community;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;

/**
 * Servlet implementation class ReviewPost
 */
public class CommPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/**
     * @see HttpServlet#HttpServlet()
     */
	public CommPost() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest resq, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int result = UserDAO.login(userid, userpwd);
	      if(result == 1){
	         HttpSession session = resq.getSession();   /*세션에 사용자 정보 저장*/
	         session.setAttribute("userId", userid);
	         session.setAttribute("post_writer",UserDAO.getPost_writer(userid);
	         
		String post_writer = session.getParameter("userid");
		String post_title = resq.getParameter("post_title");
		String post_cont = resq.getParameter("post_cont");
		PrintWriter script = resp.getWriter();
		
		CommDAO commDAO = new CommDAO();
        int success;
        success = commDAO.postComm(userid, post_title, post_cont);
        if (success == 1)
        	script.println("alert('리뷰를 작성했습니다.')");
        else script.println("alert('리뷰 작성에 실패했습니다.')");
               
	}
}


