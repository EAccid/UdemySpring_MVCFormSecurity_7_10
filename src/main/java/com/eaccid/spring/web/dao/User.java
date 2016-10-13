package com.eaccid.spring.web.dao;

import com.eaccid.spring.web.validation.ValidEmail;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Entity
@Table(name = "users")
public class User {

    @NotBlank
    @Size(min = 8, max = 15)
    @Pattern(regexp = "^\\w{8,}$")
    @Id
    @Column(name = "username")
    private String username;

    @NotBlank
    @Pattern(regexp = "^\\S+$")
    @Size(min = 8, max = 15)
    private String password;

    @ValidEmail
    private String email;

    @NotBlank
    @Size(min = 8, max = 60)
    private String name;

    private boolean enabled = false;
    private String authority;


    public User() {

    }

    public User(String username, String name, String password, String email, boolean enabled, String authority) {
        this.username = username;
        this.name = name;
        this.password = password;
        this.email = email;
        this.enabled = enabled;
        this.authority = authority;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (enabled != user.enabled) return false;
        if (username != null ? !username.equals(user.username) : user.username != null) return false;
        if (email != null ? !email.equals(user.email) : user.email != null) return false;
        if (name != null ? !name.equals(user.name) : user.name != null) return false;
        return authority != null ? authority.equals(user.authority) : user.authority == null;

    }

    @Override
    public String toString() {
        return "User{" +
                "authority='" + authority + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", name='" + name + '\'' +
                ", enabled=" + enabled +
                '}';
    }

    @Override
    public int hashCode() {
        int result = username != null ? username.hashCode() : 0;
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (enabled ? 1 : 0);
        result = 31 * result + (authority != null ? authority.hashCode() : 0);
        return result;
    }
}
