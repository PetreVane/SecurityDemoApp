package com.appContainer.config.Security;


import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {


    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {

        UserBuilder users = User.withDefaultPasswordEncoder();
        auth.inMemoryAuthentication()
                .withUser(users.username("petre").password("test123").roles("EMPLOYEE"))
                .withUser(users.username("ioana").password("test123").roles("MANAGER"))
                .withUser(users.username("daniel").password("test123").roles("ADMIN"));

    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        // secures all REST endpoints under "/api/customers"
        // and adds following security authorizations
        //
        // EMPLOYEE role can perform following
        // 1. Get a list of all customers.  GET /api/customers
        // 2. Get a single customer.  GET /api/customers/{customerId}

        //
        // MANAGER role can perform following
        // 1. Add a new customer.  POST /api/customers
        // 2. Update an existing customer.  PUT /api/customers
        //

        //
        // ADMIN role can perform following
        // 1. Delete a customer.  DELETE /api/customers/{customerId}
        //


        http.authorizeRequests().antMatchers("/resources/**", "/static/**","/webjars/**").permitAll()
                .antMatchers(HttpMethod.GET, "/api/customers").hasRole("EMPLOYEE")
                .antMatchers(HttpMethod.GET, "/api/customers/**").hasRole("EMPLOYEE")
                .antMatchers(HttpMethod.POST, "/api/customers").hasAnyRole("MANAGER", "ADMIN")
                .antMatchers(HttpMethod.POST, "/api/customers/**").hasAnyRole("MANAGER", "ADMIN")
                .antMatchers(HttpMethod.PUT, "/api/customers").hasAnyRole("MANAGER", "ADMIN")
                .antMatchers(HttpMethod.PUT, "/api/customers/**").hasAnyRole("MANAGER", "ADMIN")
                .antMatchers(HttpMethod.DELETE, "/api/customers/**").hasRole("ADMIN")
                .anyRequest().authenticated()
                .and()
                .formLogin()
                .loginPage("/showLoginPage")
                .loginProcessingUrl("/authenticateUser")
                .permitAll()
                .and()
                .logout()
                .permitAll()
                .and()
                .httpBasic();
//                .and()
//                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);

    }



}
