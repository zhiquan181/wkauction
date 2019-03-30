package com.chenzi.admin.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.dao.ICatalogDAO;
import com.chenzi.admin.vo.Auser;
import com.chenzi.admin.vo.Catalog;

public class CatalogDAO extends BaseDAO implements ICatalogDAO {	
	@Override
	public int getTotalCatalog() {
		Session session = getSession();
		String hql = "from Catalog u";
		Query query = session.createQuery(hql);
		List catalogs=query.list();
		int totalSize = catalogs.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getCatalogPaging(Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Catalog u Order By u.id desc";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List catalogs=query.list();
		session.close();
		return catalogs;
	}
	
	@Override
	public int catalogInsert(Catalog catalog) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();

		Catalog lu = new Catalog(catalog.getCatalogname());
		session.save(lu);

		// session.flush();
		tx.commit();
        session.close();
		return 1;
	}
	
	@Override
	public int catalogDelete(int catalogid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Catalog u =(Catalog)session.get(Catalog.class,catalogid); 
		session.delete(u);
		tx.commit();
		session.close();
		return 1;
	}
	
	@Override
	public Catalog catalogUpdateEdit(int catalogid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Catalog u =(Catalog)session.get(Catalog.class,catalogid);
		session.close();
		return u;
	}

	@Override
	public int catalogUpdate(Catalog catalog) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Catalog cata = (Catalog)session.get(Catalog.class,catalog.getId());
		System.out.println("artcList："+cata);
		if(cata!=null){
			cata.setId(catalog.getId());
			cata.setCatalogname(catalog.getCatalogname());
		}
		else{
			return 0;
		}
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public int getTotalCatalogBykeyword(String keyword) {
		Session session = getSession();
		String hql = "from Catalog u where u.catalogname like '%"+keyword+"%'";
		Query query = session.createQuery(hql);
		List catalogs=query.list();
		int totalSize = catalogs.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getCatalogPagingBykeyword(String keyword, Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Catalog u where u.catalogname like '%"+keyword+"%' Order By u.id desc";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List catalogs=query.list();
		session.close();
		return catalogs;
	}
	
}
