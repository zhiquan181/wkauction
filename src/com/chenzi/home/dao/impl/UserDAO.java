package com.chenzi.home.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.vo.Goods;
import com.chenzi.admin.vo.User;
import com.chenzi.home.dao.IUserDAO;

public class UserDAO extends BaseDAO implements IUserDAO{

	@Override
	public List getLimitUser() {
		Session session = getSession();
		String hql = "from User u order by userid asc";
		Query query = session.createQuery(hql);
	    query.setMaxResults(16);
		List users=query.list();
		session.close();
		return users;
	}

	@Override
	public int userInsert(User user) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		User lu = new User(user.getUsername(),user.getPassword(),user.getEmail(),user.getPhone(),user.getBirthday(),user.getAddress(),user.getSpecialty());
		session.save(lu);
       // session.flush();
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public User validateUser(String username,String password) {
		String sql="from User u where u.username=? and u.password=?";
		Session session=getSession();
		Query q=session.createQuery(sql);
		q.setParameter(0, username);
		q.setParameter(1, password);
		List<?> users=q.list();
		if(users.isEmpty()){
			//System.out.println("NULL");
			return null;
		}
		User u = (User)users.get(0);
		session.close();
		return u;
	}

	@Override
	public User getUserByuserid(int userid) {
		Session session = getSession();
		String hql = "from User u where u.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, userid);
		List<?> users=query.list();
		if(users.isEmpty()){
			return null;
		}
		User u = (User)users.get(0);
		session.close();
		return u;
	}

	@Override
	public int userUpdate(User user) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		User lu =(User)session.get(User.class,user.getId());
		lu.setId(user.getId());
		lu.setUsername(user.getUsername());
		lu.setSex(user.getSex());
		lu.setPassword(user.getPassword());
		lu.setBirthday(user.getBirthday());
		lu.setEmail(user.getEmail());
		lu.setPhone(user.getPhone());
		lu.setSpecialty(user.getSpecialty());
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public int getTotalUser() {
		Session session = getSession();
		String hql = "from User u";
		Query query = session.createQuery(hql);
		List users=query.list();
		int totalSize = users.size();
		session.close();
		return totalSize;
	}

	@Override
	public List getUserPaging(Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from User u";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List users=query.list();
		session.close();
		return users;
	}

	@Override
	public int userUpdateImg(User user) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		User lu =(User)session.get(User.class,user.getId());
		lu.setId(user.getId());
		lu.setPicture(user.getPicture());
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public String getUserheadimgByuserid(Integer userid) {
		Session session = getSession();
		User lu =(User)session.get(User.class,userid);
		//System.out.println(lu.getPicture());
		session.close();
		return lu.getPicture();
	}

	@Override
	public int productInsert(User u, Goods goods) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Goods g = new Goods(goods.getTitle(),goods.getRemark(),u,1,new Date(),goods.getEndtime(),goods.getPicture(),goods.getPrice(),goods.getTypename());
		session.save(g);
		tx.commit();
        session.close();
		return 1;
	}

	@Override
	public List getGoodsinfoByuserid(int userid) {
		//System.out.println(userid);
		Session session = getSession();
		String sql="select * from Goods g where g.userid=?";
		Query q = session.createSQLQuery(sql);
		q.setParameter(0,userid);
		List<?> user_goods=q.list();
		//System.out.println("user_goods"+user_goods);
		session.close();
		return user_goods;
	}

	@Override
	public Goods getGoodBygoodid(int goodid) {
		Session session = getSession();
		String hql = "from Goods g where g.id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, goodid);
		List<?> goods=query.list();
		Goods at = (Goods)goods.get(0);
		session.close();
		return at;
	}

	@Override
	public List getLimitproducts() {
		Session session = getSession();
		String hql = "from Goods g order by createat desc";
		Query query = session.createQuery(hql);
	    query.setMaxResults(8);
		List products=query.list();
		session.close();
		return products;
	}
	
	@Override
	public int getTotalGoods(String keyword,String typename) {
		Session session = getSession();
		if(keyword==""){
			System.out.println("1");
			String hql = "from Goods g where g.typename like '%"+typename+"%'";
			Query query = session.createQuery(hql);
			List goods=query.list();
			int totalSize = goods.size();
			session.close();
			return totalSize;
		}
		else{
			System.out.println("2");
			String hql = "from Goods g where g.title like '%"+keyword+"%'";
			Query query = session.createQuery(hql);
			List goods=query.list();
			int totalSize = goods.size();
			session.close();
			return totalSize;
		}
	}

	@Override
	public List getTotalGoodsPaging(Integer currentPage,String keyword,String typename,int pageSize) {
		Session session = getSession();
		if(keyword==null||keyword==""){
			String hql = "from Goods g where g.typename like '%"+typename+"%'";
			Query query = session.createQuery(hql);
			//	确定游标
			int startRow = (currentPage-1)*pageSize;
			query.setFirstResult(startRow);
			query.setMaxResults(pageSize);
			List goods=query.list();
			session.close();
			return goods;
		}
		else{
			String hql = "from Goods g where g.title like '%"+keyword+"%'";
			Query query = session.createQuery(hql);
			//	确定游标
			int startRow = (currentPage-1)*pageSize;
			query.setFirstResult(startRow);
			query.setMaxResults(pageSize);
			List goods=query.list();
			session.close();
			return goods;
		}
	}
}
