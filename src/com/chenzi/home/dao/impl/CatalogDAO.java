package com.chenzi.home.dao.impl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.vo.Catalog;
import com.chenzi.home.dao.ICatalogDAO;

public class CatalogDAO extends BaseDAO implements ICatalogDAO{

	@Override
	public List getLimitCatalog() {
		Session session = getSession();
		String hql = "from Catalog u order by id asc";
		Query query = session.createQuery(hql);
	    query.setMaxResults(50);
		List links=query.list();
		session.close();
		return links;
	}
}
