/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controle;

import dao.ConsultaDAO;
import java.sql.SQLException;
import java.util.List;
import modelo.Consulta;

/**
 *
 * @author user
 */
public class ConsultaControle {
    public void gravar(Consulta c) throws SQLException{
        
        if(c.getId()==null){
        
            cadastrar(c);
            
        }else{
            alterar(c);
        
        }
    }
    private void cadastrar(Consulta c) throws SQLException{
        ConsultaDAO dao = new ConsultaDAO();
        dao.cadastrar(c);
        
        
    }
    public void remover(Long id) throws SQLException{
        ConsultaDAO dao = new ConsultaDAO();
        dao.excluir(id);
        
        
    }
    private void alterar(Consulta c) throws SQLException{
        ConsultaDAO dao = new ConsultaDAO();
        dao.alterar(c);
        
    }
    public List listarConsultas() throws SQLException{
        ConsultaDAO dao = new ConsultaDAO();        
        return dao.listarTodos();
        
    }
    public Consulta listarConsultaPorId(Long id) throws SQLException{
        ConsultaDAO dao = new ConsultaDAO();        
        return dao.listarPorId(id);
        
    }
}
