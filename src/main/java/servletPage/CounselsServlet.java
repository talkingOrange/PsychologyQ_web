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

import counsel.CounselDAO;
import counsel.CounselDTO;
import review.ReviewDAO;
import review.ReviewDTO;

/**
 * Servlet implementation class CounselsServlet
 */
public class CounselsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CounselsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		PrintWriter script = resp.getWriter();
		
		CounselDAO counselDAO = new CounselDAO();
		ArrayList<CounselDTO> counselDTO = new ArrayList<CounselDTO>();
		
		script.println("<상담소>");
		counselDTO = counselDAO.selectCounsel();
		JSONArray array = new JSONArray();
		for(int i = 0; i < counselDTO.size(); i++) {
			JSONObject obj = new JSONObject();
			obj.put("counsel_name", counselDTO.get(i).getCounsel_name());
			obj.put("star_avrg", counselDTO.get(i).getStar_avrg());
			obj.put("counsel_add", counselDTO.get(i).getCounsel_add());
			array.put(obj);
		}
		System.out.println(array.toString());
		script.println(array.toString());
		req.setAttribute("counsels", array);
		
        ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/counsels.jsp");
        dispatcher.forward(req, resp);
	}

}
