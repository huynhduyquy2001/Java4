package poly.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import poly.entities.users;
import poly.entities.videos;
import poly.utils.JpaUtils;

public class usersDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	@Override
	protected void finalize() throws Throwable {
	em.close(); 
	// dong EntityManager khi DAO bi giai phong
	super.finalize();
	}
	public List<users> findAll(){
		String jpql = "SELECT obj FROM users obj";
		TypedQuery<users> query = em.createQuery(jpql, users.class);
		List<users> list = query.getResultList();
		return list;
	}
	public boolean findEmail(String email){
		String jpql = "SELECT obj FROM users obj where obj.email=:email";
		TypedQuery<users> query = em.createQuery(jpql, users.class);
		query.setParameter("email", email);
		List<users> list = query.getResultList();
		if(list.size()==0) {
			return false;
		}else {
			return true;
		}
	}
	public users findBySdt(String sdt) {
		users entity = em.find(users.class, sdt);
		return entity;
	}
	
	public long getTotalUser() {
		String jpql = "SELECT count(obj.sdt) FROM users obj";
		TypedQuery<Long> query = this.em.createQuery(jpql, Long.class);
		return query.getSingleResult();
	}
	public users create(users entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
			return null;
		}
		return entity;
	}
	public users update(users entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
		return entity;
	}
	public users remove(String id) {
		users entity = this.findBySdt(id);
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
		return entity;
	}
	
}
