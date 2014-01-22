name := "BandCore"

version := "1.0-SNAPSHOT"

libraryDependencies ++= Seq(
  jdbc,
  anorm,
  cache
)

libraryDependencies += "org.mongodb" %% "casbah" % "2.6.3"

libraryDependencies ++= Seq(
  "org.mongodb" % "mongo-java-driver" % "2.6",
  "org.springframework" % "spring-core" % "3.0.5.RELEASE",
  "org.springframework" % "spring-context" % "3.0.5.RELEASE",
  "org.springframework.data" % "spring-data-mongodb" % "1.3.3.RELEASE",
  "cglib" % "cglib" % "2.2"
)

play.Project.playScalaSettings
