addSbtPlugin("org.flywaydb" % "flyway-sbt" % "3.2.1")
libraryDependencies += "org.postgresql" % "postgresql" % "9.4-1201-jdbc41"
resolvers += "Flyway" at "http://flywaydb.org/repo"
