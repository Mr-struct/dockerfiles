addSbtPlugin("org.flywaydb" % "flyway-sbt" % "4.0")
libraryDependencies += "org.postgresql" % "postgresql" % "9.4-1201-jdbc41"
libraryDependencies += "org.yaml" % "snakeyaml" % "1.5"
resolvers += "Flyway" at "https://flywaydb.org/repo"
