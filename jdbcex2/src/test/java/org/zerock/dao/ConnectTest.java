package org.zerock.dao;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;

public class ConnectTest {
  @Test
  public void testConennection() throws Exception{
    Class.forName("org.mariadb.jdbc.Driver");

    Connection connection = DriverManager.getConnection(
            "jdbc:mariadb://localhost:3306/webdb",
            "webuser",
            "webuser");
    Assertions.assertNotNull(connection);
  }

  @Test
  public void testHikariCP() throws Exception{
    HikariConfig config = new HikariConfig();
    config.setJdbcUrl("jdbc:mariadb://localhost:3306/webdb");
    config.setUsername("webuser");
    config.setPassword("webuser");
    config.addDataSourceProperty("cachePrepStmts", "true");
    config.addDataSourceProperty("prepStmtsCacheSize", "250");
    config.addDataSourceProperty("prepStmtsCacheSqlLimit", "2048");

    HikariDataSource ds = new HikariDataSource(config);
    Connection connection = ds.getConnection();

    connection.close();
  }
}
