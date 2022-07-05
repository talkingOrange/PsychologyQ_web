package servletPage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		UserDAO userDAO = new UserDAO();
		String userid = request.getParameter("user_id");
        String userpwd = request.getParameter("user_pwd");
        
		PrintWriter script = response.getWriter();
		int result = userDAO.login(userid, userpwd);
		if(result == 1){
			HttpSession session = request.getSession();	/*세션에 사용자 정보 저장*/
			session.setAttribute("userId", userid);
			session.setAttribute("userNname", userDAO.getNname(userid));
			
	        ServletContext context = getServletContext();
	        RequestDispatcher dispatcher = context.getRequestDispatcher("/myPage.jsp");
	        dispatcher.forward(request, response);
		}else if(result == 0){
			script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -1){
			script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2){
			script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	}

}
