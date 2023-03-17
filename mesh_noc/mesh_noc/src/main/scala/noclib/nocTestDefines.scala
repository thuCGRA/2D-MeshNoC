package noclib

import spinal.core._
import spinal.core.sim.SpinalSimConfig


class fsdbView(val workobject: SpinalSimConfig, val caseName: String){
  import java.io._
  import scala.sys.process._
  val vcsName = new File(s"${workobject._workspacePath}").getAbsolutePath
  val vcsPath = vcsName+"/"+caseName
  val cmdVerdi = s"verdi -f $vcsPath/filelist.f -ssf $vcsPath/$caseName.fsdb"
  println("cmd: " + cmdVerdi)
  val message = cmdVerdi.!!
  println(message)
}


