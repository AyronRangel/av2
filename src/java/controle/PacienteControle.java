/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.PacienteDAO;
import java.sql.SQLException;
import java.util.List;
import javax.swing.JList;
import modelo.Paciente;

/**
 *
 * @author user
 */
public class PacienteControle {
    public void gravar(Paciente p) throws SQLException{
        
        if(p.getId()==null){
        
            cadastrar(p);
            
        }else{
            alterar(p);
        
        }
    }
    private void cadastrar(Paciente p) throws SQLException{
        PacienteDAO dao = new PacienteDAO();
        dao.cadastrar(p);
        
        
    }
    public void remover(Long id) throws SQLException{
        PacienteDAO dao = new PacienteDAO();
        dao.excluir(id);
        
        
    }
    private void alterar(Paciente p) throws SQLException{
        PacienteDAO dao = new PacienteDAO();
        dao.alterar(p);
        
    }
    public List listarPacientes() throws SQLException{
        PacienteDAO dao = new PacienteDAO();        
        return dao.listarTodos();
        
    }
    public Paciente listarPacientePorId(Long id) throws SQLException{
       PacienteDAO dao = new PacienteDAO();
        return dao.listarPorId(id);
        
    }
}
