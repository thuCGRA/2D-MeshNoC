ThisBuild / version := "0.1.0-SNAPSHOT"
ThisBuild / scalaVersion := "2.11.12"

val spinalVersion = "1.7.3"
val spinalCore = "com.github.spinalhdl" %% "spinalhdl-core" % spinalVersion
val spinalLib = "com.github.spinalhdl" %% "spinalhdl-lib" % spinalVersion
val spinalIdslPlugin = compilerPlugin("com.github.spinalhdl" %% "spinalhdl-idsl-plugin" % spinalVersion)


lazy val root = (project in file("."))
  .settings(
    name := "mesh_noc",
    libraryDependencies ++= Seq(spinalCore, spinalLib, spinalIdslPlugin)
  )

fork := true
