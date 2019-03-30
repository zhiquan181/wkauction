package com.chenzi.home.dao.impl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.vo.Link;
import com.chenzi.home.dao.ILinkDAO;

public class LinkDAO extends BaseDAO implements ILinkDAO{

	@Override
	public List getLimitLink() {
		Session session = getSession();
		String hql = "from Link u order by linkid asc";
		Query query = session.createQuery(hql);
	    query.setMaxResults(50);
		List links=query.list();
		session.close();
		return links;
	}
}
