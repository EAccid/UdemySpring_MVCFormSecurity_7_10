package com.eaccid.spring.web.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.*;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;
import java.util.List;

@Repository
@Transactional
@Component("offersDao")
public class OffersDao {

    private NamedParameterJdbcTemplate jdbc;

    @Autowired
    private SessionFactory sessionFactory;

    public OffersDao() {
        System.out.println("Successfully loaded offers DAO");
    }

    @Autowired
    public void setDataSource(DataSource jdbc) {
        this.jdbc = new NamedParameterJdbcTemplate(jdbc);
    }

    public Session session() {
        return sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("unchecked")
    public List<Offer> getOffers() {
        Criteria crit = session().createCriteria(Offer.class);
        crit.createAlias("user", "u").add(Restrictions.eq("u.enabled", true));
        return crit.list();
    }

    @SuppressWarnings("unchecked")
    public List<Offer> getOffers(String username) {

        Criteria crit = session().createCriteria(Offer.class);
        crit.createAlias("user", "u");
        crit.add(Restrictions.eq("u.enabled", true));
        crit.add(Restrictions.eq("u.username", username));
        return crit.list();

    }

    public void update(Offer offer) {
        session().update(offer);
    }

    public void create(Offer offer) {
        session().save(offer);
    }

    public boolean delete(int id) {
        MapSqlParameterSource params = new MapSqlParameterSource("id", id);

        return jdbc.update("delete from offers where id=:id", params) == 1;
    }

    public Offer getOffer(int id) {

        MapSqlParameterSource params = new MapSqlParameterSource();
        params.addValue("id", id);

        return jdbc.queryForObject("select * from offers, users where offers.username = users.username " +
                "and enabled = true and offers.id = :id", params, new OfferRowMapper());
    }

}
