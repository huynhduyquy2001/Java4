package poly.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import poly.entities.videos;
import poly.utils.JpaUtils;


public class videosDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	@Override
	protected void finalize() throws Throwable {
	em.close(); // dong EntityManager khi DAO bi giai phong
	super.finalize();
	}
	public List<videos> findAll(){
		String jpql = "SELECT v FROM videos v ORDER BY v.luotXem desc";
		TypedQuery<videos> query = em.createQuery(jpql, videos.class);
		List<videos> list = query.getResultList();
		return list;
	}
	public List<String> findAllName(){
		String jpql = "SELECT v.chuDe FROM videos v";
		TypedQuery<String> query = em.createQuery(jpql, String.class);
		List<String> list = query.getResultList();
		return list;
	}
	
	public List<videos> findMusic(){
		String theLoai="âm nhạc";
		String jpql = "SELECT v FROM videos v WHERE v.theLoai = :theLoai";
		TypedQuery<videos> query = em.createQuery(jpql, videos.class);
		query.setParameter("theLoai", theLoai);
		List<videos> list = query.getResultList();
		return list;
	}
	
	public List<videos> findTrailer(){
		String theLoai="trailer";
		String jpql = "SELECT v FROM videos v WHERE v.theLoai = :theLoai";
		TypedQuery<videos> query = em.createQuery(jpql, videos.class);
		query.setParameter("theLoai", theLoai);
		List<videos> list = query.getResultList();
		return list;
	}
	
	public List<videos> findCartoon(){
		String theLoai="hoạt hình";
		String jpql = "SELECT v FROM videos v WHERE v.theLoai = :theLoai";
		TypedQuery<videos> query = em.createQuery(jpql, videos.class);
		query.setParameter("theLoai", theLoai);
		List<videos> list = query.getResultList();
		return list;
	}
	
	public List<videos> findByName(String key ){
		String jpql = "SELECT v FROM videos v WHERE v.chuDe like ?0";
		TypedQuery<videos> query = em.createQuery(jpql, videos.class);
		query.setParameter(0, "%"+key+"%");
		List<videos> list = query.getResultList();
		return list;
	}
	public List<videos> findByNameandTheLoai(String key, String theLoai ){
		String jpql = "SELECT v FROM videos v WHERE v.chuDe like ?0 and v.theLoai like ?1";
		TypedQuery<videos> query = em.createQuery(jpql, videos.class);
		query.setParameter(0, "%"+key+"%");
		query.setParameter(1, "%"+theLoai+"%");
		List<videos> list = query.getResultList();
		return list;
	}
	public videos findById(String id) {
		videos entity = em.find(videos.class, id);
		return entity;
	}
	public videos create(videos entity) {
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

	public videos update(videos entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
		return entity;
	}

	public videos remove(String id) {
		videos entity = this.findById(id);
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
