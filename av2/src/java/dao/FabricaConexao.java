/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author user
 */
public class FabricaConexao {
     private static EntityManagerFactory emf;
    public static EntityManagerFactory getConexao(){
        if(emf==null){
            emf=Persistence.createEntityManagerFactory("AvaliacaoN2PU");
        }
        return emf;
    }
}
