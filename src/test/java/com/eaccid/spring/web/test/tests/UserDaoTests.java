package com.eaccid.spring.web.test.tests;

import com.eaccid.spring.web.dao.User;
import com.eaccid.spring.web.dao.UsersDao;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.util.List;

@ActiveProfiles("dev")
@ContextConfiguration(locations = {
        "classpath:com.eaccid.spring.web.config/dao-context.xml",
        "classpath:com.eaccid.spring.web.config/security-context.xml",
        "classpath:com.eaccid.spring.web.test.config/datasource.xml"})
@RunWith(SpringJUnit4ClassRunner.class)
public class UserDaoTests {

    @Autowired
    private UsersDao usersDao;
    @Autowired
    private DataSource dataSource;

    @Before
    public void init() {
        JdbcTemplate jdbc = new JdbcTemplate(dataSource);
        jdbc.execute("DELETE FROM users");
    }

    @Test
    public void testCreateUser() {

        User user = new User("olena", "Olena B","hellohello", "olena@eaccid.com", true, "ROLE_USER");
        Assert.assertTrue("User creation should return true", usersDao.create(user));

        List<User> users = usersDao.getAllUsers();
        Assert.assertEquals("Number of users should be 1", users.size(), 1);

        Assert.assertTrue("User should exist.", usersDao.exists(user.getUsername()));

        Assert.assertEquals("Created user should be identical to retrieved user", user, users.get(0));


    }


}
