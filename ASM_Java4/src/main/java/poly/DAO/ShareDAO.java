package poly.DAO;

import javax.persistence.EntityManager;

import poly.entities.like;
import poly.entities.share;
import poly.utils.JpaUtils;

public class ShareDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	@Override
	protected void finalize() throws Throwable {
	em.close(); 
	// dong EntityManager khi DAO bi giai phong
	super.finalize();
	}
	public share create(share entity) {
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
}
