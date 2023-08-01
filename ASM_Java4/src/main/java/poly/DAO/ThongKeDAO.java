package poly.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import poly.entities.TkLuotThich;
import poly.entities.like;
import poly.entities.share;
import poly.entities.users;
import poly.utils.JpaUtils;

public class ThongKeDAO {
	private EntityManager em = JpaUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
		// dong EntityManager khi DAO bi giai phong
		super.finalize();
	}

	public List<TkLuotThich> findAll() {
		String jpql = "select  new TkLuotThich(o.video.chuDe,count(o), max(o.ngayLike),min(o.ngayLike)) from like o group by o.video.chuDe";
		TypedQuery<TkLuotThich> query = em.createQuery(jpql, TkLuotThich.class);
		List<TkLuotThich> list = query.getResultList();
		return list;
	}

	public List<like> findByName(String key) {
		List<like> list = null;
		try {
			StoredProcedureQuery query = em.createNamedStoredProcedureQuery("TkLuotThich.timTheoTen");
			query.setParameter("chuDe", "%" + key + "%");
			list = query.getResultList();
		} catch (Exception e) {
			// TODO: handle exception
		}

		return list;
	}

	public List<like> findUserByVideo(String key) {
		String jpql = "SELECT o FROM like o WHERE o.video.chuDe like ?0";
		TypedQuery<like> query = em.createQuery(jpql, like.class);
		query.setParameter(0, "%"+key+"%");
		List<like> list = query.getResultList();
		return list;
	}

	public List<share> findUserShareByVideo(String key) {
		String jpql = "SELECT o FROM share o WHERE o.video.chuDe like ?0";
		TypedQuery<share> query = em.createQuery(jpql, share.class);
		query.setParameter(0, "%"+key+"%");
		List<share> list = query.getResultList();
		return list;
	}
}
