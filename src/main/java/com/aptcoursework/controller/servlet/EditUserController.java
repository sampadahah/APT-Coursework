
  package com.aptcoursework.controller.servlet;
  
  import com.aptcoursework.controller.dao.UserDAO; import
  com.aptcoursework.model.User;
  
  import javax.servlet.ServletException; import
  javax.servlet.annotation.WebServlet; import javax.servlet.http.*; import
  java.io.IOException;
  
  @WebServlet("/EditUserController") 
  public class EditUserController extends HttpServlet { 
	  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
		  try { 
			  int userId = Integer.parseInt(request.getParameter("id")); // ?id=1
			  UserDAO dao = new UserDAO(); 
			  User u = dao.getUserById(userId);
		  
			  if (u != null) { 
				  request.setAttribute("editUser", u);
				  request.getRequestDispatcher("/pages/editUser.jsp").forward(request,response); 
			  } else { 
				  request.setAttribute("message", "User not found");
			  } 
		  } catch (Exception e) { 
			  e.printStackTrace();
			  request.setAttribute("message","An error occurred while fetching the user.");
			  request.getRequestDispatcher("/pages/ErrorPage.jsp").forward(request, response);
		  } 
	}
}
		  
		 