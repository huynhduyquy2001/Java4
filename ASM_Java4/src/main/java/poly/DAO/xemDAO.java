package poly.DAO;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;


import poly.entities.like;
import poly.entities.users;
import poly.entities.videos;
import poly.entities.xem;
import poly.utils.JpaUtils;

public class xemDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	@Override
	protected void finalize() throws Throwable {
	em.close();
	super.finalize();
	}
	public List<xem> findByUser(String key){
		String jpql = "SELECT o FROM xem o WHERE o.user.sdt=:sdt ORDER BY o.ngayXem desc";
		TypedQuery<xem> query = em.createQuery(jpql, xem.class);
		query.setParameter("sdt", key);
		List<xem> list = query.getResultList();
		//users user = em.find(users.class, key);
		//List<xem> list = user.getXem();
		return list;
	}
	
	public users findById(String sdt) {
		users entity = em.find(users.class, sdt);
		return entity;
	}
	public xem remove( String sdt, String maVideo){
		String jpql = "SELECT v FROM xem v WHERE v.video.maVideo = ?0 and v.user.sdt=?1";
		TypedQuery<xem> query = em.createQuery(jpql, xem.class);
		query.setParameter(0, maVideo);
		query.setParameter(1, sdt);
		xem entity = query.getSingleResult();
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
		return entity;
	}
	public boolean findOnlyEntity( String sdt, String maVideo){
			String jpql = "SELECT v FROM xem v WHERE v.video.maVideo = ?0 and v.user.sdt=?1";
			TypedQuery<xem> query = em.createQuery(jpql, xem.class);
			query.setParameter(0, maVideo);
			query.setParameter(1, sdt);
			List<xem> list =  query.getResultList();
			if(list.size()==0) {
				return false;
			}else {
				return true;
			}
			
	}
	
	public xem create(xem entity) {
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
	public xem update( String sdt, String maVideo){
		String jpql = "SELECT v FROM xem v WHERE v.video.maVideo = ?0 and v.user.sdt=?1";
		TypedQuery<xem> query = em.createQuery(jpql, xem.class);
		query.setParameter(0, maVideo);
		query.setParameter(1, sdt);
		xem entity = query.getSingleResult();
		Date d = new Date();
		entity.setNgayXem(d);
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
		return entity;
	}
}
