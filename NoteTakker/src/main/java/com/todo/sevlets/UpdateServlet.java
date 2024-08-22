
package com.todo.sevlets;

import com.todo.entities.Note;
import com.todo.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import org.hibernate.Session;
import org.hibernate.Transaction;

@WebServlet(name="UpdateServlet", urlPatterns="/UpdateServlet")
public class UpdateServlet extends HttpServlet {

 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
        try{
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        int noteId=Integer.parseInt(request.getParameter("noteId").trim());
        Session s = FactoryProvider.getFactory().openSession();
        Transaction tx = s.beginTransaction();
        Note note =(Note)s.get(Note.class, noteId);
        note.setTitle(title);
        note.setContent(content);
        note.setAddedDate(new Date());
        tx.commit();
        s.close();
        
        response.sendRedirect("all_notes.jsp");
        
        }catch(Exception e){}
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
