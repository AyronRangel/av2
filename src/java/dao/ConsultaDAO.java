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
import modelo.Consulta;

/**
 *
 * @author user
 */
public class ConsultaDAO {
    public void cadastrar(Consulta c) throws SQLException {
        
        EntityManager em = FabricaConexao.getConexao().createEntityManager();
        em.getTransaction().begin();
        em.persist(c);
        em.getTransaction().commit();
        em.close();
        
    }

    
    public void alterar(Consulta c) throws SQLException {
        
        EntityManager em = FabricaConexao.getConexao().createEntityManager();
        em.getTransaction().begin();
        em.merge(c);
        em.getTransaction().commit();
        em.close();
    }

    
    public void excluir(Long id) throws SQLException {
        
        EntityManager em = FabricaConexao.getConexao().createEntityManager();
        em.getTransaction().begin();
        Consulta c = em.find(Consulta.class,id);
        if(c!=null)
            em.remove(c);
        em.getTransaction().commit();
        em.close();
    }

    
    public List listarTodos() throws SQLException {
        
        EntityManager em = FabricaConexao.getConexao().createEntityManager();
        TypedQuery<Consulta> consulta = em.createQuery("SELECT c FROM Consulta c",Consulta.class);
        List<Consulta> categorias = consulta.getResultList();
        em.close();
        return categorias;
    }

    
    public Consulta listarPorId(Long id) throws SQLException {
        
        EntityManager em = FabricaConexao.getConexao().createEntityManager();
        Consulta c = em.find(Consulta.class, id);        
        em.close();
        return c;
    }
}
