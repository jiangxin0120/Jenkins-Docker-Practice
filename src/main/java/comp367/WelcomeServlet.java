package comp367;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalTime;

public class WelcomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");

        // Get the current hour of the day
        int hour = LocalTime.now().getHour();

        // Determine the appropriate greeting based on the hour
        String greeting;
        if (hour < 12) {
            greeting = "Good morning";
        } else {
            greeting = "Good afternoon";
        }


        String studentName = "Xin";

        // Write the greeting to the response
        resp.getWriter().write("<h2>" + greeting + ", " + studentName + ", Welcome to COMP367</h2>");
    }
}
