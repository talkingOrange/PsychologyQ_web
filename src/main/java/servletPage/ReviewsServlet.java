package servletPage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import review.ReviewDAO;
import review.ReviewDTO;

/**
 * Servlet implementation class ReviewsServlet
 */
public class ReviewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		PrintWriter script = resp.getWriter();
		
		ReviewDAO reviewDAO = new ReviewDAO();
		ArrayList<ReviewDTO> reviewDTO = new ArrayList<ReviewDTO>();
		
		script.println("<리뷰>");
		reviewDTO = reviewDAO.getReviews();
		JSONArray array = new JSONArray();
		
		for(int i = 0; i < reviewDTO.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("userNname", reviewDTO.get(i).getUser_nname());
			obj.put("totalStar", reviewDTO.get(i).getTotal_star());
			obj.put("attitudeStar", reviewDTO.get(i).getAttitude_star());
			obj.put("bookingStar", reviewDTO.get(i).getBooking_star());
			obj.put("counselName", reviewDTO.get(i).getCounsel_name());
			obj.put("visitDate", reviewDTO.get(i).getVisit_date());
			obj.put("keyword",  reviewDTO.get(i).getKeywd().replace(";",", "));
			obj.put("nthVisit", reviewDTO.get(i).getNth_visit());
			obj.put("locationStar", reviewDTO.get(i).getLocation_star());
			obj.put("reviewCont", reviewDTO.get(i).getReview_cont());
			array.put(obj);
		}
		script.println(array.toString());
		req.setAttribute("reviews", array);
		
        ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/reviews.jsp");
        dispatcher.forward(req, resp);
	}



	/*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter script = response.getWriter();
		
		ReviewDAO reviewDAO = new ReviewDAO();
		ArrayList<ReviewDTO> reviewDTO = new ArrayList<ReviewDTO>();
		
		reviewDTO = reviewDAO.getReviews();
		for(int i = 0; i < reviewDTO.size(); i++) {
			script.println("userNname: " + reviewDTO.get(i).getUser_nname());
			script.println(" totalStar: " + reviewDTO.get(i).getTotal_star());
			script.println(" attitudeStar: " + reviewDTO.get(i).getAttitude_star());
			script.println(" bookingStar: " + reviewDTO.get(i).getBooking_star());
		}

	}*/

}
