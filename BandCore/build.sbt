name := "BandCore"

version := "1.0-SNAPSHOT"

libraryDependencies ++= Seq(
  jdbc,
  anorm,
  cache
)

libraryDependencies += "org.mongodb" %% "casbah" % "2.6.3"

libraryDependencies += "org.springframework.data" % "spring-data-mongodb" % "1.3.3.RELEASE"

play.Project.playScalaSettings
