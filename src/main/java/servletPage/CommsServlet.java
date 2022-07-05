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
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import community.CommDAO;
import community.CommDTO;

/**
 * Servlet implementation class ReviewsServlet
 */
public class CommsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 /**
     * @see HttpServlet#HttpServlet()
     */
	public CommsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		PrintWriter script = resp.getWriter();
		
		CommDAO commDAO = new CommDAO();
		ArrayList<CommDTO> commDTO = new ArrayList<CommDTO>();
		
		commDTO = commDAO.getComms();
		JSONArray array = new JSONArray();
		
		for(int i = 0; i < commDTO.size(); i++) {
		JSONObject obj = new JSONObject();
		obj.put("postwriter", commDTO.get(i).getPost_writer());
		obj.put("posttitle", commDTO.get(i).getPost_title());
		obj.put("postcont", commDTO.get(i).getPost_cont());
		array.put(obj);
		}
		script.println(array.toString());
		req.setAttribute("comms", array);
		
        ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("CommPostView.jsp");
        dispatcher.forward(req, resp);
	}
}
