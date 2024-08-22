
package com.todo.sevlets;

import com.todo.entities.Note;
import com.todo.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name="SaveNoteServlet", urlPatterns="/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
        try{
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        
        Note note = new Note(title, content, new Date());
        
        //System.out.println(note.getId()+":"+note.getTitle());
       
        //hibernate:save()
        Session s = FactoryProvider.getFactory().openSession();
        Transaction tx = s.beginTransaction();
        s.save(note);
        tx.commit();
        s.close();
        
        PrintWriter out = response.getWriter();
        out.println("<h1 style='text-align: center;'>Note is added</h1>");
        out.println("<h1 style='text-align: center;'><a href='all_notes.jsp'>View all notes</a></h1>");
        
        }catch(Exception e){
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
