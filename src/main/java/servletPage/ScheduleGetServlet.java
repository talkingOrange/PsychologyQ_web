package servletPage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.UserDAO;

/**
 * Servlet implementation class ScheduleGetServlet
 */
public class ScheduleGetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleGetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserDAO userDAO = new UserDAO();
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();		
		
		String user_id = (String) session.getAttribute("userNname");
		String sche_date = request.getParameter("scheDate");		
		System.out.println(sche_date);
		String res = userDAO.getSched(user_id, sche_date);
		if(res != null || !res.equals("")) {
			//다시 myPage.jsp
			script.append(res);
		}
	}



}
