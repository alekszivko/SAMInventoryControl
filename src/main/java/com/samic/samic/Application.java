package com.samic.samic;

import com.samic.samic.config.ORCLConfig;
import com.samic.samic.data.repositories.RepositoryUser;
import com.vaadin.flow.component.dependency.NpmPackage;
import com.vaadin.flow.component.page.AppShellConfigurator;
import com.vaadin.flow.theme.Theme;
import jakarta.persistence.EntityListeners;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.sql.init.SqlDataSourceScriptDatabaseInitializer;
import org.springframework.boot.autoconfigure.sql.init.SqlInitializationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.sql.DataSource;

/**
 * The entry point of the Spring Boot application.
 * <p>
 * Use the @PWA annotation make the application installable on phones, tablets
 * and some desktop browsers.
 */
@SpringBootApplication
@NpmPackage(value = "@fontsource/inter",
            version = "4.5.0")
@Theme(value = "samic")
@ComponentScan(basePackages = {"com.samic.samic.data.repositories"})
@ComponentScan(basePackages = {"com.samic.samic.services"})
@Import(ORCLConfig.class)
@EntityListeners(AuditingEntityListener.class)
public class Application implements AppShellConfigurator{

    public static void main(String[] args){
        SpringApplication.run(Application.class, args);
    }


    @Bean
    SqlDataSourceScriptDatabaseInitializer dataSourceScriptDatabaseInitializer(DataSource dataSource, SqlInitializationProperties properties, RepositoryUser repositoryUser){
        return new SqlDataSourceScriptDatabaseInitializer(dataSource, properties){
            @Override
            public boolean initializeDatabase(){
                if(repositoryUser.count() == 0L){
                    return super.initializeDatabase();
                }
                return false;
            }
        };
    }
}
