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

    private User user1 = new User("johnwpurcell", "John Purcell", "hellothere",
            "john@caveofprogramming.com", true, "ROLE_USER");
    private User user2 = new User("richardhannay", "Richard Hannay", "the39steps",
            "richard@caveofprogramming.com", true, "ROLE_ADMIN");
    private User user3 = new User("suetheviolinist", "Sue Black", "iloveviolins",
            "sue@caveofprogramming.com", true, "ROLE_USER");
    private User user4 = new User("rogerblake", "Rog Blake", "liberator",
            "rog@caveofprogramming.com", false, "user");

    @Before
    public void init() {
        JdbcTemplate jdbc = new JdbcTemplate(dataSource);

        jdbc.execute("delete from offers");
        jdbc.execute("delete from users");
    }

    @Test
    public void testCreateRetrieve() {
        usersDao.create(user1);

        List<User> users1 = usersDao.getAllUsers();

        Assert.assertEquals("One user should have been created and retrieved", 1, users1.size());

        Assert.assertEquals("Inserted user should match retrieved", user1, users1.get(0));

        usersDao.create(user2);
        usersDao.create(user3);
        usersDao.create(user4);

        List<User> users2 = usersDao.getAllUsers();

        Assert.assertEquals("Should be four retrieved users.", 4, users2.size());
    }

    // TODO - Reimplement this
    @Test
    public void testUsers() {
        User user = new User("olenabrygynets", "Olena Brygynets", "hellohello", "olena@eaccid.com", true, "ROLE_USER");

        usersDao.create(user);

        List<User> users = usersDao.getAllUsers();

        Assert.assertEquals("Number of users should be 1.", 1, users.size());

        Assert.assertTrue("User should exist.", usersDao.exists(user.getUsername()));

        Assert.assertEquals("Created user should be identical to retrieved user",
                user, users.get(0));

    }


}
