/** 
 * The top dataSource holds configuration options for ALL
 * environments... I'm presuming you want PostgreSQL in all
 * your environments but you may want to use the default
 * Hypersonic database in development and testing instead.
 */
dataSource {
 pooled = true
 driverClassName = "org.postgresql.Driver"
        dialect = org.hibernate.dialect.PostgreSQLDialect
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
 development {
  dataSource {
                        // one of 'create', 'create-drop','update'
   dbCreate = "create-drop" 
                        url="jdbc:postgresql://localhost:5432/dev"
                        username = "dev"
                        password = "dev"
  }
 }
 test {
  dataSource {
   dbCreate = "update"
                        url="jdbc:postgresql://localhost:5432/test"
   driverClassName = "org.postgresql.Driver"
                        username = "tester"
                        password = "tester"
  }
 }
 production {
  dataSource {
   dbCreate = "update"
                        url="jdbc:postgresql://localhost:5432/grails"
                        username = "grails"
                        password = "grails"
  }
 }
}