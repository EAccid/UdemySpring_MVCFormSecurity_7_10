package com.eaccid.spring.web.service;

import com.eaccid.spring.web.dao.Offer;
import com.eaccid.spring.web.dao.OffersDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("offersService")
public class OffersService {

    private OffersDao offersDao;

    @Autowired
    public void setOffersDao(OffersDao offersDao) {
        this.offersDao = offersDao;
    }

    public List<Offer> getCurrent() {
        return offersDao.getOffers();
    }

    @Secured({"ROLE_USER", "ROLE_ADMIN"})
    public void create(Offer offer) {
        offersDao.create(offer);
    }

    public boolean hasOffer(String username) {

        if (username == null) return false;

        List<Offer> offers = offersDao.getOffers(username);

        if (offers.size() == 0) return false;

        return true;
    }

    public Offer getOffer(String username) {

        if (username == null) {
            return null;
        }

        List<Offer> offers = offersDao.getOffers(username);

        if (offers.size() == 0) {
            return null;
        }

        return offers.get(0);
    }

    public void saveOrUpdate(Offer offer) {
        if (offer.getId() != 0) {
            offersDao.update(offer);
        }
        else {
            offersDao.create(offer);
        }

    }

    public void delete(int id) {
        offersDao.delete(id);
    }
}
