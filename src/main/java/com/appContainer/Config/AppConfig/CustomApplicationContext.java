package com.appContainer.Config.AppConfig;


import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.Properties;

@Configuration
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan("AppContainer")
public class CustomApplicationContext implements WebMvcConfigurer {

    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver internalResourceViewResolver = new InternalResourceViewResolver();
        internalResourceViewResolver.setPrefix("WEB-INF/view/");
        internalResourceViewResolver.setSuffix(".jsp");
        return internalResourceViewResolver;
    }

    // mapping static resources
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
                .addResourceHandler("/resources/**")
                .addResourceLocations("/resources/");
    }


    // Hibernate config
    @Bean
    public DataSource getDatasource() {

        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/web_customer_tracker?useSSL=false&amp");

        // I know these will be public -- this is intentional
        dataSource.setUsername("springstudent");
        dataSource.setPassword("springstudent");

        return dataSource;
    }

    @Bean
    public SessionFactory getSessionFactory() throws IOException {

        LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();
        sessionFactoryBean.setPackagesToScan("com/appContainer");

        //getHibernateProperties method is a private method
        sessionFactoryBean.setHibernateProperties(getHibernateProperties());
        sessionFactoryBean.setDataSource(getDatasource());
        sessionFactoryBean.afterPropertiesSet();

        return sessionFactoryBean.getObject();
    }


    private static Properties getHibernateProperties() {

        Properties hibernateProperties = new Properties();
        hibernateProperties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        hibernateProperties.put("hibernate.show_sql", true);
        // other properties

        return hibernateProperties;
    }

    @Bean
    public HibernateTransactionManager getTransactionManager() throws IOException{
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
        transactionManager.setSessionFactory(getSessionFactory());

        return transactionManager;
    }



}
