package review;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ReviewPost
 */
public class ReviewPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewPost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");  
		HttpSession session = request.getSession();
		PrintWriter script = response.getWriter();

        String totalP = request.getParameter("totalPoints");
        String attitudeP = request.getParameter("attitudePoints");
        String bookingP = request.getParameter("bookingPoints");
        String locationP = request.getParameter("locationPoints");
        int total_star = Integer.parseInt(totalP);
        int attitude_star = Integer.parseInt(attitudeP);
        int booking_star = Integer.parseInt(bookingP);
        int location_star = Integer.parseInt(locationP);
        
        String counsel = request.getParameter("userHospital");
        String visitDate = request.getParameter("visitDate");
        String visitNum = request.getParameter("visitNum");
        int nth_visit = Integer.parseInt(visitNum);
        
        String content = request.getParameter("content");
        String keyword1 = request.getParameter("keyword1");
        String keyword2 = request.getParameter("keyword2");
        String keyword3 = request.getParameter("keyword3");
        String keyword4 = request.getParameter("keyword4");
        String keyword5 = request.getParameter("keyword5");
        String keywords ="";
        if(keyword1 != null) keywords += keyword1 + ";";
        if(keyword2 != null) keywords += keyword2 + ";";
        if(keyword3 != null) keywords += keyword3 + ";";
        if(keyword4 != null) keywords += keyword4 + ";";
        if(keyword5 != null) keywords += keyword5 + ";";
        
        ReviewDAO reviewDAO = new ReviewDAO();
        int success;
        success = reviewDAO.postReview((String) session.getAttribute("userId"), counsel, total_star, attitude_star, booking_star, location_star, keywords, visitDate, nth_visit, content);
        if (success == 1) {
        	script.println("<script>alert('리뷰를 작성했습니다.')");
        	script.println("location.href='reviews'</script>");
        }
        else script.println("alert('리뷰 작성에 실패했습니다.')");
               
	}
}
