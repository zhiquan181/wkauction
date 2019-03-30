package com.chenzi.admin.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.dao.IUserDAO;
import com.chenzi.admin.vo.User;

public class UserDAO extends BaseDAO implements IUserDAO {	
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
	public int userDelete(int userid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		User u =(User)session.get(User.class,userid); 
		session.delete(u);
		tx.commit();
		session.close();
		return 1;
	}
	
	@Override
	public User userUpdateEdit(int userid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		User u =(User)session.get(User.class,userid);
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
		lu.setPassword(user.getPassword());
		lu.setBirthday(user.getBirthday());
		lu.setEmail(user.getEmail());
		lu.setPhone(user.getPhone());
		lu.setAddress(user.getAddress());
		lu.setSpecialty(user.getSpecialty());
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public int getTotalUserBykeyword(String keyword) {
		Session session = getSession();
		String hql = "from User u where u.username like '%"+keyword+"%'";
		Query query = session.createQuery(hql);
		List users=query.list();
		int totalSize = users.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getUserPagingBykeyword(String keyword, Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from User u where u.username like '%"+keyword+"%'";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List users=query.list();
		session.close();
		return users;
	}
	
}
