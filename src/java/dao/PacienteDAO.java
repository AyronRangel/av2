/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.SQLException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import modelo.Paciente;

/**
 *
 * @author user
 */
public class PacienteDAO {
    
    public void cadastrar(Paciente p) throws SQLException {
        
        EntityManager em = FabricaConexao.getConexao().createEntityManager();
        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();
        em.close();
        
    }

    
    public void alterar(Paciente p) throws SQLException {
        
        EntityManager em = FabricaConexao.getConexao().createEntityManager();
        em.getTransaction().begin();
        em.merge(p);
        em.getTransaction().commit();
        em.close();
    }

    
    public void excluir(Long id) throws SQLException {
        
        EntityManager em = FabricaConexao.getConexao().createEntityManager();
        em.getTransaction().begin();
        Paciente p = em.find(Paciente.class,id);
        if(p!=null)
            em.remove(p);
        em.getTransaction().commit();
        em.close();
    }

    public List listarTodos() throws SQLException {
        
        EntityManager em = FabricaConexao.getConexao().createEntityManager();
        TypedQuery<Paciente> consulta = em.createQuery("SELECT p FROM Paciente p",Paciente.class);
        List<Paciente> pacientes = consulta.getResultList();
        em.close();
        return pacientes;
    }


    
    public Paciente listarPorId(Long id) throws SQLException {
        
        EntityManager em = FabricaConexao.getConexao().createEntityManager();
        Paciente p = em.find(Paciente.class,id);        
        em.close();
        return p;
    }
}
