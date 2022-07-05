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
 * Servlet implementation class ScehduleSaveServlet
 */
public class ScehduleSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScehduleSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		UserDAO userDAO = new UserDAO();
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();		
		
		String user_id = (String) session.getAttribute("userNname");
		String sche_time = request.getParameter("bookingTime");
		String counsel_name = request.getParameter("counselingCenter");
		String year = request.getParameter("cal-year");
		String month = request.getParameter("cal-month");
		if(month.length() < 2) month = "0" + month;
		String date = request.getParameter("cal-date");
		if(date.length() < 2) date = "0" + date;
		String finalDate = year+ "-" + month + "-" + date;
	
		int res = userDAO.saveSched(user_id, finalDate, sche_time, counsel_name);
		if(res == 0) {
			//다시 myPage.jsp
			script.print("<script>"
					+ "alert('저장되었습니다');"
					+ "history.back();"
					+ "</script>");
		}
	}

}
