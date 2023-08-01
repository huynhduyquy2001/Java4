package poly.entities;


import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.StoredProcedureParameter;


@NamedStoredProcedureQueries({
@NamedStoredProcedureQuery(
		name = "TkLuotThich.sp_timTheoTen",
		procedureName = "sp_TkLuotLike",
		resultClasses = {TkLuotThich.class},
		parameters = @StoredProcedureParameter(
		name="chuDe",  type = String.class)
)
})
@Entity

public class TkLuotThich {
	
	@Id
	String group;
	Long likes;
	Date newest;
	Date oldest;
	public TkLuotThich() {
	}
	public TkLuotThich(String group, Long likes, Date newest, Date oldest) {
	this.group = group;
	this.likes = likes;
	this.newest = newest;
	this.oldest = oldest;
}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public Long getLikes() {
		return likes;
	}
	public void setLikes(Long likes) {
		this.likes = likes;
	}
	public Date getNewest() {
		return newest;
	}
	public void setNewest(Date newest) {
		this.newest = newest;
	}
	public Date getOldest() {
		return oldest;
	}
	public void setOldest(Date oldest) {
		this.oldest = oldest;
	}
}
